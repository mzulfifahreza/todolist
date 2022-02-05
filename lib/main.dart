import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent)
  );
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: Pages1()));
}

class Pages1 extends StatelessWidget {
  const Pages1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Form(
          child: Container(
            // padding: EdgeInsets.all(5.0),
            width: size.width,
            height: size.height,
            margin: new EdgeInsets.all(75.0),
            child: Column(
              children: [
                Text(
                  'Manage Your Day',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'And Your Time',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
                Column(
                  children: [
                    Container(
                      margin: new EdgeInsets.only(top: 125.0),
                      child: Image.asset(
                        'asset/bg.png',
                        fit: BoxFit.contain,
                        height: 330,
                        width: 326,
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          //  Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) => const Pages2()),
                          //   );
                          Navigator.of(context).pushReplacement(
                              new MaterialPageRoute(builder: (_) {
                            return new Pages2();
                          }));
                        },
                        child: Text('Mulai'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          padding: EdgeInsets.symmetric(
                              horizontal: 100, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        )),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

class CardTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.blue, width: 0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset("asset/mytask.png")),
        SizedBox(height: 24),
      ],
    ));
  }
}

class Pages2 extends StatelessWidget {
  // const Pages2({Key? key}) : super(key: key);
  List cards = List.generate(5, (i) => new CardTask());
  final children = <Widget>[];
  final childrenOngoingTask = <Widget>[];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    for (var i = 0; i < 10; i++) {
      children.add(
        Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.blue, width: 0.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset("asset/mytask.png"),
        ),
      );
      // children.add(
      //   SizedBox(width: 25)
      // );
    }

    for (var i = 0; i < 10; i++) {
      childrenOngoingTask.add(
        SizedBox(height: 20)
      );
      childrenOngoingTask.add(
        ElevatedButton(
          onPressed: () {},
          child: Text(
            "Ongoing Task",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 80, vertical: 30),
            primary: Colors.white,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(20.0),
            ),
          ),
        ),
      );
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            height: size.height * 0.2,
            child: Stack(
              children: [
                Container(
                  height: size.height * 0.2 - 37,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(36),
                          bottomRight: Radius.circular(36))),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  // top: 20,
                  child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 50),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      // margin: EdgeInsets.all(50.0),
                      height: 54,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 10),
                              blurRadius: 50,
                              color: Colors.blue.withOpacity(0.23),
                            )
                          ]),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              onChanged: (value) {},
                              decoration: InputDecoration(
                                hintText: "Search",
                                hintStyle: TextStyle(
                                  color: Colors.blue.withOpacity(0.5),
                                ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          SvgPicture.asset("asset/search.svg"),
                        ],
                      )),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 35.0),
            height: 50,
            child: Stack(
              children: [
                Text(
                  "My Tasks",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 40.0),
            // width: size.width * 0.4,
            // height: 10,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: children,
              ),
            ),
          ),
          SizedBox(height: 44),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 35),
            height: 50,
            child: Text(
              "Ongoing Task",
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: size.height - 846.1,
            // height: 110.3,
            // height: size.height - 250
          ),
          Container(
              child: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  // height: 375.2,
                  height: size.height * 0.41,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(36),
                          topRight: Radius.circular(36))),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: childrenOngoingTask,
                    ),
                  ),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
