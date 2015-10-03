import "package:test/test.dart";

import "package:adventourist/runtime/general/general_runtime.dart";

void main() {

  group("LinearScale", () {
    test(" maps correctly", () {
      var domain = new Range(-3, 7);
      var range = new Range(10, 110);

      var scale = new LinearScale.fromRanges(domain, range);
      expect(scale[-3], equals(10));
      expect(scale[7], equals(110));
      expect(scale[0], equals(40));
      expect(scale[-13], equals(-90));
    });

    test(" has a working default constructor", () {
      var scale = new LinearScale();
      expect(scale[0], equals(0));
      expect(scale[0.5], equals(0.5));

      var scale2 = new LinearScale(2);
      expect(scale2[0], equals(0));
      expect(scale2[0.5], equals(1));
    });

  });
}