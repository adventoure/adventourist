part of general_runtime;

abstract class Scale {
  /// Maps x with the Scale function applied
  double operator [](num x);
}

class LinearScale extends Scale {

  /// What are the input values of the scale
  Range domain;

  /// To these values is the input mapped
  Range range;

  /// Creates a [LinearScale] which maps x ↦ [scale] * x.
  /// The default value for [scale] is 1.
  LinearScale([num scale = 1]) {
    domain = new Range(0, 1);
    range = new Range(0, scale);
  }

  /// Creates a scale which maps the values in [domain] to the values in [range]
  LinearScale.fromRanges(this.domain, this.range);

  @override
  double operator [](num x) {
    var inDomain = (x - domain.start) / domain.size;
    return inDomain * range.size + range.start;
  }
}