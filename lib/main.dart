import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const App());
}

class Option {
  final String text;
  final String alphabet;

  Option({required this.text, required this.alphabet});
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Proxima'),
      title: 'Stroll',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Option? _selectedOption;
  final _options = [
    Option(text: 'The peace in the early mornings', alphabet: 'a'),
    Option(text: 'The magical golden hours', alphabet: 'b'),
    Option(text: 'Wind-down time after dinners', alphabet: 'c'),
    Option(text: 'The serenity past midnight', alphabet: 'd')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0F1115),
      body: Stack(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset('assets/imgs/background-img.png', fit: BoxFit.fitHeight)),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.5),
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.8),
                  Colors.black
                ],
                stops: [0.0, 0.3, 0.6, 1.0],
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(26),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Text(
                        'Stroll Bonfire',
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffB3ADF6),
                          shadows: [
                            Shadow(
                              offset: Offset(0, 0),
                              blurRadius: 7.9,
                              color: Color(0xff000000).withValues(alpha: 0.2),
                            ),
                            Shadow(
                              offset: Offset(0, 0),
                              blurRadius: 2.0,
                              color: Color(0xffBEBEBE),
                            ),
                            Shadow(
                              offset: Offset(0, 1),
                              blurRadius: 2.0,
                              color: Color(0xff24232F).withValues(alpha: 0.5),
                            ),
                          ],
                        ),
                      ),
                      SvgPicture.asset('assets/svgs/arrow-down.svg')
                    ],
                  ),
                  SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/svgs/clock.svg'),
                      SizedBox(width: 4),
                      Text('22h 00m',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                      SizedBox(width: 10),
                      SvgPicture.asset('assets/svgs/profile-min.svg'),
                      SizedBox(width: 4),
                      Text('103',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    spacing: 18,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(36),
                          child: Image.asset('assets/imgs/Joey 2.png')),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Angelina, 28',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xffF5F5F5),
                                  fontSize: 11),
                            ),
                            SizedBox(height: 6),
                            Text(
                              'What is your favorite time of the day?',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xffF5F5F5),
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 9),
                  Text(
                    '“Mine is definitely the peace in the morning.”',
                    style: TextStyle(
                        color: Color(0xffcbc9ff).withValues(alpha: 0.7),
                        fontStyle: FontStyle.italic),
                  ),
                  SizedBox(height: 14),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      runAlignment: WrapAlignment.center,
                      children: _options
                          .map((option) => OptionCard(
                              option: option,
                              selectedOption: _selectedOption,
                              onPressed: () => setState(() {
                                    _selectedOption = option;
                                  })))
                          .toList(),
                    ),
                  ),
                  SizedBox(height: 14),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Pick your option. \nSee who has a similar mind.',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xffE5E5E5),
                            )),
                        Row(
                          spacing: 5,
                          children: [
                            SvgPicture.asset('assets/svgs/mic.svg'),
                            SvgPicture.asset('assets/svgs/next.svg'),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        backgroundColor: Color(0xff0F1115),
        items: [
          BottomNavigationBarItem(
              label: '', icon: SvgPicture.asset('assets/svgs/poker-cards-2.svg')),
          BottomNavigationBarItem(label: '', icon: SvgPicture.asset('assets/svgs/bonfire.svg')),
          BottomNavigationBarItem(label: '', icon: SvgPicture.asset('assets/svgs/Chat.svg')),
          BottomNavigationBarItem(label: '', icon: SvgPicture.asset('assets/svgs/User.svg')),
        ],
      ),
    );
  }
}

class OptionCard extends StatelessWidget {
  final VoidCallback onPressed;
  final Option? selectedOption;
  final Option option;
  const OptionCard({
    super.key,
    required this.option,
    required this.selectedOption,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.45,
        child: Card(
            color: Color(0xff232A2E),
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: selectedOption == option ? Color(0xff8B88EF) : Colors.transparent),
                borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Card(
                      elevation: 0,
                      shape: CircleBorder(side: BorderSide(color: Color(0xffC4C4C4))),
                      color: selectedOption == option ? Color(0xff8B88EF) : Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          option.alphabet.toUpperCase(),
                          style: TextStyle(
                              fontSize: 12,
                              color: selectedOption == option ? Colors.white : Color(0xffC4C4C4)),
                        ),
                      )),
                  SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      option.text,
                      style: TextStyle(color: Color(0xffC4C4C4), fontSize: 14),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
