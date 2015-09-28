import "package:test/test.dart";
import "../helpers/cli_helper.dart";

void main() {
  test("creates a simple game with a simple screen", () {
    expect(buildTestGame("show_simple_screen_test").then((String output) {

      return output;
    }), completion(equals("Generating Game 'Simple Game'...\n")));
  });
}