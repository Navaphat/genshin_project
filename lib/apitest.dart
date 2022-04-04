
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:genshin_project/model/CharacterApiResult.dart';
import 'package:genshin_project/model/WeaponApiResult.dart';
import 'package:genshin_project/data/characterData.dart';
import 'package:genshin_project/data/weaponData.dart';
import 'package:genshin_project/page/charactersPage/viewAllCharacters.dart';
import 'package:genshin_project/page/charactersPage/viewAnemoCharacters.dart';
import 'package:genshin_project/page/charactersPage/viewCryoCharacters.dart';
import 'package:genshin_project/page/charactersPage/viewElectroCharacters.dart';
import 'package:genshin_project/page/charactersPage/viewGeoCharacters.dart';
import 'package:genshin_project/page/charactersPage/viewHydroCharacters.dart';
import 'package:genshin_project/page/charactersPage/viewPyroCharacters.dart';
import 'package:genshin_project/page/weaponsPage/viewAllWeapons.dart';
import 'package:genshin_project/page/weaponsPage/viewBowWeapons.dart';
import 'package:genshin_project/page/weaponsPage/viewCatalystWeapons.dart';
import 'package:genshin_project/page/weaponsPage/viewClaymoreWeapons.dart';
import 'package:genshin_project/page/weaponsPage/viewPolearmWeapons.dart';
import 'package:genshin_project/page/weaponsPage/viewSwordWeapons.dart';
import 'package:http/http.dart' as http;

class apiTest extends StatefulWidget {
  const apiTest({Key? key}) : super(key: key);

  @override
  State<apiTest> createState() => _apiTestState();
}

class _apiTestState extends State<apiTest> with TickerProviderStateMixin {

  var _isLoading = false;
  late TabController _tabControllerCharacters;
  late TabController _tabControllerWeapons;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabControllerCharacters = TabController(length: 7, vsync: this);
    _tabControllerWeapons = TabController(length: 6, vsync: this);
    _apiConnected();
  }
  _apiConnected() async {
    setState(() {
      _isLoading = true;
    });

    final Uri urlCharacters = Uri.parse('https://genshinlist.com/api/characters');
    var respondCharacters = await http.get(urlCharacters);
    final Uri urlWeapons = Uri.parse('https://genshinlist.com/api/weapons');
    var respondWeapons = await http.get(urlWeapons);


    setState(() {
      _isLoading = false;
    });
    //var json = jsonDecode(respondCharacters.body);
    var charData = apiResultFromJson(respondCharacters.body);
    var weaData = weaponApiResultFromJson(respondWeapons.body);
    setState(() {
      CharacterData.data = charData;
      WeaponData.data = weaData;
    });

    print(respondWeapons.body);
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Genshin Impact'),
          bottom: const TabBar(
              tabs: [
                Tab(text: 'Characters',),
                Tab(text: 'Weapons',),
                Tab(text: 'Artifacts',),
              ],
            ),
          ),
        body: Stack(
          children: [
            if (_isLoading)
              const Center(
                child: SizedBox(
                  width: 40.0,
                  height: 40.0,
                  child: CircularProgressIndicator(),
                ),
              )
            else
              TabBarView(
                  children: [
                    _subTabBarCharacters(),
                    _subTabBarWeapons(),
                    Center(child: Text('Comming Soon', style: TextStyle(fontSize: 100.0),)),
                  ]
              ),
          ],
        ),
      ),
    );
  }

  Widget _subTabBarCharacters() {
   var charDataLength = CharacterData.data.length;
    return Column(
      children: [
        Container(
          color: Colors.white,
          child: TabBar(
            controller: _tabControllerCharacters,
            labelColor: Colors.blue,
            tabs: [
              Tab(text: 'All',),
              Tab(text: 'Pyro',),
              Tab(text: 'Cryo',),
              Tab(text: 'Hydro',),
              Tab(text: 'Anemo',),
              Tab(text: 'Electro',),
              Tab(text: 'Geo',),
            ],
          ),
        ),

        Flexible(
          child: Container(
            child: TabBarView(
              controller: _tabControllerCharacters,
              children: [
                viewAllCharacter(index: charDataLength),
                SingleChildScrollView(child: viewPyroCharacter(index: charDataLength)),
                SingleChildScrollView(child: viewCryoCharacter(index: charDataLength)),
                SingleChildScrollView(child: viewHydroCharacter(index: charDataLength)),
                SingleChildScrollView(child: viewAnemoCharacter(index: charDataLength)),
                SingleChildScrollView(child: viewElectroCharacter(index: charDataLength)),
                SingleChildScrollView(child: viewGeoCharacter(index: charDataLength)),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _subTabBarWeapons() {
    var weaDataLength = WeaponData.data.length;
    return Column(
      children: [
        Container(
          color: Colors.white,
          child: TabBar(
            controller: _tabControllerWeapons,
            labelColor: Colors.blue,
            tabs: [
              Tab(text: 'All',),
              Tab(text: 'Sword',),
              Tab(text: 'Bow',),
              Tab(text: 'Claymore',),
              Tab(text: 'Polearm',),
              Tab(text: 'Catalyst',),
            ],
          ),
        ),

        Flexible(
          child: Container(
            child: TabBarView(
              controller: _tabControllerWeapons,
              children: [
                viewAllWeapon(index: weaDataLength),
                SingleChildScrollView(child: viewSwordWeapons(index: weaDataLength)),
                SingleChildScrollView(child: viewBowWeapons(index: weaDataLength)),
                SingleChildScrollView(child: viewClaymoreWeapons(index: weaDataLength),),
                SingleChildScrollView(child: viewPolearmWeapons(index: weaDataLength),),
                SingleChildScrollView(child: viewCatalystWeapons(index: weaDataLength),),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


