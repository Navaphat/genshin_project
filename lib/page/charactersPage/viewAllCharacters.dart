import 'package:flutter/material.dart';
import 'package:genshin_project/data/characterData.dart';
import 'package:genshin_project/page/charactersPage/charactersCheckVision.dart';
import 'package:genshin_project/page/charactersPage/manageVisionColors.dart';

Widget viewAllCharacter({required int index}) {
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
                        Image.asset('assets/images/characters/${charactersCheckVision(vision: charData[index].vision)}/${charData[index].slug}.webp', width: 100.0,),
                      ],
                    ),
                    SizedBox(width: 8.0,),
                    Flexible(
                        child: Column(
                          children: [
                            Text('${charData[index].name}', style: TextStyle(fontSize: 25.0, color: manageVisionColors(vision: charData[index].vision)),),
                            Image.asset('assets/images/raritys/${(charData[index].rarity == 5)? '5-stars' : '4-stars'}.webp', width: 100.0,),
                          ],
                        ),
                    ),
                  ],
                ),
              ),
            );
          }
      ),
    ),
  );
}