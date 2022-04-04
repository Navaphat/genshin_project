import 'package:flutter/material.dart';
import 'package:genshin_project/data/characterData.dart';

Widget viewPyroCharacter({required int index}) {
  var charData = CharacterData.data;
  return Column(
    children: [
      for (int i = 0; i < index; i++)
        if (charData[i].vision == 'pyro')
          Card(
            child: InkWell(
              onTap: () {},
              child: Row(
                children: [
                  Stack(
                    children: [
                      Image.asset('assets/images/characters/fivestarBG.jpg', width: 100.0, color: (charData[i].rarity == 5) ? Colors.orange : Colors.purpleAccent,),
                      Image.asset('assets/images/characters/pyro/${charData[i].slug}.webp', width: 100.0,),
                    ],
                  ),
                  SizedBox(width: 8.0,),
                  Text('${charData[i].name}', style: TextStyle(fontSize: 25.0, color: Colors.red),
                  ),
                ],
              ),
            ),
          ),
    ],
  );
}
