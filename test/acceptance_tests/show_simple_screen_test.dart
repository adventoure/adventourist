import "package:test/test.dart";
import "../helpers/cli_helper.dart";
import 'dart:io';

const GAME_NAME = "show_simple_screen_test";

void main() {
  test("creates a simple game with a simple screen", () {
    expect(buildTestGame(GAME_NAME).then(testBuildsSimpleGame),
        completion(equals("Generating Game 'Simple Game'...\n")));
  });
}

String testBuildsSimpleGame(ProcessResult result) {
  if (result.exitCode != 0) {
    throw result.stderr;
  }

  var buildDir = new Directory(gameDirectory(GAME_NAME) + "/build");

  expect(buildDir.exists().then(cleanUp), completion(isTrue));

  return result.stdout;
}

bool cleanUp(bool existsDir) {
  if (existsDir) {
    removeBuildDirectory(GAME_NAME);
  }

  return existsDir;
}
