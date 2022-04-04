String charactersCheckVision({required var vision}) {
  if(vision == 'pyro') {
    return 'pyro';
  }
  else if(vision == 'cryo'){
    return 'cryo';
  }
  else if(vision == 'hydro'){
    return 'hydro';
  }
  else if(vision == 'anemo'){
    return 'anemo';
  }
  else if(vision == 'electro'){
    return 'electro';
  }
  else {
    return 'geo';
  }
}