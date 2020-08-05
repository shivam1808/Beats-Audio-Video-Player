import 'package:Beats/screens/audio_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Beats/screens/audio/offlinlibrary.dart';
import 'package:Beats/screens/video/offlinevideo.dart';
import 'package:Beats/screens/home_screen.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Homebody(),
    );
  }
}

class Homebody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        height: size.height,
        width: size.width,
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              heightFactor: 2,
              child: Text(
                "Music",
                style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: Colors.white30.withOpacity(0.1),
                    child: InkWell(
                      splashColor: Colors.red,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (contex) => Offlinelibrary(),
                        ),
                      ),
                      child: Container(
                          width: 170,
                          height: 185,
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                title: Text(
                                  "Stream Music",
                                  style: GoogleFonts.lato(
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.orangeAccent,
                                ),
                              ),
                              Image.asset(
                                "assets/icons/hashTagMusic.gif",
                                fit: BoxFit.fill,
                              )
                            ],
                          )),
                    ),
                  ),
                ),
                GestureDetector(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: Colors.white30.withOpacity(0.1),
                    child: InkWell(
                      splashColor: Colors.red,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (contex) => AudioScreen(),
                        ),
                      ),
                      child: Container(
                          width: 170,
                          height: 185,
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                title: Text(
                                  "My Music",
                                  style: GoogleFonts.lato(
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.orangeAccent,
                                ),
                              ),
                              Image.asset(
                                "assets/icons/mymusic.gif",
                                fit: BoxFit.fill,
                              )
                            ],
                          )),
                    ),
                  ),
                ),
              ],
            ),
            _divider(),
            Align(
              alignment: Alignment.topCenter,
              heightFactor: 2,
              child: Text(
                "Video",
                style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: Colors.white30.withOpacity(0.1),
                    child: InkWell(
                      splashColor: Colors.red,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (contex) => HomeScreen(),
                        ),
                      ),
                      child: Container(
                          width: 170,
                          height: 185,
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                title: Text(
                                  "Stream Video",
                                  style: GoogleFonts.lato(
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.orangeAccent,
                                ),
                              ),
                              Image.asset(
                                "assets/icons/watch.gif",
                                fit: BoxFit.fill,
                              )
                            ],
                          )),
                    ),
                  ),
                ),
                GestureDetector(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: Colors.white30.withOpacity(0.1),
                    child: InkWell(
                      splashColor: Colors.red,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (contex) => Offlinevideo(),
                        ),
                      ),
                      child: Container(
                          width: 170,
                          height: 185,
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                title: Text(
                                  "My Video",
                                  style: GoogleFonts.lato(
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.orangeAccent,
                                ),
                              ),
                              Image.asset(
                                "assets/icons/video.gif",
                                fit: BoxFit.fill,
                              )
                            ],
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _divider() {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 20),
    child: Row(
      children: <Widget>[
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              color: Colors.orangeAccent.withOpacity(0.6),
              thickness: 1,
            ),
          ),
        ),
        Center(
          child: Icon(
            Icons.favorite,
            color: Colors.white,
            size: 45.0,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              color: Colors.orangeAccent.withOpacity(0.6),
              thickness: 1,
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
      ],
    ),
  );
}
