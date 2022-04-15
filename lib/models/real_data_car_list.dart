import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:flutter/services.dart' as root_bundle;
import 'package:quiver/iterables.dart';
import 'real_data_car.dart' as rdc;


class RealDataCarList<RealDataCar> extends ListBase<rdc.RealDataCar>  {
   final List<rdc.RealDataCar> _list = [] ;
  
  RealDataCarList();

  @override
  set length(int newLength) { _list.length = newLength; }
  @override
  int get length => _list.length;
  @override
  rdc.RealDataCar operator [](int index) => _list[index];
  @override
  void operator []=(int index, rdc.RealDataCar value) { _list[index] = value; }
  @override
  void add(rdc.RealDataCar element) {_list.add(element);}

  List<double> getX() {
    List<double > posXList = [];
    for (rdc.RealDataCar realDataCar in _list) {
      posXList.add(realDataCar.posX);
    }
    return posXList ;
  }

  List<double> getY() {
    List<double > posYList = [];
    for (rdc.RealDataCar realDataCar in _list) {
      posYList.add(realDataCar.posY);
    }
    return posYList ;
  }

  Iterable<List<double>> getXY() {
    List<double > posXList = [];
    List<double > posYList = [];
    for (rdc.RealDataCar realDataCar in _list) {
      posXList.add(realDataCar.posX);
      posYList.add(realDataCar.posY);
    }
    return zip([posXList, posYList]) ;
  }



     static Future<RealDataCarList> fromJsonFile(String pathFile) async {
      final jsondata = await root_bundle.rootBundle.loadString(pathFile);
      final List<dynamic> list = json.decode(jsondata);
      var mapped = list.map((data)=>rdc.RealDataCar.fromJson(data)).toList();
      var realDataCarList = RealDataCarList();
      for (rdc.RealDataCar element in mapped){
          realDataCarList.add(element);
      }
     return realDataCarList;
  }

  
     static RealDataCarList fetchAll()  {
      var list = RealDataCarList();
      list.add(rdc.RealDataCar(1,1,1,1,1));
      list.add(rdc.RealDataCar(1,2,2,2,1));
      list.add(rdc.RealDataCar(1,4,4,1,2));
      list.add(rdc.RealDataCar(1,3,3,2,2));
      list.add(rdc.RealDataCar(2,-1,-1,1,1));
      list.add(rdc.RealDataCar(2,-2,-2,2,1));
      list.add(rdc.RealDataCar(2,-4,-4,1,2));
      list.add(rdc.RealDataCar(2,-3,-3,2,2));

     return list;
 
  }

}