import 'package:flutter/material.dart';
import 'package:genshin_project/data/weaponData.dart';
import 'package:genshin_project/page/weaponsPage/weaponsCheckRarity.dart';
import 'package:genshin_project/page/weaponsPage/weaponsCheckType.dart';

Widget viewAllWeapon({required int index}) {
  var weaData = WeaponData.data;
  return ListView.builder(
      itemCount: index,
      itemBuilder: (context, index) {
        return Card(
          child: InkWell(
            onTap: () {},
            child: Row(
              children: [
                Stack(
                  children: [
                    Image.asset('assets/images/characters/fivestarBG.jpg', width: 100.0, color: weaponsCheskRarity(rarity: weaData[index].rarity),),
                    Image.asset('assets/images/weapons/${weaponsCheckType(weaponType: weaData[index].type)}/${weaData[index].slug}.webp', height: 100.0,)
                  ],
                ),
                SizedBox(width: 8.0,),
                Text('${weaData[index].name}', style: TextStyle(fontSize: 20.0),),
              ],
            ),
          ),
        );
      }
  );
}