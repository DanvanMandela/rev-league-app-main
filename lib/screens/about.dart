// import 'dart:html';

import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            //TODO update this
            'assets/images/background.jpg',
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),
          ListView(
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1),
                ),
                elevation: 3,
                color: Color.fromRGBO(255, 255, 255, 0.5),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 3,
                color: Color.fromRGBO(255, 255, 255, 0.5),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '1 Rules',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                        height: 20,
                        thickness: 2,
                        indent: 20,
                        endIndent: 20,
                      ),
                      SizedBox(),
                      Text('''
                      1.1. NO TYRE DEGRADATION

1.2. NO ASSISTS ( however, the driver is free to use the assigned control(s) on the steering wheel to his/her advantage)

1.3. TYRE CHANGE FOR THE TOP FOUR DRIVERS AT THE FINALS.

1.4. TYRE BLANKETS WILL BE ON

1.5. WARM WEATHER CONDITIONS WITH MEDIUM TYRES FOR ALL RACERS.

1.6. OPTIONAL DRIVING MODE (manual/automatic) FOR THE FIRST TWO WEEK i.e untill 17/04/2021.

1.7. COMPULSORY DRIVING ON MANUAL MODE FROM WEEK 2

1.8. MECHANICAL DAMAGE IS ON

1.9. A DRIVER IS REQUIRED TO PAY KSHS 1000 EVERY WEEK HE/SHE COMES TO BETTER HIS/HER TIME AND IS ONLY ALLOWED ONE TRY ON THE TOURNAMENT SERVER PER WEEK.

2.0. DRIVERS CAN PRACTICE ON THE GAMING SERVER AS MANY TIMES AS THEY SO WISH FOR A DISCOUNTED RATE OF  KSHS 1000 FOR 5 MINUTES PRACTICE AND A 20 MINUTES RACE.

2.0.1. WRC CHAMPIONSHIP MERIT BASED SYSTEM i.e

Position 1= 25 pts

Position 2=18pts

Position 3=15pts

Position 4 & 5= 12 pts

Position 6th to 10th=10pts

Position 11th to 15th=8pts

Position 16th to 20th=6pts

Position 21 to 30th=4pts

Position 31 to 40th=2pts

Position 41 to 50th=1pt
( Kindly note that the points will be assigned on a weekly basis )
''')
                    ],
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 3,
                color: Color.fromRGBO(255, 255, 255, 0.5),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        '2. PENALTIES',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                        height: 20,
                        thickness: 2,
                        indent: 20,
                        endIndent: 20,
                      ),
                      SizedBox(),
                      Text('''
                      2.1. 20 SECOND OFF TRACK PENALTY

2.2.  20 SECOND WRONG DIRECTION PENALTY

2.3.  5 SECOND INCIDENT PENALTY

2.4. TOTAL CAR CONTROL LOSS IN THE CASE OF TOO MUCH MECHANICAL DAMAGE.

2.5. EJECTION FROM SERVER AS A RESULT OF TOO MANY PENALTIES.

2.6. ALL LAPS THAT HAVE PENALTIES WILL NOT COUNT

 ( All the penalties will automatically take your Simulator back to the pit for a stop and go or/and lock your controls for the  above stated penalty times )
                      '''),
                    ],
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 3,
                color: Color.fromRGBO(255, 255, 255, 0.5),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        '3. TRACKS',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                        height: 20,
                        thickness: 2,
                        indent: 20,
                        endIndent: 20,
                      ),
                      SizedBox(),
                      Text('''
                      WEEK 1- SOCHI
WEEK 2- ZANDVOORT
WEEK 3- BARCELONA
WEEK 4- SPA
WEEK 5- SUZUKA
WEEK 6- MONZA
WEEK 7- MONTREAL
WEEK 8- BAHRAIN
WEEK 9- BAKU''')
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
