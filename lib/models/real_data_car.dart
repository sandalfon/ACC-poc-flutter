import 'point_info.dart';

class RealDataCar{
  int? carIndex;
  List<PointInfo>  pointInfos = [];

  RealDataCar(
    this.carIndex,
    this.pointInfos
  );


  static List<RealDataCar> fetchAll() {
    return [
      RealDataCar(
        1,
        [
          PointInfo(1,1,1,1),
          PointInfo(2,2,2,1),
          PointInfo(4,4,1,2),
          PointInfo(3,3,2,2)
        ]
      ),

      RealDataCar(
        2,
        [
          PointInfo(-1,-1,1,1),
          PointInfo(-2,-2,2,1),
          PointInfo(-4,-4,1,2),
          PointInfo(-3,-3,2,2)
        ]
      )
    ];
  }
}