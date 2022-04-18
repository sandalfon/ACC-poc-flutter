
class RealDataCar{
  int carIndex;
  double worldPosX;
  double worldPosY;
  int lap;
  int lapTimeMS;

  RealDataCar(
    this.carIndex,
    this.worldPosX,
    this.worldPosY,
    this.lap,
    this.lapTimeMS
  );


  factory RealDataCar.fromJson(Map<String, dynamic> json) => RealDataCar(
    json["CarIndex"],
    json["WorldPosX"],
    json["WorldPosY"],
    json["Laps"],
    json["CurrentLap"]["LaptimeMS"]);

    @override
  String toString() {
    // TODO: implement toString
    return "{car: "+carIndex.toString()+", x: "+worldPosX.toString()+", y: "+worldPosY.toString()+", lap: "+lap.toString()+", time: "+lapTimeMS.toString()+"}";
  }

  double get posX {return worldPosX;}
  double get posY {return worldPosY;}
}
