
import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';

import 'holder.dart';

void main() {
  runApp(const MyApp());
}




class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Material materialButton;
  late int index;
  final onboardingPagesList = [
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 0.0,
            color: Colors.white,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 100),
            SizedBox(
                width: double.infinity,
                child: ClipRRect(
                  child: Image.asset('assets/slide_1.JPG'),
                )
            ),
            Center(
              child:
              Text(
                'Quick Delivery At Your Doorstep',
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xFF0560FA),
                ),
              ),
            ),
            Center(
              child: Text('Enjoy quick pick-up and delivery to your destination',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16),),)
          ],
        ),
      ),
    ),
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 0.0,
            color: Colors.white,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 100),
            SizedBox(
                width: double.infinity,
                child: ClipRRect(
                  child: Image.asset('assets/slide_2.JPG'),
                )
            ),
            Center(child: Text('Flexible Payment',
              style: TextStyle(
                fontSize: 24,
                color: Color(0xFF0560FA),),),),
            Center(
              child: Text(
                'Different modes of payment either before and after delivery without stress',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16),),)
          ],
        ),
      ),
    ),
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 0.0,
            color: Colors.white,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 100),
            SizedBox(
              width: double.infinity,
              child: ClipRRect(
                child: Image.asset('assets/slide_3.JPG'),
              )
            ),
            Center(
              child: Text('Real-time Tracking',
              style: TextStyle(
                fontSize: 24,
                color: Color(0xFF0560FA),),),),
            Center(
              child: Text('Track your packages/items from the comfort of your home till final destination',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),),)
          ],
        ),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RedisExpress',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: Onboarding(
          pages: onboardingPagesList,
          onPageChange: (int pageIndex) {
            index = pageIndex;
          },
          startPageIndex: 0,
          footerBuilder: (context, dragDistance, pagesLength, setIndex) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 0.0,
                  color: Colors.white,
                ),
              ),
              child: ColoredBox(
                color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      index == pagesLength - 1
                          ?
                      SizedBox(
                        width: 300,
                        child: OutlinedButton(
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Holder()));
                          },
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white),),
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(Color(0xFF0560FA),),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(1),
                                )
                            ),
                          ),
                        ),)
                          :Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                OutlinedButton(
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(1),
                                          )
                                      ),
                                      side: MaterialStateProperty.all(
                                          BorderSide(
                                            color: Color(0xFF0560FA),
                                            width: 2.0,
                                            style: BorderStyle.solid,))
                                  ),
                                  onPressed: () {
                                    index = 2;
                                    setIndex(2);
                                  },
                                  child: Text(
                                    'Skip',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF0560FA)),
                                  ),
                                ),
                                SizedBox(width: 100,),
                                OutlinedButton(
                                  onPressed: (){setState(() {
                                    index = index + 1;
                                    setIndex(index);
                                  });},
                                  child: Text(
                                    'Next',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white),),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll<Color>(Color(0xFF0560FA),),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(1),
                                        )
                                    ),
                                  ),
                                ),
                            ]),
                    ]
                  ),
                )));
            },
        ),
      ),
    );
  }
}
