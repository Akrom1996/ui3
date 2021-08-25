import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  static final String id = "intro_page";
  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  List<String> textTitle = [
    "Learn from experts",
    "Go at your own pace",
    "Find video courses",
  ];
  List<String> textContent = [
    "Select from top instructors around the world",
    "Enjoy lifetime access to courses on Udemy's website and app",
    "Build your library for your career and personal growth",
  ];
  List<String> pathImage = [
    "assets/images/img1.jpg",
    "assets/images/img2.jpg",
    "assets/images/img3.jpg"
  ];

  PageController? _controller;
  int _currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            children: buildWidget(textTitle, textContent, pathImage),
          ),
          Container(
            width: 45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: indicators(_currentIndex),
            ),
          ),
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _currentIndex == 2
                  ? SafeArea(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Skip",
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    )
                  : SizedBox.shrink()
            ],
          ))
        ],
      ),
    );
  }
}

List<Widget> indicators(int index) {
  List<Widget> body = [];
  for (int i = 0; i < 3; i++)
    body.add(buildIndicators(
      isActive: index == i ? true : false,
    ));
  return body;
}

class buildIndicators extends StatelessWidget {
  final isActive;
  const buildIndicators({
    Key? key,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          AnimatedContainer(
            // margin: EdgeInsets.only(right: 2),
            duration: Duration(milliseconds: 120),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.red,
            ),
            width: isActive ? 20 : 6,
            height: 6,
          ),
        ],
      ),
    );
  }
}

List<Widget> buildWidget(
  List<String> textTitle,
  List<String> textContent,
  List<String> pathImage,
) {
  List<Widget> myBody = [];
  for (int i = 0; i < 3; i++) {
    myBody.add(
      myWidget(
        textTitle: textTitle[i],
        textContent: textContent[i],
        pathImage: pathImage[i],
      ),
    );
  }
  return myBody;
}

class myWidget extends StatelessWidget {
  const myWidget({
    Key? key,
    required this.textTitle,
    required this.textContent,
    required this.pathImage,
  }) : super(key: key);

  final String textTitle;
  final String textContent;
  final String pathImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$textTitle",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.red, fontSize: 28, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "$textContent",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          child: Image.asset(pathImage),
        )
      ],
    );
  }
}
