

import "../lib/file_system.dart" as FileSystem;

void main() {

  FileSystem.readYamlFile("game.yml").then((gameConfig) {
    var gameName = gameConfig["name"];
    print("Generating Game '$gameName'...");

    return FileSystem.createDirectory("build");
  });

}