import 'package:e_commerce/modules/login/login_screen.dart';
import 'package:e_commerce/shared/components/constance/constants.dart';
import 'package:e_commerce/shared/components/default_navigator/navigat.dart';
import 'package:e_commerce/shared/cubit/cubit_app/cubit.dart';
import 'package:e_commerce/shared/stayle/stayles.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';



class OnBoarder {
  final String title;
  final String image;
  final String body;

  OnBoarder({required this.title, required this.image,required this.body});
}

class Boarder extends StatefulWidget {
  @override
  _BoarderState createState() => _BoarderState();
}

class _BoarderState extends State<Boarder> {
  bool isLast = false;
  final controller = PageController();

late List<OnBoarder> boarderList;
  @override
  void initState() {
    super.initState();
    boarderList = [
      OnBoarder(
          title: '${transModel(context).title1}',
          image: 'assets/GUI/3.jpg',
          body: '${transModel(context).titleBody1}'),
      OnBoarder(
          title: '${transModel(context).title2}',
          image: 'assets/GUI/3.jpg',
          body: '${transModel(context).titleBody2}'),
      OnBoarder(
          title: '${transModel(context).title3}',
          image: 'assets/GUI/3.jpg',
          body: '${transModel(context).titleBody3}'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: AppCubit.get(context).textDirection,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: boarderList.length,
                  controller: controller,
                  onPageChanged: (i) {
                    if (i == boarderList.length -1 ) {
                      setState(() {
                        isLast = true;
                      });
                    } else  {
                      setState(() {
                        isLast = false;
                      });
                    }
                  },
                  itemBuilder: (context, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        child: Image(
                          image: AssetImage(
                            '${boarderList[index].image}',
                          ),
                        ),
                      ),
                      Text(
                        '${boarderList[index].title}',
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Text(
                        '${boarderList[index].body}',
                        style: black14bold(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  SmoothPageIndicator(
                    controller: controller, // PageController
                    count: boarderList.length,
                    effect: ExpandingDotsEffect(
                      dotWidth: 20,
                      strokeWidth: 20,
                      expansionFactor: 3,
                    ), // your preferred effect
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  FloatingActionButton(
                    child: Icon(Icons.arrow_forward),
                    onPressed: () {

                      if (isLast == false ) {
                        controller.nextPage(
                            duration: Duration(milliseconds: 750),
                            curve: Curves.fastLinearToSlowEaseIn);
                      } else{
                        navigateAndFinish(context: context, widget: Login());

                      }
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
