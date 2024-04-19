class Utils {
  static clearString (String str) {
    var withDiacritics = 'áéíóúÁÉÍÓÚñÑüÜ';
    var withoutDiacritics = 'aeiouAEIOUnNuu';

    for (int i = 0; i < withDiacritics.length; i++) {
      str = str.replaceAll(withDiacritics[i], withoutDiacritics[i]).toLowerCase();
    }
    return str.replaceAll(RegExp('[\\p{P}]', unicode: true), '');
  }
}