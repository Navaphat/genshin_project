import 'package:flutter/material.dart';
import 'package:genshin_project/data/characterData.dart';

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
                              'assets/images/characters/full-art-${charData.vision}/${charData.slug}.webp',
                              fit: BoxFit.cover,
                              height: 420.0,
                            ),
                          ),

                          Center(
                            child: Image.asset(
                              'assets/images/characters/${charData.vision}-con/${charData.slug}.webp',
                              fit: BoxFit.cover,
                              height: 350.0,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Table(
                        columnWidths: {1: FractionColumnWidth(.7)},
                        children: [
                          TableRow(
                            children: [
                              Card(child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(child: Text('Rarity')),
                              )),
                              Card(child: Image.asset('assets/images/raritys/${(charData.rarity == 5)? '5-stars' : '4-stars'}.webp',height: 32.0,)),
                            ],
                          ),

                          TableRow(
                            children: [
                              Card(child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(child: Text('Weapon Type')),
                              )),
                              Card(child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(child: Text('${charData.weapon.toString().substring(7).toUpperCase()}')),
                              )),
                            ],
                          ),

                          TableRow(
                            children: [
                              Card(child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(child: Text('Element')),
                              )),
                              Card(child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset('assets/images/visions/${charData.vision}.png',height: 30.0,),
                              )),
                            ],
                          ),

                          TableRow(
                            children: [
                              Card(child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(child: Text('Gender')),
                              )),
                              Card(child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(child: Text('${charData.gender.toString().substring(7)}')),
                              )),
                            ],
                          ),

                          TableRow(
                            children: [
                              Card(child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(child: Text('Birthday')),
                              )),
                              Card(child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(child: Text(charData.birthday)),
                              )),
                            ],
                          ),

                          TableRow(
                            children: [
                              Card(child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(child: Text('In-game Description')),
                              )),
                              Card(child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(child: Text(charData.description)),
                              )),
                            ],
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
