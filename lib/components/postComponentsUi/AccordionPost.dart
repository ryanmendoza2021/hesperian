import 'package:flutter/material.dart';

class CustomAccordionSection {
  final Widget header;
  final Widget content;
  bool isExpanded;

  CustomAccordionSection({
    required this.header,
    required this.content,
    this.isExpanded = false,
  });
}

class CustomAccordionList extends StatefulWidget {
  final List<CustomAccordionSection> sections;
  final EdgeInsets margin;

  const CustomAccordionList({
    super.key,
    required this.sections,
    this.margin = const EdgeInsets.only(bottom: 20),
  });

  @override
  CustomAccordionListState createState() => CustomAccordionListState();
}

class CustomAccordionListState extends State<CustomAccordionList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: widget.margin,
        child: ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              widget.sections[index].isExpanded = isExpanded;
            });
          },
          children: widget.sections.map<ExpansionPanel>((CustomAccordionSection section) {
            return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: section.header,
                );
              },
              body: Container(
                padding: const EdgeInsets.all(10),
                child: section.content,
              ),
              isExpanded: section.isExpanded,
              canTapOnHeader: true,
            );
          }).toList(),
          animationDuration: const Duration(milliseconds: 100),
        ),
      ),
    );
  }
}
