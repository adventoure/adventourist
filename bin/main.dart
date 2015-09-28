

import "../lib/read_file.dart";

void main() {

  readYamlFile("game.yml").then((gameConfig) {
    var gameName = gameConfig["name"];
    print("Generating Game '$gameName'...");
  });

}