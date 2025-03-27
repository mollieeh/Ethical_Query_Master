import 'package:flutter/material.dart';
import 'home.dart';
import 'package:flutter_application_1/models/saves.dart';

class History extends StatefulWidget 
{
  const History({super.key});

  @override
  State<History> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<History>
{
  List<Saves> saves = [];
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void getSaves()
  {
    saves = Saves.getSaves();
  }

  void _goToPage(int page)
  {
    if (page >= 0 && page < saves.length)
    {
      _pageController.animateToPage
      (
        page,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() 
      {
        _currentPage = page;
      });
    }
  }

  @override
  Widget build(BuildContext context) 
  {
    getSaves();
    return Scaffold
    (
      appBar: appBar(context),
      body: Center
      (
        child: Column
        (
          children:
          [
            Center
            (
              child: ClipPath
              (
                clipper: DownTrapezoidClipper(),
                child: Container
                (
                  width: 300,
                  height: 30,
                  color: const Color.fromARGB(255, 127, 255, 131),
                  alignment: Alignment.center,
                  child: const Text
                  (
                    'History',
                    style: TextStyle
                    (
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )
                  )
                )
              ),
            ),
            Padding
            (
              padding: EdgeInsets.all(10),
            ),
            Expanded
            (
              child: Stack
              (
                children: 
                [
                  PageView.builder
                  (
                    controller: _pageController,
                    itemCount: saves.length,
                    itemBuilder: (_, index) 
                    {
                      return Container
                      (
                        margin: const EdgeInsets.symmetric
                        (
                          horizontal: 20,
                          vertical: 10,
                        ),
                        width: double.infinity,
                        decoration: BoxDecoration
                        (
                          color: saves[index].boxColor,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black, width: 3),
                        ),
                        child: Center
                        (
                          child: Column
                          (
                            children: 
                            [
                              Padding
                              (
                                padding: EdgeInsets.all(10)
                              ),
                              Row
                              (
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: 
                                [
                                  Padding
                                  (
                                    padding: EdgeInsets.all(10)
                                  ),
                                  SizedBox
                                  (
                                    height: 50,
                                    width: 50,
                                    child: Image.asset(saves[index].iconPath),
                                  ),
                                  Padding
                                  (
                                    padding: EdgeInsets.all(10)
                                  ),
                                  Text
                                  (
                                    saves[index].ethicalStance,
                                    style: const TextStyle
                                    (
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold
                                    ),
                                  )
                                ],
                              ),
                              Column
                              (
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: 
                                [
                                  Container
                                  (
                                    margin: const EdgeInsets.symmetric
                                    (
                                      horizontal: 20,
                                      vertical: 30,
                                    ),
                                    height: 200,
                                    width: 400,
                                    decoration: BoxDecoration
                                    (
                                      color: Colors.white,
                                      border: Border.all
                                      (
                                        color: Colors.black,
                                        width: 5,
                                      )
                                    ),
                                    child:Text
                                    (
                                      'Question:\n${saves[index].question}',
                                      maxLines: null,
                                    )
                                  ),
                                  Container
                                  (
                                    margin: const EdgeInsets.symmetric
                                    (
                                      horizontal: 20,
                                      vertical: 10,
                                    ),
                                    height: 200,
                                    width: 400,
                                    decoration: BoxDecoration
                                    (
                                      color: Colors.white,
                                      border: Border.all
                                      (
                                        color: Colors.black,
                                        width: 5,
                                      )
                                    ),
                                    child:Text
                                    (
                                      'Response:\n${saves[index].response}',
                                      maxLines: null,
                                    )
                                  ),
                                ],
                              ),
                            ],
                          )
                        ),
                      );
                    },
                    onPageChanged: (index) 
                    {
                      setState(() 
                      {
                        _currentPage = index;
                      });
                    },
                  ),
                  Positioned
                  (
                    left: 17,
                    top: 0,
                    bottom: 0,
                    child: Center
                    (
                      child: IconButton
                      (
                        icon: const Icon(Icons.arrow_back_ios),
                        color: Colors.white,
                        iconSize: 30,
                        onPressed: () => _goToPage(_currentPage - 1),
                      ),
                    ),
                  ),
                  Positioned
                  (
                    right: 10,
                    top: 0,
                    bottom: 0,
                    child: Center
                    (
                      child: IconButton
                      (
                        icon: const Icon(Icons.arrow_forward_ios),
                        color: Colors.white,
                        iconSize: 30,
                        onPressed: () => _goToPage(_currentPage + 1),
                      ),
                    ),
                  ),
                ],
              )
            )
          ]
        )
      ),
    );
  }
}

class DownTrapezoidClipper extends CustomClipper<Path> 
{
  @override
  Path getClip(Size size) 
  {
    Border.all
    (
      color: Colors.black,
      width: 5,
    );
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width * 0.15, size.height);
    path.lineTo(size.width * 0.85, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}