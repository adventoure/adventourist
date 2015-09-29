import "dart:io";
import "dart:async";

Future<ProcessResult> buildTestGame(String gameName) {
  return Process.run("dart", ["../../../bin/main.dart", "build"],
      workingDirectory: gameDirectory(gameName));
}

void removeBuildDirectory(String gameName) {
  var buildDir = new Directory(gameDirectory(gameName) + "/build");
  buildDir.delete(recursive: true);
}

String gameDirectory(String gameName) => "test/test_games/$gameName";