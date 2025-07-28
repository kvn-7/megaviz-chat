extension AppStringExtension on String {
  String toCamelCase() {
    final input = this;

    final words = input.split(' ');

    // Capitalize the first letter of each word and make all others lowercase
    final capitalizedWords = words.map((word) {
      if (word.isEmpty) return '';
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    });

    // Join the words with spaces
    return capitalizedWords.join(' ');
  }
}
