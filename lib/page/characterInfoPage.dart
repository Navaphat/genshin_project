import 'package:flutter/material.dart';
import 'package:genshin_project/data/characterData.dart';
import 'package:genshin_project/page/charactersPage/charactersCheckVision.dart';

class characterInfoPage extends StatefulWidget {
  var index;
  characterInfoPage({Key? key, required var this.index}) : super(key: key);

  @override
  State<characterInfoPage> createState() => _characterInfoPageState();
}

class _characterInfoPageState extends State<characterInfoPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var charData = CharacterData.data[widget.index];
    return Scaffold(
        appBar: AppBar(
          title: Text(charData.name),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: TabBar(
                        labelColor: Colors.blue,
                        tabs: [
                          Tab(text: 'Wish Art',),
                          Tab(text: 'Constellation',)
                        ],
                      ),
                    ),

                    Container(
                      height: 400.0,
                      child: TabBarView(
                        children: [
                          Center(
                            child: Image.asset(
                              'assets/images/characters/full-art-${charactersCheckVision(vision: charData.vision)}/${charData.slug}.webp',
                              fit: BoxFit.cover,
                              height: 420.0,
                            ),
                          ),

                          Center(
                            child: Image.asset(
                              'assets/images/characters/${charactersCheckVision(vision: charData.vision)}-con/${charData.slug}.webp',
                              fit: BoxFit.cover,
                              height: 350.0,
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}
