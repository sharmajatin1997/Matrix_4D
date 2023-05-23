import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '4D Matrix'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  double x=0;
  double y=0;
  double z=0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child:Transform(
          transform: Matrix4(
            1,0,0,0,
            0,1,0,0,
            0,0,1,0,
            0,0,0,1
          )..rotateX(x)..rotateY(y)..rotateZ(z),
          alignment: FractionalOffset.center,
          child: GestureDetector(
            onPanUpdate: (details){
              setState(() {
                y=y-details.delta.dx/100;
                x=x-details.delta.dy/100;
              });
            },
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(color: Colors.blue,
              border:Border.all(color:Colors.black38) ),
            ),
          ),

        )
      ),
    );
  }
}
