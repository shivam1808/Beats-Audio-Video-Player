import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Beats/data/data.dart';
import 'package:Beats/screens/video/offlineplayer.dart';

class Offlinevideo extends StatelessWidget {
  AppBar appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.pink,
      title: Text(
        "My Videos",
        style: GoogleFonts.lato(),
      ),
      centerTitle: true,
    );
  }

  BottomAppBar bottomAppBar(BuildContext context) {
    return BottomAppBar(
      color: Colors.pink.withOpacity(0.1),
      notchMargin: 5,
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.video_library,
              color: Colors.white,
            ),
            iconSize: 28.0,
            tooltip: "Video Library",
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            iconSize: 28.0,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBar(context),
      body: AudioBody(),
      bottomNavigationBar: bottomAppBar(context),
    );
  }
}

class AudioBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      minimum: EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: size.height,
        width: size.width,
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: videos.length,
                itemBuilder: (BuildContext context, int index) =>
                    BuildVideoCard(
                  video: videos[index],
                  itemIndex: index,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildVideoCard extends StatelessWidget {
  final int itemIndex;
  final Video video;

  const BuildVideoCard({
    Key key,
    this.itemIndex,
    this.video,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: Colors.pink.withOpacity(0.5),
        child: InkWell(
          splashColor: Colors.red,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contex) => OfflineVideoPlayer(
                video: videos[itemIndex],
              ),
            ),
          ),
          child: Container(
              width: 200,
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text(
                      video.title,
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    subtitle: Text(
                      video.artist,
                      style: GoogleFonts.lato(color: Colors.white54),
                    ),
                    trailing: Icon(
                      Icons.play_arrow,
                      color: Colors.orangeAccent,
                      size: 25.0,
                    ),
                  ),
                  Image.asset(
                    video.thumb,
                    fit: BoxFit.fill,
                  )
                ],
              )),
        ),
      ),
    );
  }
}
