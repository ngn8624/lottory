import 'dart:math';

import 'package:flutter/material.dart';

// for // 젤빠름
void forward(int move) {
  for (int i = 0; i <= move; i++) {
    debugPrint('$i 칸 이동햇습니다');
  }
}

// for in :느림
void rainbowMAke() {
  List<String> rainbow = ['빨', '주', '노', '초', '파', '남', '보'];
  for (String x in rainbow) {
    debugPrint(x);
  }
}

// for  each : for in 보다 빠름
void carMake() {
  List<String> carMAker = [
    'BMW',
    'BENZ',
    'AUDI',
    'HYUNDAI',
    'KIA',
    '포르쉐',
    '람보'
  ];
  carMAker.forEach((element) {
    debugPrint(element);
  });
}

// 중복생성 ..
// List<int> lottoNumber() {
//   var random = Random();
//   debugPrint('$random random 인스턴스');
//   List<int> lottoList = [];

//   var num;
//   for (int i = 0; i < 6; i++) {
//     num = random.nextInt(45) + 1;
//     lottoList.add(num);
//   }
//   debugPrint("당첨번호");
//   debugPrint(lottoList.toString());
//   return lottoList;
// }

// List<int> myNumber() {
//   var random = Random();

//   List<int> myList = [];

//   var num;
//   for (int i = 0; i < 6; i++) {
//     num = random.nextInt(45) + 1;
//     myList.add(num);
//   }
//   debugPrint("나의 번호");
//   debugPrint(myList.toString());
//   return myList;
// }

// 중복 방지 set사용, while 포함
Set<int> lottoNumber() {
  final random = Random();
  final Set<int> lottoset = {};

  while (lottoset.length != 6) {
    lottoset.add(random.nextInt(45) + 1);
  }
  debugPrint("당첨번호 : ${lottoset.toString()}");
  return lottoset;
}

Set<int> myNumber() {
  final random = Random();
  final Set<int> mySet = {};

  while (mySet.length != 6) {
    mySet.add(random.nextInt(45) + 1);
  }
  debugPrint("나의 번호 : ${mySet.toString()}");
  return mySet;
}

void checkNumber(lottoList, myList) {
  int match = 0;
  for (int lotto in lottoList) {
    for (int myNum in myList) {
      if (lotto == myNum) {
        match++;
        debugPrint("당첨번호  = $myNum");
      }
    }
  }
  if (match == 0) {
    debugPrint("하나도 안맞아");
  } else {
    debugPrint("$match 개의 당첨번호가 있습니다");
  }
}

// List<int>.generate(45, (i) => i+1);
// shuffle 섞음
// .. cascade notation : .. 멤버함수 접근 쉬워짐
// subList: 필요한거 추출

List<int> lottoNumberGenerate() {
  var test = (List<int>.generate(45, (i) => ++i)..shuffle()).sublist(0, 6);
  debugPrint("당첨번호 : $test");
  return test;
}

List<int> myNumberGenerate() {
  var test = (List<int>.generate(45, (i) => ++i)..shuffle()).sublist(0, 6);
  debugPrint("추첨 번호 : $test");
  return test;
}

void main() {
  forward(5);
  rainbowMAke();
  carMake();
  // List<int> lottoList = lottoNumber();
  // List<int> myNum = myNumber();
  Set<int> lottoList = lottoNumber();
  Set<int> myNum = myNumber();
  checkNumber(lottoList, myNum);
  debugPrint("=====List Generate======");
  List<int> listGenerate = lottoNumberGenerate();
  List<int> myGenerate = lottoNumberGenerate();
  checkNumber(listGenerate, myGenerate);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
