class PointInfo{
  
  double? worldPosX;
  double? worldPosY;
  int? lapTimeMS;
  int? lap;

  PointInfo(
      this.worldPosX,
      this.worldPosY,
      this.lap,
      this.lapTimeMS
  );

  PointInfo.fromJson(Map<String, dynamic> json){
    worldPosX=json["WorldPosX"];
    worldPosY=json["WorldPosY"];
    lap=json["Laps"];
    lapTimeMS=json["CurrentLap"]["LaptimeMS"];
  }

  @override
  String toString() {
    // TODO: implement toString
    return "[x: "+worldPosX.toString()+", y: "+worldPosY.toString()+", lap: "+lap.toString()+", time: "+lapTimeMS.toString()+"]";
  }
}