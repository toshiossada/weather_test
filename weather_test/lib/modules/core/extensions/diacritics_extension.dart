/// This extension provides a getter [withoutDiacriticalMarks] that returns a
/// new string
/// with all diacritical marks (accents) replaced by their non-diacritic
/// counterparts.
extension DiacriticsAwareString on String {
  /// A string containing common diacritical characters.
  static const diacritics =
      'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËĚèéêëěðČÇçčÐĎďÌÍÎÏìíîïĽľÙÚÛÜŮùúûüůŇÑñňŘř'
      'ŠšŤťŸÝÿýŽž';

  /// A string containing the non-diacritical counterparts to the characters
  /// in [diacritics].
  static const nonDiacritics =
      'AAAAAAaaaaaaOOOOOOOooooooEEEEEeeeeeeCCccDDdIIIIiiiiLlUUUUUuuuuuNNnnRrSs'
      'TtYYyyZz';

  /// A getter that returns a new string where all diacritical marks are 
  /// replaced by
  /// their non-diacritic counterparts.
  ///
  /// If a character in the string has a diacritical mark, it is replaced 
  /// with the
  /// corresponding non-diacritic character from [nonDiacritics]. Characters 
  /// without
  /// diacritics remain unchanged.
  ///
  /// Returns a new [String] with diacritical marks removed.
  String get withoutDiacriticalMarks => splitMapJoin(
        '',
        onNonMatch: (char) => char.isNotEmpty && diacritics.contains(char)
            ? nonDiacritics[diacritics.indexOf(char)]
            : char,
      );
}
