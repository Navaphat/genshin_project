
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

class GenshinImpact extends StatefulWidget {
  const GenshinImpact({Key? key}) : super(key: key);

  @override
  State<GenshinImpact> createState() => _GenshinImpactState();
}

class _GenshinImpactState extends State<GenshinImpact> with TickerProviderStateMixin {

  var _isLoading = false;
  late TabController _mainTabController;
  late TabController _tabControllerCharacters;
  late TabController _tabControllerWeapons;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabControllerCharacters = TabController(length: 7, vsync: this);
    _tabControllerWeapons = TabController(length: 6, vsync: this);
    _mainTabController = TabController(length: 3, vsync: this);
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Genshin Impact'),
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
            _mainTabBar(),
        ],
      ),
    );
  }

  Widget _mainTabBar() {
    return Column(
      children: [
        Container(
          color: Colors.white,
          child: TabBar(
            labelColor: Colors.blue,
            controller: _mainTabController,
            tabs: [
              Tab(text: 'Characters',),
              Tab(text: 'Weapons',),
              Tab(text: 'Artifacts',),
            ],
          ),
        ),

        Flexible(
          child: Container(
            child: TabBarView(
              controller: _mainTabController,
              children: [
                _subTabBarCharacters(),
                _subTabBarWeapons(),
                Center(child: Text('Comming Soon', style: TextStyle(fontSize: 100.0),)),
              ],
            ),
          ),
        ),
      ],
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
              Flexible(child: Tab(text: 'All',)),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/visions/pyro.png', width: 30.0,),
                  Flexible(child: Tab(text: 'Pyro',)),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/visions/cryo.png', width: 30.0,),
                  Flexible(child: Tab(text: 'Cryo',)),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/visions/hydro.png', width: 30.0,),
                  Flexible(child: Tab(text:'Hydro',)),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/visions/anemo.png', width: 30.0,),
                  Flexible(child: Tab(text: 'Amemo',)),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/visions/electro.png', width: 30.0,),
                  Flexible(child: Tab(text: 'Electro',)),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/visions/geo.png', width: 30.0,),
                  Flexible(child: Tab(text: 'Geo',)),
                ],
              ),
            ],
          ),
        ),

        Flexible(
          child: Container(
            child: TabBarView(
              controller: _tabControllerCharacters,
              children: [
                viewAllCharacter(index: charDataLength),
                SingleChildScrollView(child: viewPyroCharacter(index: charDataLength, context: context)),
                SingleChildScrollView(child: viewCryoCharacter(index: charDataLength, context: context)),
                SingleChildScrollView(child: viewHydroCharacter(index: charDataLength, context: context)),
                SingleChildScrollView(child: viewAnemoCharacter(index: charDataLength, context: context)),
                SingleChildScrollView(child: viewElectroCharacter(index: charDataLength, context: context)),
                SingleChildScrollView(child: viewGeoCharacter(index: charDataLength, context: context)),
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
              Flexible(child: Tab(text: 'All',)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/icons/weapons/sword.webp', width: 30.0,),
                  Flexible(child: Tab(text: 'Sword',)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/icons/weapons/bow.webp', width: 30.0,),
                  Flexible(child: Tab(text: 'Bow',)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/icons/weapons/claymore.webp', width: 30.0,),
                  Flexible(child: Tab(text: 'Claymore',)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/icons/weapons/polearm.webp', width: 30.0,),
                  Flexible(child: Tab(text: 'Polearm',)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/icons/weapons/catalyst.webp', width: 30.0,),
                  Flexible(child: Tab(text: 'Catalyst',)),
                ],
              ),
            ],
          ),
        ),

        Flexible(
          child: Container(
            child: TabBarView(
              controller: _tabControllerWeapons,
              children: [
                viewAllWeapon(index: weaDataLength),
                SingleChildScrollView(child: viewSwordWeapons(index: weaDataLength, context: context)),
                SingleChildScrollView(child: viewBowWeapons(index: weaDataLength, context: context)),
                SingleChildScrollView(child: viewClaymoreWeapons(index: weaDataLength, context: context),),
                SingleChildScrollView(child: viewPolearmWeapons(index: weaDataLength, context: context),),
                SingleChildScrollView(child: viewCatalystWeapons(index: weaDataLength, context: context),),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


