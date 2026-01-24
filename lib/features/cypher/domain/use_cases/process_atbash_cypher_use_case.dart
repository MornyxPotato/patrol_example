class ProcessAtbashCypherParams {
  final String input;

  ProcessAtbashCypherParams({required this.input});
}

class ProcessAtbashCypherUseCase {
  String call(ProcessAtbashCypherParams params) {
    String input = params.input;
    return input
        .split('')
        .map((char) {
          int code = char.codeUnitAt(0);
          if (code >= 65 && code <= 90) {
            // Uppercase
            return String.fromCharCode(90 - (code - 65));
          } else if (code >= 97 && code <= 122) {
            // Lowercase
            return String.fromCharCode(122 - (code - 97));
          }
          return char; // Return non-alphabetic chars as-is
        })
        .join('');
  }
}
