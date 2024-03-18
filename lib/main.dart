import 'package:flutter/material.dart';

// import 'home_screen.dart';

void main() {
  runApp(const MyApp());
  print("run");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var bgColor=Colors.amber;
  var result = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("yourBMI",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900),)),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("BMI",style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),),
                SizedBox(height: 21,),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text("Enter your Weight in kgs"),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 13,),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text("Enter your Height (in Feet)"),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 13,),
                TextField(
                  controller:  inController,
                  decoration: InputDecoration(
                    label: Text("Enter your Height (in inch)"),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 16,),
                ElevatedButton(onPressed: (){

                  var wt = wtController.text;
                  var ft = ftController.text;
                  var inch = inController.text;

                  if(wt!= "" && ft!= "" && inch !=""){

                    var iWt = int.parse(wt);
                    var iFt = int.parse(ft);
                    var iInch = int.parse(inch);

                    var tInch =  iFt*12 + iInch;
                    var tCm = tInch* 2.54;
                    var tM = tCm/100;

                    var bmi = iWt/(tM*tM);

                    var msg = "";
                    if(bmi>25){
                        msg = "You're OverWeight!!";
                        bgColor = Colors.orange;
                    }else if(bmi<18){
                        msg = "You're UnderWeight!!";
                        bgColor = Colors.red;
                    }else{
                      msg = "You're Healthy!!";
                      bgColor = Colors.green;
                    }

                    result = "${msg} \nYour BMI is: ${bmi.toStringAsFixed(2)}";

                    setState(() {});
                  } else {
                    setState(() {
                      result = "Please fill all the required blanks!!!";
                    });
                  }

                }, child: Text('Calculate')),

                SizedBox(height: 11,),
                Text(result, style: TextStyle(fontSize: 19),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
