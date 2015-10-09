part of general_runtime;

abstract class RenderSystem {
  Range widthDomain = new Range(0, 16);
  Range heightDomain = new Range(0, 9);

  double get aspectRatio => widthDomain.size.toDouble() / heightDomain.size.toDouble();

  Future<SpriteIdentifier> registerSprite(String imageAsset);
  void drawSprite(SpriteIdentifier sprite, double x, double y, {double scaleX: 1, double scaleY: 1});
  void removeSprite(SpriteIdentifier sprite);
}

abstract class SpriteIdentifier {

}