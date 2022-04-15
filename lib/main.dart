
import 'package:flutter/material.dart';
import 'models/real_data_car_list.dart' as rdcl;

void main() {
  runApp(const MyApp());
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
      home: const MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


     @override
  Widget build(BuildContext context) {
  

    return Scaffold(
      body: FutureBuilder(
        future: rdcl.RealDataCarList.fromJsonFile('./data/b-realtime-car.json'),
        
        builder: (context, data){
          //fromJsonFile('./data/b-realtime-car.json'),
          
          return  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ...formatSections(data.data)
          ]);
        }));

 
  }
}

List<Widget> formatSections(realDataList){
        debugPrint('*******************************');
        List<Widget>  list  = [];
        for (List<double> x in realDataList.getXY()){
          debugPrint(x.toString());
          list.add(Text(x.toString()));
        }
      
      return list;
    //return [Text(realDataList.getXY().toString())];
    //return realDataList.getXY().map( (x) => Text(x.toString())).toList();
    //return realDataList.map((realData)=> Text(realData.toString())).toList() as List<Widget>;


}
