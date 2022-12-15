import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MySplashPage extends StatefulWidget {
  const MySplashPage();

  @override
  State<MySplashPage> createState() => _MySplashPageState();
}

class _MySplashPageState extends State<MySplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(24, 24, 24, 100),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(
                  "O V E R F L O W",
                  style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.displayMedium,
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.w900),
                ),
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: SvgPicture.asset(
                    'assets/images/11.svg',
                    width: 250,
                    height: 250,
                  )),
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: Text(
                      "Live Life, Independently.",
                      style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.displayMedium,
                          color: Colors.white,
                          fontSize: 45,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    child: const Text(
                      "Let us take care of managing your expense while you enjoy your life with family and friends.",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "Get Started",
                        style: TextStyle(fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
