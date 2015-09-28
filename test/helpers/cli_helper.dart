import "dart:io";
import "dart:async";

Future<String> buildTestGame(String gameName) {
  return Process
  .run("dart", ["../../../bin/main.dart", "build"],
  workingDirectory: "test/test_games/$gameName")
  .then((ProcessResult result) {
    return result.stdout;
  });
}