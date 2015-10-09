part of general_runtime;

class CoordSystem {

  Scale widthScale, heightScale;

  CoordSystem.scaled(Range widthDomain, Range heightDomain, Range widthRange, Range heightRange) {
    this.widthScale = new LinearScale.fromRanges(widthDomain, widthRange);
    this.heightScale = new LinearScale.fromRanges(heightDomain, heightRange);
  }

  CoordSystem.scaledRatio(Range widthDomain, Range heightDomain, Range widthRange, Range heightRange) {
    double inWidth = widthDomain.size.toDouble();
    double inHeight = heightDomain.size.toDouble();
    double outWidth = widthRange.size.toDouble();
    double outHeight = heightRange.size.toDouble();

    double inRatio = inWidth / inHeight;
    double outRatio = outWidth / outHeight;
    var ratioRatio = outRatio / inRatio;

    if(inRatio > outRatio) {
      double outYMid = heightRange.mid;

      var diff = (outHeight * ratioRatio) / 2;

      widthScale = new LinearScale.fromRanges(widthDomain, widthRange);
      heightScale = new LinearScale.fromRanges(heightDomain, new Range(outYMid - diff, outYMid + diff));
    } else {
      double outXMid = widthRange.mid;

      var diff = (outWidth / ratioRatio) / 2;

      widthScale = new LinearScale.fromRanges(widthDomain, new Range(outXMid - diff, outXMid + diff));
      heightScale = new LinearScale.fromRanges(heightDomain, heightRange);
    }

  }


  Point at(num x, num y) => new Point(widthScale[x], heightScale[y]);
  Point atPoint(Point point) => at(point.x, point.y);
}