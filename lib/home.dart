import 'package:flutter/material.dart';
import 'package:quizapp/qustion.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _questionsIndex = 0;

  List questionarea = [
    Question.name("الزرافة تتحمل العطش اكثر من الجمل", true),
    Question.name("العقرب يستطيع تحمل النار", false),
    Question.name("اطول حرب في العالم كانت بين الجزائر وفرنسا", false),
    Question.name("يشم الفيل رائحة الانسان على بعد نصف كيلومتر", true),
    Question.name("نظام الحكم في اليابان هو وراثي", false),
    Question.name("كان يسمي العرب الذهب قديما ب الاصفر الرنان", true),
    Question.name("الدولة التي اشتهرت بالسوشي هي مصر", false),
    Question.name("اعلى جبل في العالم هو جبل عرفة", false),
    Question.name("عاصمة اثيوبيا هي جدة", false),
    Question.name("البحر الدي يفصل بين تركيا واليونان هو البحر الاحمر", false),
    Question.name("تقع ساعة بيج بال الشهيرة في بريطانيا.", true),
    Question.name("يشير مصطلح الدهب الاسود الى الفحم.", false),
    Question.name("اذكى الحيوانات البحرية هي القرش.", false),
    Question.name("اصغر دولة عربية مساحة هي البحرين", true),
    Question.name("صنعت اول كسوة للكعبة الشريفة في مصر", true),
    Question.name("الجيولوجيا هي علم الطب", false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quizy"),
        backgroundColor: Colors.blueGrey[700],
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey[300],
      body: Builder(
        builder: (BuildContext context) => Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: Center(
                  child: Image.asset(
                    'build/images/img.png',
                    height: 300,
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      "OUR QUSTION",
                      style: TextStyle(
                          color: Colors.blueGrey[900],
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        width: 400,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black87,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: Text(
                            questionarea[_questionsIndex].questionText,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RaisedButton(
                            onPressed: () => _previousQuestion(),
                            color: Colors.blueGrey.shade900,
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                          RaisedButton(
                            onPressed: () => _checkAnswer(true, context),
                            color: Colors.blueGrey.shade900,
                            child: Text(
                              "It's TRUE",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          RaisedButton(
                            onPressed: () => _checkAnswer(false, context),
                            color: Colors.blueGrey.shade900,
                            child: Text(
                              "It's False",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          RaisedButton(
                            onPressed: () => _nextQuestion(),
                            color: Colors.blueGrey.shade900,
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _checkAnswer(bool userChoice, BuildContext context) {
    if (userChoice == questionarea[_questionsIndex].isCorrect) {
      final snackbar = SnackBar(
          content: Text("Correct !!"),
          backgroundColor: Colors.green,
          duration: Duration(
            milliseconds: 500,
          ));

      Scaffold.of(context).showSnackBar(snackbar);
      debugPrint("Correct");

      setState(() {
        _questionsIndex++;
      });
    } else {
      final snackbar = SnackBar(
          content: Text("InCorrect !!"),
          backgroundColor: Colors.red,
          duration: Duration(milliseconds: 500));
      Scaffold.of(context).showSnackBar(snackbar);
      debugPrint("InCorrect");
    }
  }

  _previousQuestion() {
    setState(() {
      _questionsIndex = (_questionsIndex - 1) % questionarea.length;
    });
  }

  _nextQuestion() {
    setState(() {
      _questionsIndex = (_questionsIndex + 1) % questionarea.length;
    });
  }
}
