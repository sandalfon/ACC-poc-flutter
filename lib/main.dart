
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'models/real_data_car_list.dart' as rdcl;
import 'package:quiver/iterables.dart';

void main() {
  runApp(_ChartApp());
}


class _ChartApp extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const _MyHomePage(),
    );
  }
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const _MyHomePage(),
    );
  }
}
class _MyHomePage extends StatefulWidget {
  const _MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {


     @override
  Widget build(BuildContext context) {
  

    return Scaffold(
      body: FutureBuilder(
        future: rdcl.RealDataCarList.fromJsonFile('./data/b-realtime-car.json'),
        
        builder: (context, data){
          //fromJsonFile('./data/b-realtime-car.json'),
          
          return  Center(
                child: SfCartesianChart(
                  primaryXAxis:  NumericAxis(
                            // X axis is hidden now
                            isVisible: true
                        ),
                  primaryYAxis:  NumericAxis(
                            // X axis is hidden now
                            isVisible: true
                        ),
                        series: <ScatterSeries<rdcl.DataPairing,double>>[
                          ScatterSeries<rdcl.DataPairing, double>(
                            dataSource: formatSections( data.data, false),
                            xValueMapper: (rdcl.DataPairing data, _) => data.x,
                            yValueMapper: (rdcl.DataPairing data, _) => data.y

                          )
                        ]
                )
          );
        }));

 
  }
}

List<rdcl.DataPairing> formatSections(realDataList, verbose){
  realDataList ??=  rdcl.RealDataCarList() ;
  debugPrint('*******************************');   
  debugPrint(realDataList.toString()); 
   List<rdcl.DataPairing> dataPairing  = realDataList.getXY() ?? [];
  if(verbose){
  for (rdcl.DataPairing pair in dataPairing){
        debugPrint('**'+pair.x.toString( )+', '+pair.y.toString()); 
    }
  }
  return dataPairing;
}
