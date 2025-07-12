void formatLongString(
  StringBuffer buffer,
  String text,
  String firstIndent,
  String continuationIndent,
  int lineLength,
) {
  final usableLength = lineLength - firstIndent.length;
  final continuationUsableLength = lineLength - continuationIndent.length;

  if (text.length <= usableLength) {
    buffer.writeln('$firstIndent$text');
    return;
  }

  var remainingText = text;
  var isFirstLine = true;

  while (remainingText.isNotEmpty) {
    final currentIndent = isFirstLine ? firstIndent : continuationIndent;
    final currentUsableLength = isFirstLine ? usableLength : continuationUsableLength;

    if (remainingText.length <= currentUsableLength) {
      buffer.writeln('$currentIndent$remainingText');
      break;
    }

    // Find a good break point (space, comma, bracket, etc.)
    var breakPoint = currentUsableLength;
    final searchStart = (currentUsableLength * 0.7).round();

    for (var i = currentUsableLength; i >= searchStart; i--) {
      if (i < remainingText.length) {
        final char = remainingText[i];
        if (char == ' ' || char == ',' || char == '}' || char == ']' || char == ')') {
          breakPoint = i + 1;
          break;
        }
      }
    }

    if (breakPoint == currentUsableLength && breakPoint < remainingText.length) {
      breakPoint = currentUsableLength;
    }

    final lineText = remainingText.substring(0, breakPoint).trimRight();
    buffer.writeln('$currentIndent$lineText');

    remainingText = remainingText.substring(breakPoint).trimLeft();
    isFirstLine = false;
  }
}