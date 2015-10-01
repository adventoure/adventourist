part of general_runtime;

abstract class RenderSystem {
  Future<SpriteIdentifier> registerSprite(String imageAsset);
  void drawSprite(SpriteIdentifier sprite, num x, num y, {num scaleX: 1, num scaleY: 1});
  void removeSprite(SpriteIdentifier sprite);
}

abstract class SpriteIdentifier {

}