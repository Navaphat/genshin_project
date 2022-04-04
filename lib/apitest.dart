
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:genshin_project/model/CharacterApiResult.dart';
import 'package:genshin_project/model/WeaponApiResult.dart';
import 'package:genshin_project/data/characterData.dart';
import 'package:genshin_project/data/weaponData.dart';
import 'package:http/http.dart' as http;

class apiTest extends StatefulWidget {
  const apiTest({Key? key}) : super(key: key);

  @override
  State<apiTest> createState() => _apiTestState();
}

class _apiTestState extends State<apiTest> with TickerProviderStateMixin {

  var _isLoading = false;
  late TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 3, vsync: this);
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

    print('successful');
  }

  @override
  Widget build(BuildContext context) {
    var charData = CharacterData.data;
    var weaData = WeaponData.data;
    return Scaffold(
      appBar: AppBar(
        title: Text('Genshin Impact'),
        bottom: TabBar(
          controller: controller,
          tabs: [
            Tab(text: 'Characters',),
            Tab(text: 'Weapons',),
            Tab(text:'Artifacts',)
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
                _viewCharacterListView(index: charData.length),
                _viewWeaponViewTen(index: weaData.length),
                Center(
                  child: Text('For Artifacts', style: TextStyle(fontSize: 50.0),),
                )
              ],
              controller: controller,
            )
        ],
      ),
    );
  }

  Widget _viewCharacterListView({required int index}) {
    var charData = CharacterData.data;
    return Flexible(
      child: Container(
        child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            itemCount: index,
            itemBuilder: (context, index) {
              return Card(
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          Image.asset('assets/images/characters/fivestarBG.jpg', width: 100.0, color: (charData[index].rarity == 5)? Colors.orange : Colors.purpleAccent,),
                          Image.asset('assets/images/characters/${charData[index].slug}.webp', width: 100.0,),
                        ],
                      ),
                      SizedBox(width: 8.0,),
                      Text('${charData[index].name}', style: TextStyle(fontSize: 25.0, color: Colors.red),),
                    ],
                  ),
                ),
              );
            }
        ),
      ),
    );
  }

  Widget _viewWeaponViewTen({required int index}) {
    var weaData = WeaponData.data;
    return Flexible(
      child: ListView.builder(
        itemCount: index,
          itemBuilder: (context, index) {
            return Card(
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Image.asset('assets/images/characters/fivestarBG.jpg', width: 100.0,),
                        Image.asset('assets/images/weapons/${weaData[index].slug}.webp', height: 100.0,)
                      ],
                    ),
                    SizedBox(width: 8.0,),
                    Text('${weaData[index].name}', style: TextStyle(fontSize: 20.0),),
                  ],
                ),
              ),
            );
          }
      ),
    );
  }

/*  _view() {
    Stack(
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
          _viewCharacterListView(index: charData.length),
      ],
    );
  }*/

}
