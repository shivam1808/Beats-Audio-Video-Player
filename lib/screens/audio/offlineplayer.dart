import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:Beats/data/data.dart';

class OfflinePlayer extends StatefulWidget {
  final Data data;

  const OfflinePlayer({Key key, this.data}) : super(key: key);
  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<OfflinePlayer>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<Color> _colorTween;
  AudioPlayer _player;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _colorTween = _animationController
        .drive(ColorTween(begin: Colors.orangeAccent, end: Colors.black));
    _animationController.forward();
    // AudioPlayer.setIosCategory(IosCategory.playback);
    _player = AudioPlayer();
    _player.setAsset(widget.data.asset).then((value) => _player.play());
    // _player.setAsset(widget.data.asset).then((value) => _player.play());
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      title: Text(
        "Now Playing",
        style: GoogleFonts.lato(),
      ),
      centerTitle: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBar(context),
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: ClipRRect(
                child: Image.asset(
                  widget.data.thumb,
                  fit: BoxFit.contain,
                  width: 330,
                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(200),
                    bottomRight: Radius.circular(200)),
              ),
            ),
            Column(
              children: <Widget>[
                Text(
                  widget.data.title,
                  style: GoogleFonts.lato(color: Colors.white, fontSize: 22.0),
                ),
                SizedBox(height: 5),
                Text(
                  widget.data.artist,
                  style:
                      GoogleFonts.lato(color: Colors.white30, fontSize: 15.0),
                ),
                StreamBuilder<Duration>(
                  stream: _player.durationStream,
                  builder: (context, snapshot) {
                    final duration = snapshot.data ?? Duration.zero;
                    return StreamBuilder<Duration>(
                      stream: _player.getPositionStream(),
                      builder: (context, snapshot) {
                        var position = snapshot.data ?? Duration.zero;
                        if (position > duration) {
                          position = duration;
                        }
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40.0, vertical: 0),
                          child: SeekBar(
                            duration: duration,
                            position: position,
                            onChangeEnd: (newPosition) {
                              _player.seek(newPosition);
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),

            StreamBuilder<FullAudioPlaybackState>(
              stream: _player.fullPlaybackStateStream,
              builder: (context, snapshot) {
                final fullState = snapshot.data;
                final state = fullState?.state;
                final buffering = fullState?.buffering;
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  color: Colors.pinkAccent.withOpacity(0.5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.skip_previous),
                        iconSize: 30.0,
                        color: Colors.white,
                        onPressed: () {},
                      ),
                      if (state == AudioPlaybackState.connecting ||
                          buffering == true)
                        Container(
                          margin: EdgeInsets.all(8.0),
                          width: 30.0,
                          height: 30.0,
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.white,
                            strokeWidth: 3,
                            valueColor: _colorTween,
                          ),
                        )
                      else if (state == AudioPlaybackState.playing)
                        IconButton(
                          icon: Icon(Icons.pause),
                          iconSize: 60.0,
                          color: Colors.white,
                          onPressed: _player.pause,
                        )
                      else
                        IconButton(
                          icon: Icon(Icons.play_arrow),
                          iconSize: 60.0,
                          color: Colors.white,
                          onPressed: _player.play,
                        ),
                      IconButton(
                        icon: Icon(Icons.skip_next),
                        iconSize: 30.0,
                        color: Colors.white,
                        onPressed: () {},
                      ),
                    ],
                  ),
                );
              },
            ),

            StreamBuilder(
              builder: (context, snapshot) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Colors.white.withOpacity(0.1),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.share),
                        iconSize: 30.0,
                        tooltip: "Share",
                        color: Colors.white,
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.playlist_add),
                        iconSize: 30.0,
                        tooltip: "Playlist",
                        color: Colors.white,
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.file_download),
                        iconSize: 30.0,
                        tooltip: "Download",
                        color: Colors.white,
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.tune),
                        iconSize: 30.0,
                        tooltip: "Tune",
                        color: Colors.white,
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.more_vert),
                        iconSize: 30.0,
                        tooltip: "More",
                        color: Colors.white,
                        onPressed: () {},
                      ),
                    ],
                  ),
                );
              },
            )

            // StreamBuilder<double>(
            //   stream: _volumeSubject.stream,
            //   builder: (context, snapshot) => Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 20.0),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: <Widget>[
            //         Text(
            //           'Volume',
            //           style: GoogleFonts.lato(color: Colors.grey),
            //         ),
            //         Slider(
            //           label: "Volume",
            //           activeColor: Colors.white.withOpacity(0.6),
            //           inactiveColor: Colors.white30.withOpacity(0.1),
            //           divisions: 10,
            //           min: 0.0,
            //           max: 2.0,
            //           value: snapshot.data ?? 1.0,
            //           onChanged: (value) {
            //             _volumeSubject.add(value);
            //             _player.setVolume(value);
            //           },
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // Text("Speed"),
            // StreamBuilder<double>(
            //   stream: _speedSubject.stream,
            //   builder: (context, snapshot) => Slider(
            //     divisions: 10,
            //     min: 0.5,
            //     max: 1.5,
            //     value: snapshot.data ?? 1.0,
            //     onChanged: (value) {
            //       _speedSubject.add(value);
            //       _player.setSpeed(value);
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
    // );
  }
}

class SeekBar extends StatefulWidget {
  final Duration duration;
  final Duration position;
  final ValueChanged<Duration> onChanged;
  final ValueChanged<Duration> onChangeEnd;

  SeekBar({
    @required this.duration,
    @required this.position,
    this.onChanged,
    this.onChangeEnd,
  });

  @override
  _SeekBarState createState() => _SeekBarState();
}

class _SeekBarState extends State<SeekBar> {
  double _dragValue;

  @override
  Widget build(BuildContext context) {
    return Slider(
      activeColor: Colors.pink,
      inactiveColor: Colors.white30.withOpacity(0.1),
      min: 0.0,
      max: widget.duration.inMilliseconds.toDouble(),
      value: _dragValue ?? widget.position.inMilliseconds.toDouble(),
      onChanged: (value) {
        setState(() {
          _dragValue = value;
        });
        if (widget.onChanged != null) {
          widget.onChanged(Duration(milliseconds: value.round()));
        }
      },
      onChangeEnd: (value) {
        _dragValue = null;
        if (widget.onChangeEnd != null) {
          widget.onChangeEnd(Duration(milliseconds: value.round()));
        }
      },
    );
  }
}
