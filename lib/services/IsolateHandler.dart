import 'dart:isolate';

class IsolateHandler<T> {
  Isolate? _isolate;
  ReceivePort? _receivePort;
  SendPort? _sendPort;
  late Function() operation;
  Function(T)? onResult;
  Function? onError;

  IsolateHandler<T> setOperation(Function() function) {
    this.operation = function;
    return this;
  }

  IsolateHandler<T> setOnResult(Function(T)? function) {
    this.onResult = function;
    return this;
  }

  IsolateHandler<T> setOnError(Function? function) {
    this.onError = function;
    return this;
  }

  void start() async {
    _receivePort = ReceivePort();
    _isolate = await Isolate.spawn(_isolateEntry, _receivePort!.sendPort);
    _receivePort!.listen((data) {
      if (data is SendPort) {
        _sendPort = data;
        _sendPort?.send(operation);
      } else if (data is T) {
        onResult?.call(data);
      } else if (data is Error && onError != null) {
        onError!(data);
      }
    });
  }

  void stop() {
    _isolate?.kill(priority: Isolate.immediate);
    _isolate = null;
    _receivePort?.close();
    _receivePort = null;
  }

  static void _isolateEntry(SendPort sendPort) {
    ReceivePort receivePort = ReceivePort();
    sendPort.send(receivePort.sendPort);
    receivePort.listen((message) {
      if (message is Function) {
        try {
          Future(() => message()).then((value) {
            sendPort.send(value); // Handle both sync and async uniformly
          }).catchError((e) {
            sendPort.send(Error()); // Send an error if the operation fails
          });
        } catch (e) {
          sendPort.send(Error());
        }
      }
    });
  }
}