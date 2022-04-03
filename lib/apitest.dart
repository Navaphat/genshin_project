
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

class _apiTestState extends State<apiTest> {

  var _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
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
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _viewCharacterViewTen(),
                    ],
                  ),

                  _viewWeaponViewTen(),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _viewCharacterListView({required int index}) {
    var charData = CharacterData.data;
    return Flexible(
      child: ListView.builder(
          padding: EdgeInsets.all(20.0),
          itemCount: index,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Card(
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      children: [
                        Image.asset('assets/images/characters/${charData[index].slug}.webp',),
                        SizedBox(width: 8.0,),
                        Text('${charData[index].name}', style: TextStyle(fontSize: 50.0, color: Colors.red),),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
      ),
    );
  }

  Widget _viewCharacterGridView({required int index}) {
    var charData = CharacterData.data;
    return Flexible(
      child: GridView.builder(
          padding: EdgeInsets.all(20.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
          ),
          itemCount: charData.length,
          itemBuilder: (context, index) {
            return Card(
              child: InkWell(
                onTap: () {},
                child: Column(
                  children: [
                    Image.asset('assets/images/characters/${charData[index].slug}.webp', width: 150.0,),
                    Text('${charData[index].name}', style: TextStyle(fontSize: 50.0, color: Colors.red),),
                  ],
                ),
              ),
            );
          }
      ),
    );
  }

  Widget _viewCharacterViewTen() {
    var charData = CharacterData.data;
    return Column(
      children: [
        Wrap(
          children: [
            Container(
              child: Row(
                children: [
                  Card(
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Image.asset('assets/images/characters/fivestarBG.jpg', width: 100.0,),
                              Image.asset('assets/images/characters/${charData[0].slug}.webp', width: 100.0,)
                            ],
                          ),
                          SizedBox(width: 8.0,),
                          Text('${charData[0].name}', style: TextStyle(fontSize: 20.0),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              child: Row(
                children: [
                  Card(
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Image.asset('assets/images/characters/fivestarBG.jpg', width: 100.0,),
                              Image.asset('assets/images/characters/${charData[1].slug}.webp', width: 100.0,)
                            ],
                          ),
                          SizedBox(width: 8.0,),
                          Text('${charData[1].name}', style: TextStyle(fontSize: 20.0),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              child: Row(
                children: [
                  Card(
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Image.asset('assets/images/characters/fivestarBG.jpg', width: 100.0,),
                              Image.asset('assets/images/characters/${charData[2].slug}.webp', width: 100.0,)
                            ],
                          ),
                          SizedBox(width: 8.0,),
                          Text('${charData[2].name}', style: TextStyle(fontSize: 20.0),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              child: Row(
                children: [
                  Card(
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Image.asset('assets/images/characters/fivestarBG.jpg', width: 100.0,),
                              Image.asset('assets/images/characters/${charData[3].slug}.webp', width: 100.0,)
                            ],
                          ),
                          SizedBox(width: 8.0,),
                          Text('${charData[3].name}', style: TextStyle(fontSize: 20.0),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              child: Row(
                children: [
                  Card(
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Image.asset('assets/images/characters/fivestarBG.jpg', width: 100.0,),
                              Image.asset('assets/images/characters/${charData[4].slug}.webp', width: 100.0,)
                            ],
                          ),
                          SizedBox(width: 8.0,),
                          Text('${charData[4].name}', style: TextStyle(fontSize: 20.0),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        Wrap(
          children: [
            Container(
              child: Row(
                children: [
                  Card(
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Image.asset('assets/images/characters/fivestarBG.jpg', width: 100.0,),
                              Image.asset('assets/images/characters/${charData[5].slug}.webp', width: 100.0,)
                            ],
                          ),
                          SizedBox(width: 8.0,),
                          Text('${charData[5].name}', style: TextStyle(fontSize: 20.0),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              child: Row(
                children: [
                  Card(
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Image.asset('assets/images/characters/fivestarBG.jpg', width: 100.0,),
                              Image.asset('assets/images/characters/${charData[6].slug}.webp', width: 100.0,)
                            ],
                          ),
                          SizedBox(width: 8.0,),
                          Text('${charData[6].name}', style: TextStyle(fontSize: 20.0),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              child: Row(
                children: [
                  Card(
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Image.asset('assets/images/characters/fivestarBG.jpg', width: 100.0,),
                              Image.asset('assets/images/characters/${charData[7].slug}.webp', width: 100.0,)
                            ],
                          ),
                          SizedBox(width: 8.0,),
                          Text('${charData[7].name}', style: TextStyle(fontSize: 20.0),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              child: Row(
                children: [
                  Card(
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Image.asset('assets/images/characters/fivestarBG.jpg', width: 100.0,),
                              Image.asset('assets/images/characters/${charData[8].slug}.webp', width: 100.0,)
                            ],
                          ),
                          SizedBox(width: 8.0,),
                          Text('${charData[8].name}', style: TextStyle(fontSize: 20.0),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              child: Row(
                children: [
                  Card(
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Image.asset('assets/images/characters/fivestarBG.jpg', width: 100.0,),
                              Image.asset('assets/images/characters/${charData[9].slug}.webp', width: 100.0,)
                            ],
                          ),
                          SizedBox(width: 8.0,),
                          Text('${charData[9].name}', style: TextStyle(fontSize: 20.0),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _viewWeaponViewTen() {
    var weaData = WeaponData.data;
    return Flexible(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 100.0),
        itemCount: 5,
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

}
