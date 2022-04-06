import 'package:flutter/material.dart';
import 'package:genshin_project/data/weaponData.dart';

class weaponInfoPage extends StatefulWidget {

  var index;

  weaponInfoPage({Key? key, required this.index}) : super(key: key);

  @override
  State<weaponInfoPage> createState() => _weaponInfoPageState();
}

class _weaponInfoPageState extends State<weaponInfoPage> {
  @override
  Widget build(BuildContext context) {
    var weaData = WeaponData.data[widget.index];
    var weaType = weaData.type.toString().substring(5);
    return Scaffold(
        appBar: AppBar(
          title: Text(weaData.name),
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
                          Tab(text: 'Base',),
                          Tab(text: '2nd Ascension',)
                        ],
                      ),
                    ),

                    Container(
                      height: 300.0,
                      child: TabBarView(
                        children: [
                          Center(
                            child: Image.asset(
                              'assets/images/weapons/$weaType/${weaData.slug}.webp',
                              fit: BoxFit.cover,
                              height: 420.0,
                            ),
                          ),

                          Center(
                            child: Image.asset(
                              'assets/images/weapons/2nd-$weaType/${weaData.slug}.webp',
                              fit: BoxFit.cover,
                              height: 300.0,
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
