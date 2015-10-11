import "package:test/test.dart";

import "package:adventourist/runtime/general/general_runtime.dart";
import 'dart:math';

void checkPoint(CoordSystem uut, Point input, Point output) {
  var res = uut.atPoint(input);
  expect(res.x, closeTo(output.x, 0.1));
  expect(res.y, closeTo(output.y, 0.1));
}

void main() {

  group("CoordSystem", () {
    test(".scaling creates a correct system", () {
      var widthDomain = new Range(0, 16);
      var heightDomain = new Range(0, 9);
      var widthRange = new Range(0, 1600);
      var heightRange = new Range(0, 900);

      var uut = new CoordSystem.scaled(widthDomain, heightDomain, widthRange, heightRange);

      expect(uut.at(0,0), equals(new Point(0, 0)));
      expect(uut.at(8,0), equals(new Point(800, 0)));
      expect(uut.at(8,4.5), equals(new Point(800, 450)));
    });

    test(".scaledRatio creates a correct system", () {
      var widthDomain = new Range(0, 16);
      var heightDomain = new Range(0, 9);
      var widthRange = new Range(0, 1600);
      var heightRange = new Range(0, 1000);

      var uut = new CoordSystem.scaledRatio(widthDomain, heightDomain, widthRange, heightRange);

      checkPoint(uut, new Point(0,0), new Point(0, 50));
      checkPoint(uut, new Point(8,0), new Point(800, 50));
      checkPoint(uut, new Point(8,4.5), new Point(800, 500));
      checkPoint(uut, new Point(16,9), new Point(1600, 950));
    });

    test(".scaledRatio creates a correct system vertically", () {
      var widthDomain = new Range(0, 16);
      var heightDomain = new Range(0, 9);
      var widthRange = new Range(0, 1700);
      var heightRange = new Range(0, 900);

      var uut = new CoordSystem.scaledRatio(widthDomain, heightDomain, widthRange, heightRange);

      checkPoint(uut, new Point(0,0), new Point(50, 0));
      checkPoint(uut, new Point(8,0), new Point(850, 0));
      checkPoint(uut, new Point(8,4.5), new Point(850, 450));
      checkPoint(uut, new Point(16,9), new Point(1650, 900));
    });

    test(".scale[Width,Height] scales a length correctly", () {
      var widthDomain = new Range(0, 16);
      var heightDomain = new Range(0, 9);
      var widthRange = new Range(0, 1700);
      var heightRange = new Range(0, 900);

      var uut = new CoordSystem.scaledRatio(widthDomain, heightDomain, widthRange, heightRange);

      expect(uut.scaleWidth(8), equals(800));
      expect(uut.scaleHeight(7), equals(700));

      uut = new CoordSystem.scaled(widthDomain, heightDomain, widthRange, heightRange);
      expect(uut.scaleWidth(16), equals(1700));
      expect(uut.scaleHeight(4.5), equals(450));
    });

  });
}
