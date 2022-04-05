import 'package:flutter/material.dart';
import 'package:genshin_project/data/weaponData.dart';
import 'package:genshin_project/page/weaponsPage/weaponsCheckType.dart';

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
    return Scaffold(
        appBar: AppBar(
          title: Text(weaData.name),
        ),
        body: Column(
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
                            'assets/images/weapons/${weaponsCheckType(weaponType: weaData.type)}/${weaData.slug}.webp',
                            fit: BoxFit.cover,
                            height: 420.0,
                          ),
                        ),

                        Center(
                          child: Image.asset(
                            'assets/images/weapons/2nd-${weaponsCheckType(weaponType: weaData.type)}/${weaData.slug}.webp',
                            fit: BoxFit.cover,
                            height: 300.0,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        )
    );
  }
}
