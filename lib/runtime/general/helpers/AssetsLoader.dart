part of general_runtime;


abstract class AssetsLoader {
  Future<String> loadTextAsset(String fileName);

  Future<dynamic> loadYaml(String fileName) {
    return loadTextAsset(fileName).then(YAML.loadYaml);
  }
}