import "package:test/test.dart";

import "package:adventourist/runtime/general/general_runtime.dart";

void main() {

  group("Range", () {
    test(".size gives the right size", () {
      var testRange = new Range(3.14, 10.64);
      expect(testRange.size, equals(7.5));
    });

    test(".size is negative if end < start", () {
      var testRange = new Range(-2.0, -10.0);
      expect(testRange.size, equals(-8.0));
    });
  });
}