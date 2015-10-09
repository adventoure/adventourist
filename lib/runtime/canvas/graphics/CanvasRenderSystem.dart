part of canvas_runtime;

class CanvasRenderSystem extends RenderSystem {

  CanvasRenderingContext2D _renderContext;

  CanvasRenderSystem(String canvasId) {
    CanvasElement stage = querySelector('#' + canvasId);

    _renderContext = stage.context2D;
  }


  @override
  void drawSprite(SpriteIdentifier sprite, double x, double y, {double scaleX: 1, double scaleY: 1}) {
    ImageElement image = (sprite as CanvasSpriteIdentifier).image;
    _renderContext.drawImage(image, x, y);
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