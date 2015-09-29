import 'dart:html';

void main() {

  CanvasElement stage = querySelector('#game_stage');
  var renderContext = stage.context2D;
  renderContext.fillStyle = "#FF0000";
  renderContext.fillRect(10, 10, 30, 30);

}