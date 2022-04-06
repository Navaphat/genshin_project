import 'package:flutter/material.dart';
import 'package:genshin_project/data/weaponData.dart';
import 'package:genshin_project/page/weaponsPage/weaponsCheckRarity.dart';

import '../weaponInfoPage.dart';

Widget viewWeaponsByType({required int index, required var context, required var type}) {
  var weaData = WeaponData.data;
  return Column(
    children: [
      for(int i = 0; i < index; i++)
        if(weaData[i].type.toString().substring(5) == type.toString().toUpperCase())
          Card(
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => weaponInfoPage(index: i)));
              },
              child: Row(
                children: [
                  Stack(
                    children: [
                      Image.asset('assets/images/characters/fivestarBG.jpg', width: 100.0, color: weaponsCheskRarity(rarity: weaData[i].rarity),),
                      Image.asset('assets/images/weapons/$type/${weaData[i].slug}.webp', width: 100.0,),
                    ],
                  ),
                  SizedBox(width: 8.0,),
                  Text('${weaData[i].name}', style: TextStyle(fontSize: 25.0, color: Colors.red),
                  ),
                ],
              ),
            ),
          ),
    ],
  );
}