import "dart:io";
import "dart:async";
import "dart:convert";

import "package:yaml/yaml.dart";


Future<String> readFile(String file_name) {

  Stream<List<int>> stream = new File(file_name).openRead();

  return stream
  .transform(UTF8.decoder)
  .transform(const LineSplitter())
  .fold("", (s1, s2) => s1 + s2 + "\n");
}

Future<dynamic> readYamlFile(String file_name) {
  return readFile(file_name).then(loadYaml);
}

Future<Directory> createDirectory(String dirName) => (new Directory(dirName)).create(recursive: true);

void deleteDirectory(String dirName) {
  var dir = new Directory(dirName);
  if(dir.existsSync()) {
    dir.deleteSync(recursive: true);
  }
}