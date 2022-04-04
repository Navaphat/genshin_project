String weaponsCheckType({required var weaponType}) {
  if(weaponType.toString() == 'Type.SWORD'){
    return 'sword';
  }
  else if(weaponType.toString() == 'Type.BOW') {
    return 'bow';
  }
  else if(weaponType.toString() == 'Type.CLAYMORE') {
    return 'claymore';
  }
  else if(weaponType.toString() == 'Type.POLEARM') {
    return 'polearm';
  }
  else {
    return 'catalyst';
  }
}