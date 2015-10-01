library canvas_runtime;

import 'dart:html';
import 'dart:async';
import '../general/general_runtime.dart';

part "helpers/CanvasAssetsLoader.dart";
part "graphics/CanvasRenderSystem.dart";

AssetsLoader assetsLoader = new CanvasAssetsLoader();

void main() {

  assetsLoader.loadYaml("game.yml").then((gameData) {
    querySelector("title").text = gameData["name"];
  });
  
  RenderSystem renderer = new CanvasRenderSystem('game_stage');
  renderer.registerSprite("testSprite.png").then((sprite) {
    renderer.drawSprite(sprite, 10, 30);
  }, onError: () {
    window.alert("error");
  });
}