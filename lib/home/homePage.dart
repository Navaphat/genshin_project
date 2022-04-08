import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:genshin_project/GenshinImpact.dart';
import 'package:genshin_project/home/blinkingText.dart';
import 'package:genshin_project/home/youtubePlayer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => GenshinImpact()));
      },
      child: Scaffold(
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background/genshin-impact-07.jpg',),
                fit: BoxFit.cover,
              )
            ),

          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 45.0),
                  child: BlinkingText('Tap to Enter'),
                ),
                //Text('Tap to Enter', style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold, color: Colors.white,), ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 15.0, right: 200.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: ElevatedButton(
                    onPressed: _launchURLOffSite,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Official Website', style: GoogleFonts.prata(fontSize: 25.0),),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 15.0, right: 15.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: ElevatedButton(
                    onPressed: _launchURLDownload,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Download', style: GoogleFonts.prata(fontSize: 25.0),),
                    ),
                  ),
                ),
              ),

              Align(
                alignment: Alignment.center,
                child: Material(
                  borderRadius: BorderRadius.circular(100.0),
                  child: InkWell(
                    customBorder: CircleBorder(),
                    child: Icon(Icons.play_circle_fill_outlined, size: 100.0,),
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: youtubePlayer(url: 'https://youtu.be/LqCwQicfMuc?list=TLGGH88GQr71G38wODA0MjAyMg'),
                      ),
                    ),
                    splashColor: Colors.greenAccent,
                  ),
                  color: Colors.blue.withOpacity(.5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _launchURLOffSite() async {
    const url = 'https://genshin.hoyoverse.com/en/home';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURLDownload() async {
    const url = 'https://genshin.hoyoverse.com/en/download';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
