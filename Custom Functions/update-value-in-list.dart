// YouTube channel - https://www.youtube.com/@flutterflowexpert
// video - no
// Join the Klaturov army - https://www.youtube.com/@flutterflowexpert/join
// Support my work - https://github.com/sponsors/bulgariamitko
// Website - https://bulgariamitko.github.io/flutterflowtutorials/
// You can book me as FF mentor - https://calendly.com/bulgaria_mitko
// GitHub repo - https://github.com/bulgariamitko/flutterflowtutorials
// Discord channel - https://discord.gg/ERDVFBkJmY

List<String>? updateValueInList(
  List<String>? list,
  int? index,
  String? newValue,
) {
  /// MODIFY CODE ONLY BELOW THIS LINE

  // null safety
  list ??= [];
  index ??= 0;
  newValue ??= 'myNewValue';

  if (index >= 0 && index < list.length) {
    List<String> newList = List.from(list);
    newList[index] = newValue;
    return newList;
  } else {
    print('Index out of range');
    return list;
  }

  /// MODIFY CODE ONLY ABOVE THIS LINE
}