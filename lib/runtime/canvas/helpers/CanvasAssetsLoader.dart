part of canvas_runtime;

class CanvasAssetsLoader extends AssetsLoader {

  @override
  Future<String> loadTextAsset(String fileName) => HttpRequest.getString(fileName);

}