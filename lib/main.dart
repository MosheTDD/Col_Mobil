import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Gotham",
      ),
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
  PageController privateCarsShowcaseController = PageController();

  int currentPrivateCarsIndex = 0;

  List<Widget> privateCarsShowcaseImages = [
    Image.asset(
      "images/privateCars/Hyundai_banner.jpg",
      fit: BoxFit.cover,
    ),
    Image.asset(
      "images/privateCars/mitsubishi_banner.jpeg",
      fit: BoxFit.cover,
    ),
    Image.asset(
      "images/privateCars/smart_banner.jpg",
      fit: BoxFit.cover,
    ),
    Image.asset(
      "images/privateCars/mercedes_banner.jpg",
      fit: BoxFit.cover,
    ),
    Image.asset(
      "images/privateCars/genesis_banner.jpg",
      fit: BoxFit.cover,
    ),
  ];

  List<Widget> groupTransportationShowcaseImages = [
    Image.asset(
      "images/groupTransportation/king_long_banner.jpg",
      fit: BoxFit.cover,
    ),
    Image.asset(
      "images/groupTransportation/fuso_track.jpg",
      fit: BoxFit.cover,
    ),
    Image.asset(
      "images/groupTransportation/mercedes_van.jpg",
      fit: BoxFit.cover,
    ),
    Image.asset(
      "images/groupTransportation/mercedes_taxi.jpg",
      fit: BoxFit.cover,
    ),
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (currentPrivateCarsIndex < 4) {
        currentPrivateCarsIndex++;
        privateCarsShowcaseController.animateToPage(
          currentPrivateCarsIndex,
          duration: const Duration(milliseconds: 1500),
          curve: Curves.easeIn,
        );
      } else {
        currentPrivateCarsIndex = 0;
        privateCarsShowcaseController.animateToPage(
          0,
          duration: const Duration(milliseconds: 1500),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    privateCarsShowcaseController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: appBarTitle(),
        centerTitle: true,
        toolbarHeight: MediaQuery.of(context).size.width * 0.05,
      ),
      body: ListView(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.8,
            child: Stack(
              textDirection: TextDirection.rtl,
              fit: StackFit.loose,
              children: [
                PageView.builder(
                  controller: privateCarsShowcaseController,
                  reverse: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return privateCarsShowcaseImages[index];
                  },
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: privateCarsShowcase(),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.15),
          //Shmuel Harlap profile & Colmobil
          Padding(
            padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              textDirection: TextDirection.rtl,
              children: [
                CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.1,
                  backgroundImage: const AssetImage(
                    "images/shmuel_harlap.webp",
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textDirection: TextDirection.rtl,
                  children: [
                    Text(
                      "ד\"ר שמואל חרל\"פ",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).textScaleFactor * 60,
                      ),
                    ),
                    const Divider(
                      thickness: 5,
                      height: 10,
                      color: Colors.white,
                    ),
                    Text(
                      " אוטונומי, שיתופי, פרטי",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: MediaQuery.of(context).textScaleFactor * 50,
                      ),
                    ),
                    Text(
                      "יו\"ר קבוצת כלמוביל",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: MediaQuery.of(context).textScaleFactor * 30,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Wrap(
                    spacing: MediaQuery.of(context).size.width * 0.05,
                    runSpacing: MediaQuery.of(context).size.height * 0.1,
                    alignment: WrapAlignment.center,
                    textDirection: TextDirection.rtl,
                    children: [
                      //Team
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("images/colmobil_team.png"),
                          Text(
                            "הנהלת הקבוצה",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).textScaleFactor * 40,
                            ),
                          ),
                          Text(
                            "כולם חושבים שכלמוביל זה עסק של מכוניות.\nאבל בעצם זה עסק של אנשים",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).textScaleFactor * 20,
                            ),
                          ),
                        ],
                      ),
                      //Values
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("images/colmobil_values.png"),
                          Text(
                            "חזון וערכים",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).textScaleFactor * 40,
                            ),
                          ),
                          Text(
                            "לפתח ולספק עבור הלקוחות את\nהפתרונות, המוצרים והשירותים\nהמתאימים בענף התחבורה",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).textScaleFactor * 20,
                            ),
                          ),
                        ],
                      ),
                      //Our story
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("images/colmobil_story_logo.png"),
                          Text(
                            "הסיפור שלנו",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).textScaleFactor * 40,
                            ),
                          ),
                          Text(
                            "שורשיה של קבוצת כלמוביל החלו לצמוח\nבראשית המאה ה-20",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).textScaleFactor * 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.15),
          Padding(
            padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.065),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.45,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                color: Colors.transparent,
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.065),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textDirection: TextDirection.rtl,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.asset(
                        "images/colmobil_wall.jpg",
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.6,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      textDirection: TextDirection.rtl,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.03,
                          ),
                          child: Text(
                            "מגוון פתרונות משתלמים לעולם הרכב",
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).textScaleFactor * 50,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.02,
                          ),
                          child: Text(
                            "קבוצת כלמוביל מספקת מענה מקיף לכלל צרכי הנהגים: רכישת\nרכב חדש, יד שניה וטרייד אין, מסלולי מימון וביטוח\nמשתלמים ומרכזי שירות >",
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize:
                                  MediaQuery.of(context).textScaleFactor * 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            textDirection: TextDirection.rtl,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.width * 0.22,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textDirection: TextDirection.rtl,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.03,
                          right: MediaQuery.of(context).size.width * 0.02),
                      child: Text(
                        "פתרונות מימון",
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).textScaleFactor * 50,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.02,
                          right: MediaQuery.of(context).size.width * 0.02),
                      child: Text(
                        "הלוואות וליסינג לפרטיים ולחברות.\nנסייע לכם לרכוש את הרכב\nשתרצו במסלול המתאים ביותר\nעבורכם",
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: MediaQuery.of(context).textScaleFactor * 30,
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.13,
                        height: MediaQuery.of(context).size.height * 0.07,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 16, 16, 16),
                            ),
                            child: Text(
                              "לפרטים נוספים",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).textScaleFactor * 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.width * 0.22,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textDirection: TextDirection.rtl,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.03,
                          right: MediaQuery.of(context).size.width * 0.02),
                      child: Text(
                        "ביטוח רכב",
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).textScaleFactor * 50,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.02,
                          right: MediaQuery.of(context).size.width * 0.02),
                      child: Text(
                        "קונים רכב וביטוח במקום אחד:\nקבלו מאיתנו את הצעת הביטוח\nהמתאימה לכם",
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: MediaQuery.of(context).textScaleFactor * 30,
                        ),
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.095),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.13,
                        height: MediaQuery.of(context).size.height * 0.07,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 16, 16, 16),
                            ),
                            child: Text(
                              "לפרטים נוספים",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).textScaleFactor * 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: MediaQuery.of(context).size.width * 0.07,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        textDirection: TextDirection.rtl,
                        children: [
                          Text(
                            "רכישת רכב יד שנייה",
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize:
                                  MediaQuery.of(context).textScaleFactor * 30,
                            ),
                          ),
                          Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: MediaQuery.of(context).size.width * 0.02,
                          ),
                        ],
                      )),
                  SizedBox(height: MediaQuery.of(context).size.width * 0.01),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: MediaQuery.of(context).size.width * 0.07,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        textDirection: TextDirection.rtl,
                        children: [
                          Text(
                            "יתרונות טרייד אין",
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize:
                                  MediaQuery.of(context).textScaleFactor * 30,
                            ),
                          ),
                          Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: MediaQuery.of(context).size.width * 0.02,
                          ),
                        ],
                      )),
                  SizedBox(height: MediaQuery.of(context).size.width * 0.01),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: MediaQuery.of(context).size.width * 0.07,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        textDirection: TextDirection.rtl,
                        children: [
                          Text(
                            "מרכזי שירות",
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize:
                                  MediaQuery.of(context).textScaleFactor * 30,
                            ),
                          ),
                          Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: MediaQuery.of(context).size.width * 0.02,
                          ),
                        ],
                      )),
                ],
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          //Group transportation showcase
          Padding(
            padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.05),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Stack(
                textDirection: TextDirection.rtl,
                fit: StackFit.loose,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: PageView.builder(
                      controller: privateCarsShowcaseController,
                      reverse: true,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return groupTransportationShowcaseImages[index];
                      },
                    ),
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.1,
                    top: MediaQuery.of(context).size.height * 0.07,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        runSpacing: MediaQuery.of(context).size.height * 0.1,
                        spacing: MediaQuery.of(context).size.width * 0.02,
                        children: const [
                          CustomButton(
                            title: "אוטובוסים",
                          ),
                          CustomButton(
                            title: "מסחריות",
                          ),
                          CustomButton(
                            title: "מוניות פרטיות",
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.1,
                    bottom: MediaQuery.of(context).size.height * 0,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.05),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: groupTransportationShowcase(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
          ),
        ],
      ),
    );
  }

  Widget appBarTitle() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        textDirection: TextDirection.rtl,
        children: [
          Image.asset(
            "images/header_logo.png",
            width: MediaQuery.of(context).size.width * 0.1,
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "א ו ד ו ת י נ ו",
              textDirection: TextDirection.rtl,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).textScaleFactor * 25,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "ר כ ב י ם",
              textDirection: TextDirection.rtl,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).textScaleFactor * 25,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "פ ת ר ו נ ו ת",
              textDirection: TextDirection.rtl,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).textScaleFactor * 25,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "מ ר כ ז י  ש י ר ו ת",
              textDirection: TextDirection.rtl,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).textScaleFactor * 25,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "ק ר י י ר ה",
              textDirection: TextDirection.rtl,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).textScaleFactor * 25,
              ),
            ),
          ),
        ],
      );

  Widget privateCarsShowcase() => Wrap(
        spacing: MediaQuery.of(context).size.width * 0.005,
        alignment: WrapAlignment.center,
        textDirection: TextDirection.rtl,
        children: [
          Image.asset(
            "images/privateCars/Hyundai_flat_logo.png",
            width: MediaQuery.of(context).size.width * 0.05,
          ),
          Image.asset(
            "images/privateCars/mitsubishi-logo-white.png",
            width: MediaQuery.of(context).size.width * 0.05,
          ),
          Image.asset(
            "images/privateCars/smart_flat_logo.png",
            width: MediaQuery.of(context).size.width * 0.05,
          ),
          Image.asset(
            "images/privateCars/Mercedes_flat_logo.png",
            width: MediaQuery.of(context).size.width * 0.05,
          ),
          Image.asset(
            "images/privateCars/Genesis_flat_logo.png",
            width: MediaQuery.of(context).size.width * 0.05,
          ),
        ],
      );
  Widget groupTransportationShowcase() => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "images/groupTransportation/fuso_logo.png",
            width: MediaQuery.of(context).size.width * 0.05,
          ),
          Image.asset(
            "images/groupTransportation/king_long_logo.png",
            width: MediaQuery.of(context).size.width * 0.05,
          ),
          Image.asset(
            "images/privateCars/Hyundai_flat_logo.png",
            width: MediaQuery.of(context).size.width * 0.05,
          ),
          Image.asset(
            "images/privateCars/Mercedes_flat_logo.png",
            width: MediaQuery.of(context).size.width * 0.05,
          ),
        ],
      );
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.13,
      height: MediaQuery.of(context).size.height * 0.07,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 16, 16, 16),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).textScaleFactor * 20,
            ),
          ),
        ),
      ),
    );
  }
}
