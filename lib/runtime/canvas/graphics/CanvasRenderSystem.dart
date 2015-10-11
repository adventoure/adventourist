part of canvas_runtime;

class CanvasRenderSystem extends RenderSystem {
  CanvasRenderingContext2D _renderContext;

  CoordSystem _coordSystem;
  CanvasElement _stage;

  int aspectX = 16, aspectY = 9;

  CanvasRenderSystem(String canvasId) {
    _stage = querySelector('#' + canvasId);

    _renderContext = _stage.context2D;

    _resize();

    window.onResize.listen((event) {
      _resize();
    });
  }

  void _resize() {

    var width = window.innerWidth;
    var height = window.innerHeight;

    _stage.width = width;
    _stage.height = height;

    _coordSystem = new CoordSystem.scaledRatio(new Range(0, aspectX),
        new Range(0, aspectY), new Range(0, width), new Range(0, height));

    _fillOutsideRect(-aspectX,0,aspectX,aspectY);
    _fillOutsideRect(0,-aspectY,aspectX,aspectY);
    _fillOutsideRect(aspectX,0,aspectX,aspectY);
    _fillOutsideRect(0,aspectY,aspectX,aspectY);
  }

  void _fillOutsideRect(int x, int y, int width, int height) {
    _renderContext.fillStyle = "#000";
    var pos = _coordSystem.at(x, y);
    var w = _coordSystem.scaleWidth(width);
    var h = _coordSystem.scaleHeight(height);

    _renderContext.fillRect(pos.x, pos.y, w, h);
  }

  @override
  void drawSprite(SpriteIdentifier sprite, double x, double y,
      {double scaleX: 1, double scaleY: 1}) {
    ImageElement image = (sprite as CanvasSpriteIdentifier).image;
    var pos = _coordSystem.at(x, y);
    _renderContext.drawImage(image, pos.x, pos.y);
  }

  @override
  Future<SpriteIdentifier> registerSprite(String imageAsset) {
    ImageElement image = new ImageElement(src: imageAsset);
    return image.onLoad.first.then((e) {
      return new CanvasSpriteIdentifier(image);
    });
  }

  @override
  void removeSprite(SpriteIdentifier sprite) {
    // TODO: implement removeSprite
  }
}

class CanvasSpriteIdentifier extends SpriteIdentifier {
  ImageElement image;
  CanvasSpriteIdentifier(ImageElement this.image);
}
