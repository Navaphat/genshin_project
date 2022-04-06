import 'package:genshin_project/model/WeaponApiResult.dart';

class WeaponData {
  static List<WeaponApiResult> data = [];
  static Map<String, Map<String,String>> otherInfo =
    {
      'aquila-favonia' : {
        'secondary stat' : 'Physical DMG Bonus',
        'secondary stat value' : '9',
        'Special Ability': "Falcon's Defiance",
        'Special Ability Description':'ATK is increased by 20%. Triggers on taking DMG: the soul of the Falcon of the West awakens, holding the banner of the resistance aloft, regenerating HP equal to 100% of ATK and dealing 200% of ATK as DMG to surrounding opponents. This effect can only occur once every 15s',
        'description':'The soul of the Knights of Favonius. Millennia later, it still calls on the winds of swift justice to vanquish all evil—just like the last heroine who wielded it.'
      },

      'skyward-blade' : {
        'secondary stat' : 'Energy Recharge',
        'secondary stat value' : '12',
        'Special Ability': "Sky-Piercing Fang",
        'Special Ability Description':"CRIT Rate increased by 4%. Gains Skypiercing Might upon using Elemental Burst: Increases Movement SPD by 10%, increases ATK SPD by 10%, and Normal and Charged hits deal additional DMG equal to 20% of ATK. Skypiercing Might lasts for 12s.",
        'description':'The sword of a knight that symbolizes the restored honor of Dvalin. The blessings of the Anemo Archon rest on the fuller of the blade, imbuing the sword with the powers of the sky and the wind.'
      },

      'blackcliff-longsword' : {
        'secondary stat' : 'Crit DMG',
        'secondary stat value' : '8',
        'Special Ability': "Press the Advantage",
        'Special Ability Description':"After defeating an opponent, ATK is increased by 12% for 30s. This effect has a maximum of 3 stacks, and the duration of each stack is independent of the others.",
        'description':'A sword made of blackstone. It has a dark crimson glow on its black blade.'
      },

      'prototype-rancour' : {
        'secondary stat' : 'Physical DMG Bonus',
        'secondary stat value' : '7.5',
        'Special Ability': "Smashed Stone",
        'Special Ability Description':"On hit, Normal or Charged Attacks increase ATK and DEF by 4% for 6s. Max 4 stacks. Can only occur once every 0.3s.",
        'description':'An ancient longsword discovered in the Blackcliff Forge that cuts through rocks like a hot knife through butter.'
      },

      'the-alley-flash' : {
        'secondary stat' : 'Elemental Mastery',
        'secondary stat value' : '12',
        'Special Ability': "Itinerant Hero",
        'Special Ability Description':"Increases DMG dealt by the character equipping this weapon by 12%. Taking DMG disables this effect for 5s.",
        'description':'A straight sword as black as the night. It once belonged to a thief who roamed the benighted streets.'
      },

      'iron-sting' : {
        'secondary stat' : 'Elemental Mastery',
        'secondary stat value' : '36',
        'Special Ability': "Infusion Stinger",
        'Special Ability Description':"Dealing Elemental DMG increases all DMG by 6% for 6s. Max 2 stacks. Can only occur once every 1s.",
        'description':'An exotic long-bladed rapier that somehow found its way into Liyue via foreign traders. It is light, agile, and sharp.'
      },

      'lions-roar' : {
        'secondary stat' : 'ATK',
        'secondary stat value' : '9',
        'Special Ability': "Bane of Fire and Thunder",
        'Special Ability Description':"Increases DMG against enemies affected by Pyro or Electro by 20%",
        'description':'A sharp blade with extravagant carvings that somehow does not compromise on durability and sharpness. It roars like a lion as it cuts through the air.'
      },

      'royal-longsword' : {
        'secondary stat' : 'ATK',
        'secondary stat value' : '9',
        'Special Ability': "Focus",
        'Special Ability Description':"Upon dealing damage to an opponent, increases CRIT Rate by 8%. Max 5 stacks. A CRIT hit removes all existing stacks.",
        'description':'An old longsword that belonged to the erstwhile rulers of Mondstadt. Exquisitely crafted, the carvings and embellishments testify to the stature of its owner.'
      },

      'the-black-sword' : {
        'secondary stat' : 'Crit Rate',
        'secondary stat value' : '6',
        'Special Ability': "Justice",
        'Special Ability Description':"Increases DMG dealt by Normal and Charged Attacks by 20%.Additionally, regenerates 60% of ATK as HP when Normal and Charged Attacks score a CRIT Hit. This effect can occur once every 5s.",
        'description':'A pitch-black longsword that thirsts for violence and conflict. It is said that this weapon can cause its user to become drunk on the red wine of slaughter.'
      },

      'the-flute' : {
        'secondary stat' : 'ATK',
        'secondary stat value' : '9',
        'Special Ability': "Chord",
        'Special Ability Description':"Normal or Charged Attacks grant a Harmonic on hits. Gaining 5 Harmonics triggers the power of music and deals 100% ATK DMG to surrounding enemies. Harmonics last up to 30s, and a maximum of 1 can be gained every 0.5s.",
        'description':'Beneath its rusty exterior is a lavishly decorated thin blade. It swings as swiftly as the wind.'
      },

      'favonius-sword' : {
        'secondary stat' : 'Energy Recharge',
        'secondary stat value' : '13.3',
        'Special Ability': "Windfall",
        'Special Ability Description':"CRIT hits have a 60% chance to generate a small amount of Elemental Particles, which will regenerate 6 Energy for the character. Can only occur once every 12s.",
        'description':"A standard-issue longsword of the Knights of Favonius. When you're armed with this agile and sharp weapon, channeling the power of the elements has never been so easy!"
      },

      'sacrificial-sword' : {
        'secondary stat' : 'Energy Recharge',
        'secondary stat value' : '13.3',
        'Special Ability': "Composed",
        'Special Ability Description':"After dealing damage to an opponent with an Elemental Skill, the skill has a 40% chance to end its own CD. Can only occur once every 30s.",
        'description':'A ceremonial sword that has become petrified over time. The trinkets on it are still visible. It grants the wielder the power to withstand the winds of time.'
      },

      'skyrider-sword' : {
        'secondary stat' : 'Energy Recharge',
        'secondary stat value' : '11.3',
        'Special Ability': "Determination",
        'Special Ability Description':"Using an Elemental Burst grants a 12% increase in ATK and Movement SPD for 15s.",
        'description':'A reliable steel sword. The legendary Skyrider once tried to ride it as a flying sword...'
      },

      'dark-iron-sword' : {
        'secondary stat' : 'Elemental Mastery',
        'secondary stat value' : '31',
        'Special Ability': "Overloaded",
        'Special Ability Description':"Upon causing an Overloaded, Superconduct, Electro-Charged, or an Electro-infused Swirl reaction, ATK is increased by 20% for 12s.",
        'description':'A perfectly ordinary iron sword, just slightly darker than most.'
      },

      'travelers-handy-sword' : {
        'secondary stat' : 'DEF',
        'secondary stat value' : '6.4',
        'Special Ability': "Journey",
        'Special Ability Description':"Each Elemental Orb or Particle collected restores 1% HP.",
        'description':'A handy steel sword which contains scissors, a magnifying glass, tinder, and other useful items in its sheath.'
      },

      'cool-steel' : {
        'secondary stat' : 'ATK',
        'secondary stat value' : '7.7',
        'Special Ability': "Bane of Water and Ice",
        'Special Ability Description':"Increases DMG against opponents affected by Hydro or Cryo by 12%.",
        'description':'A reliable steel-forged weapon that serves as a testament to the great adventures of its old master.'
      },

      'fillet-blade' : {
        'secondary stat' : 'ATK',
        'secondary stat value' : '7.7',
        'Special Ability': "Gash",
        'Special Ability Description':"On hit, has 50% chance to deal 240% ATK DMG to a single enemy. Can only occur once every 15s.",
        'description':'A sharp filleting knife. The blade is long, thin, and incredibly sharp.'
      },

      'harbinger-of-dawn' : {
        'secondary stat' : 'Crit DMG',
        'secondary stat value' : '10.2',
        'Special Ability': "Vigorous",
        'Special Ability Description':"When HP is above 90%, increases CRIT Rate by 14%.",
        'description':'A sword that once shone like the sun. The wielder of this sword will be blessed with a "feel-good" buff. The reflective material on the blade has long worn off.'
      },

      'silver-sword' : {
        'secondary stat' : 'none',
        'secondary stat value' : 'none',
        'Special Ability': "none",
        'Special Ability Description':"none",
        'description':"A sword for chasing away demons. Everyone knows it's made of a silver alloy, not pure silver."
      },

      'dull-blade' : {
        'secondary stat' : 'none',
        'secondary stat value' : 'none',
        'Special Ability': "none",
        'Special Ability Description':"none",
        'description':"Youthful dreams and the thrill of adventure. If this isn't enough, then make it up with valiance."
      },

      'amos-bow' : {
        'secondary stat' : 'ATK',
        'secondary stat value' : '10.8',
        'Special Ability': "Strong-Willed",
        'Special Ability Description':"Increases Normal Attack and Charged Attack DMG by 12%. After a Normal or Charged Attack is fired, DMG dealt increases by a further 8% every 0.1 seconds the arrow is in the air for up to 5 times.",
        'description':'An extremely ancient bow that has retained its power despite its original master being long gone. It draws power from everyone and everything in the world, and the further away you are from that which your heart desires, the more powerful it is.'
      },

      'skyward-harp' : {
        'secondary stat' : 'Crit Rate',
        'secondary stat value' : '4.8',
        'Special Ability': "Echoing Ballad",
        'Special Ability Description':"Increases CRIT DMG by 20%. Hits have a 60% chance to inflict a small AoE attack, dealing 125% Physical ATK DMG. Can only occur once every 4s.",
        'description':"A greatbow that symbolizes Dvalin's affiliation with the Anemo Archon. The sound of the bow firing is music to the Anemo Archon's ears. It contains the power of the sky and wind within."
      },

      'blackcliff-warbow' : {
        'secondary stat' : 'Crit DMG',
        'secondary stat value' : '8',
        'Special Ability': "Press the Advantage",
        'Special Ability Description':"After defeating an opponent, ATK is increased by 12% for 30s. This effect has a maximum of 3 stacks, and the duration of each stack is independent of the others.",
        'description':'A bow made of blackstone that features extremely sturdy bow limbs. It requires an archer with a strong bow arm to use.'
      },

      'sacrificial-bow' : {
        'secondary stat' : 'Energy Recharge',
        'secondary stat value' : '6.7',
        'Special Ability': "Composed",
        'Special Ability Description':"After dealing damage to an opponent with an Elemental Skill, the skill has a 40% chance to end its own CD. Can only occur once every 30s.",
        'description':'A ceremonial hunting bow that has become petrified over time. The trinkets on it are still visible. It grants the wielder the power to withstand the winds of time.'
      },

      'prototype-crescent' : {
        'secondary stat' : 'ATK',
        'secondary stat value' : '9',
        'Special Ability': "Unreturning",
        'Special Ability Description':"Charged Attack hits on weak points increase Movement SPD by 10% and ATK by 36% for 10s.",
        'description':'A prototype longbow discovered in the Blackcliff Forge. The arrow fired from this bow glimmers like a ray of moonlight.'
      },

      'royal-bow' : {
        'secondary stat' : 'ATK',
        'secondary stat value' : '9',
        'Special Ability': "Focus",
        'Special Ability Description':"Upon dealing damage to an opponent, increases CRIT Rate by 8%. Max 5 stacks. A CRIT hit removes all existing stacks.",
        'description':'An old royal longbow that belonged to the erstwhile rulers of Mondstadt. Countless generations later, the bowstring is still tight and can still fire arrows with great force.'
      },

      'rust' : {
        'secondary stat' : 'ATK',
        'secondary stat value' : '9',
        'Special Ability': "Rapid Firing",
        'Special Ability Description':"Increases Normal Attack DMG by 40% but decreases Charged Attack DMG by 10%.",
        'description':'A completely rusted iron greatbow. The average person would lack the strength to even lift it, let alone fire it.'
      },

      'the-stringless' : {
        'secondary stat' : 'Elemental Mastery',
        'secondary stat value' : '36',
        'Special Ability': "Arrowless Song",
        'Special Ability Description':"Increases Elemental Skill and Elemental Burst DMG by 24%.",
        'description':'A bow that once served as an extraordinary instrument. It is no longer capable of getting people up and dancing.'
      },

      'the-viridescent-hunt' : {
        'secondary stat' : 'Crit Rate',
        'secondary stat value' : '6',
        'Special Ability': "Verdant Wind",
        'Special Ability Description':"Upon hit, Normal and Aimed Shot Attacks have a 50% chance to generate a Cyclone, which will continuously attract surrounding opponents, dealing 40% of ATK as DMG to these opponents every 0.5s for 4s. This effect can only occur once every 14s.",
        'description':'A pure green hunting bow. This once belonged to a certain hunter whose home was the forest.'
      },

      'alley-hunter' : {
        'secondary stat' : 'ATK',
        'secondary stat value' : '6',
        'Special Ability': "Oppidan Ambush",
        'Special Ability Description':"While the character equipped with this weapon is in the party but not on the field, their DMG increases by 2% every second up to a max of 20%. When the character is on the field for more than 4s, the aforementioned DMG buff decreases by 4% per second until it reaches 0%.",
        'description':'An intricate, opulent longbow. It once belonged to a gentleman thief who was never caught.'
      },

      'compound-bow' : {
        'secondary stat' : 'Physical DMG Bonus',
        'secondary stat value' : '15',
        'Special Ability': "Infusion Arrow",
        'Special Ability Description':"Normal Attack and Charged Attack hits increase ATK by 4% and Normal ATK SPD by 1.2% for 6s. Max 4 stacks. Can only occur once every 0.3s.",
        'description':'An exotic metallic bow from a distant land. Though extremely difficult to maintain, it is easy to nock and fires with tremendous force.'
      },

      'favonius-warbow' : {
        'secondary stat' : 'Energy Recharge',
        'secondary stat value' : '13.3',
        'Special Ability': "Windfall",
        'Special Ability Description':"CRIT hits have a 60% chance to generate a small amount of Elemental Particles, which will regenerate 6 Energy for the character. Can only occur once every 12s.",
        'description':'A standard-issue recurve bow of the Knights of Favonius. Only the best archers can unleash its full potential.'
      },

      'ebony-bow' : {
        'secondary stat' : 'ATK',
        'secondary stat value' : '6.3',
        'Special Ability': "Decimate",
        'Special Ability Description':"Increases DMG against mechanoid Ruin opponents by 40%.",
        'description':'A longbow made of ebony wood with stiffer limbs than ordinary bows. It is also a far more powerful weapon.'
      },

      'messenger' : {
        'secondary stat' : 'Crit DMG',
        'secondary stat value' : '6.8',
        'Special Ability': "Archer's Message",
        'Special Ability Description':"Charged Attack hits on weak spots deal an additional 100% ATK DMG as CRIT DMG. Can only occur once every 10s.",
        'description':'A basic wooden bow. It is said to have once been used as a tool for long-distance communication.'
      },

      'raven-bow' : {
        'secondary stat' : 'Elemental Mastery',
        'secondary stat value' : '20',
        'Special Ability': "Bane of Flame and Water",
        'Special Ability Description':"Increases DMG against opponents affected by Hydro or Pyro by 12%.",
        'description':"Ravens are known to be the ferrymen of the dead. This bow's limb is decorated with raven feathers, which forebode the imminent death of its target."
      },

      'sharpshooters-oath' : {
        'secondary stat' : 'Crit DMG',
        'secondary stat value' : '10.2',
        'Special Ability': "Precise",
        'Special Ability Description':"Increases DMG against weak spots by 24%.",
        'description':'This superior bow once belonged to a master archer. However, it gives off a strong scent, thus making it unsuitable for hunting.'
      },

      'recurve-bow' : {
        'secondary stat' : 'HP',
        'secondary stat value' : '10.2',
        'Special Ability': "Cull the Weak",
        'Special Ability Description':"Defeating an opponent restores 8% HP.",
        'description':'It is said that this bow can shoot down eagles in flight, but ultimately how true that is depends on the skill of the archer.'
      },

      'slingshot' : {
        'secondary stat' : 'Crit Rate',
        'secondary stat value' : '6.8',
        'Special Ability': "Slingshot",
        'Special Ability Description':"If a Normal or Charged Attack hits a target within 0.3s of being fired, increases DMG by 36%. Otherwise, decreases DMG by 10%.",
        'description':'A bow, despite the name. After countless experiments and improvements to the design, the creator of the ultimate slingshot found himself to have made what was actually a bow.'
      },

      'seasoned-hunters-bow' : {
        'secondary stat' : 'none',
        'secondary stat value' : 'none',
        'Special Ability': "none",
        'Special Ability Description':"none",
        'description':"A bow that has been well-polished by time and meticulously cared for by its owner. It feels almost like an extension of the archer's arm."
      },

      'hunters-bow' : {
        'secondary stat' : 'none',
        'secondary stat value' : 'none',
        'Special Ability': "none",
        'Special Ability Description':"none",
        'description':"A hunter's music consists of but two sounds: the twang of the bowstring and the whoosh of soaring arrows."
      },
    };
}

/*'' : {
'secondary stat' : '',
'secondary stat value' : '',
'Special Ability': "",
'Special Ability Description':"",
'description':''
},*/
