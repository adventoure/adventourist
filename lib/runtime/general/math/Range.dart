part of general_runtime;

/// A Range is an interval between two double values.
/// You can use it to determine, if a value is in the range or not.
class Range {
  num start, end;

  Range(this.start, this.end);

  /// Checks whether [value] is in [start,end)
  bool includes(num value) => value >= start && value < end;

  /// Returns the size of the range. Could be negative, if [end] < [start].
  num get size => end - start;

}