import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool today = true, tomorrow = false, nextweek = false;
  bool suggest = false;

  TextEditingController todoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openBox();
        },
        child: Icon(
          Icons.add,
          color: Color(0xFF249fff),
          size: 30,
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 80, left: 30),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF232FDA2),
              Color(0xFF13D8CA),
              Color(0xFF09adfe),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Flutter\ndeveloper",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              "Good morning",
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                today
                    ? Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 20),
                          decoration: BoxDecoration(
                            color: Color(0xFF3dffe3),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "Today",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            today = true;
                            tomorrow = false;
                            nextweek = false;
                          });
                        },
                        child: Text(
                          "Today",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                tomorrow
                    ? Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 20),
                          decoration: BoxDecoration(
                            color: Color(0xFF3dffe3),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "Tomorrow",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            today = false;
                            tomorrow = true;
                            nextweek = false;
                          });
                        },
                        child: Text(
                          "Tomorrow",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                nextweek
                    ? Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 20),
                          decoration: BoxDecoration(
                            color: Color(0xFF3dffe3),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "Next Week",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            today = false;
                            tomorrow = false;
                            nextweek = true;
                          });
                        },
                        child: Text(
                          "Next Week",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
              ],
            ),
            SizedBox(height: 20),
            CheckboxListTile(
              activeColor: Color(0xFF279cfb),
              title: Text(
                "Go to the gym",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
              value: suggest,
              onChanged: (value) {
                setState(() {
                  suggest = value!;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
          ],
        ),
      ),
    );
  }
  Future openBox() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.cancel),
                      ),
                      SizedBox(width: 60),
                      Text(
                        "Add the work Todo",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff008080),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text("Add Text"),
                  SizedBox(height: 10.0),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black38,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      controller: todoController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter text",
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Center(
                    child: Container(
                      width: 100,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Color(0xFF008080),
                      ),
                      child: Center(
                        child: Text(
                          "Add",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
