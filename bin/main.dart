import "dart:io";

import "../lib/file_system.dart" as FileSystem;

void main() {
  FileSystem.readYamlFile("game.yml").then((gameConfig) {
    var gameName = gameConfig["name"];
    print("Generating Game '$gameName'...");
    FileSystem.deleteDirectory("build");
    return FileSystem.createDirectory("build");
  }).then((Directory buildDir) {
    var env = Platform.environment;
    Process.run("dart2js", [
      "-o",
      buildDir.path + "/canvas_runtime.js",
      env["ADVENTOURIST_HOME"] + "/lib/runtime/canvas/canvas_runtime.dart"
    ]).then((ProcessResult result) {
      print(result.stderr);
      print(result.stdout);
    });

    Process.run("cp", ["-R", env["ADVENTOURIST_HOME"] + "/lib/runtime/.", buildDir.path + "/"]);
    Process.run("cp", ["-R", "game.yml", buildDir.path + "/"]);
    Process.run("cp", ["-R", "screens", buildDir.path + "/"]);
    Process.run("cp", ["-R", "testSprite.png", buildDir.path + "/"]);
  });
}
