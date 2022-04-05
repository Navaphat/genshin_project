import 'package:flutter/material.dart';
import 'package:genshin_project/data/characterData.dart';

import '../characterInfoPage.dart';

Widget viewCryoCharacter({required int index, required var context}) {
  var charData = CharacterData.data;
  return Column(
    children: [
      for (int i = 0; i < index; i++)
        if (charData[i].vision == 'cryo')
          Card(
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => characterInfoPage(index: i)));
              },
              child: Row(
                children: [
                  Stack(
                    children: [
                      Image.asset('assets/images/characters/fivestarBG.jpg', width: 100.0, color: (charData[i].rarity == 5) ? Colors.orange : Colors.purpleAccent,),
                      Image.asset('assets/images/characters/cryo/${charData[i].slug}.webp', width: 100.0,),
                    ],
                  ),
                  SizedBox(width: 8.0,),
                  Column(
                    children: [
                      Text('${charData[i].name}', style: TextStyle(fontSize: 25.0, color: Colors.cyanAccent),),
                      Image.asset('assets/images/raritys/${(charData[i].rarity == 5)? '5-stars' : '4-stars'}.webp', width: 100.0,),
                    ],
                  ),
                ],
              ),
            ),
          ),
    ],
  );
}
