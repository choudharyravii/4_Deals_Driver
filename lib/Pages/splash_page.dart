import 'package:flutter/material.dart';
import 'package:four_deals_app/Models/data.dart';
import 'package:four_deals_app/Pages/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    initializeData();
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Image.asset(
              Data.imgBasePath + "center_glow.png",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Image.asset(
              Data.imgBasePath + "bg.png",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Positioned(
                top: Data.height * 10,
                width: Data.width * 100,
                child: Image.asset("assets/images/icons8-delivery.png")),
            Positioned(
                top: Data.height * 47,
                width: Data.width * 100,
                child: Image.asset("assets/images/logo.png")),
                Positioned(
                top: Data.height * 47,
                width: Data.width * 100,
                child: Image.asset("assets/images/Driver.png")),
            Positioned(
              bottom: Data.height * -7,
              width: Data.width * 100,
              child: InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>  Login(),
                )),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Image.asset("assets/images/icon_next_page.png"),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: Data.height * 95),
                width: Data.width * 100,
                alignment: Alignment.center,
                child: RichText(
                    text: const TextSpan(
                        text: "Powered By :  ",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w500),
                        children: [
                      TextSpan(
                          text: "Hamilton Services",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold))
                    ])))
          ],
        ),
      ),
    );
  }

  initializeData() {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    Data.height = (mediaQueryData.size.height -
            mediaQueryData.padding.top -
            mediaQueryData.padding.bottom) /
        100;
    Data.width = mediaQueryData.size.width / 100;
  }
}
