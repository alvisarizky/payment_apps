import 'package:flutter/material.dart';
import 'package:payment_apps/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    Widget Option(
      int index,
      String time,
      String desc,
      String price
      ){
      return GestureDetector(
        onTap: (){
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: selectedIndex == index ? Color(0xff007DFF) : Color(0xff4D587C),
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  selectedIndex == index 
                  ? Image.asset(
                    'assets/images/check_selected.png',
                    width: 18,
                    height: 18,
                  ) 
                  : Image.asset(
                    'assets/images/check_none.png',
                    width: 18,
                    height: 18,
                  ),
                  SizedBox(width: 16,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        time,
                        style: planTextStyle,
                      ),
                      Text(
                        desc,
                        style: descTextStyle,
                      )
                    ],
                  ),
                  Spacer(),
                  Text(
                    price,
                    style: priceTextStyle,
                  )
                ],
              ),
            ],
          ),
        ),
      );
    }
    Widget Header() {
      return Padding(
        padding: EdgeInsets.only(top: 50, left: 32, right: 32,),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'assets/images/img_dashboard.png',
                width: 267,
                height: 200,
              ),
            ),
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Upgrade to',
                  style: titleTextStyle,
                ),
                SizedBox(width: 6,),
                Text(
                  'Pro',
                  style: titleTextStyle.copyWith(
                    color: Color(0xff007DFF),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16,),
            Text(
              'Go unlock all features and\nbuild your own business bigger',
              style: subTitleTextStyle,
              textAlign: TextAlign.center,
            )
          ],
        ),
      );
    }
    
    Widget checkoutButton() {
      return Column(
        children: [
          Container(
            width: 311,
            height: 51.23,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Color(0xff007DFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(71),
                ),
              ),
              onPressed: () {}, 
              child: Text(
                'Checkout Now',
                style: buttonTextStyle,
              ),
            ),
          )
        ]
      );
    }
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff04112F),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Header(),
                SizedBox(height: 50,),
                Option(0, 'Monthly', 'Good for starting up', '\$20'),
                Option(1, 'Quarterly', 'Focusing on building', '\$55'),
                Option(2, 'Yearly', 'Steady company', '\$220'),
                SizedBox(height: 50,),
                selectedIndex == -1 ? SizedBox() : checkoutButton(),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}