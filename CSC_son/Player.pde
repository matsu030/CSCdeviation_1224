class Player {
  int index ;
  int preference[] ;
  Coalition affiliation ;//Pi(i)
  int utility ;//Pi(i)=affiliationへの評価値．v_(Pi(i))
  Player(int i) {
    index = i ;
  }
  void setPreference(int[] values) {
    preference = values ;
  }
  int evaluation(Player p) {
    return preference[p.index];
  }
  int evaluation(Coalition X) {
    int eva = 0 ;
    for (Player p : X)
      eva += evaluation(p) ;
    return eva ;
  }
  void setAffiliation(Coalition X) {
    affiliation = X ;
    utility = evaluation(X) ;
  }
  // boolean isAgainst(Coalition X){
  //   return utility > evaluation(X) ;
  // }
  // boolean wannaGo(Coalition X){
  //   return evaluation(X) > utility ;
  // }
  boolean permit(Coalition X) {

    return calcInfluence(X) <= 0 ;
  }
  void printPreference() {
    String s[] = new String[preference.length] ;
    for (int i = 0; i < preference.length; i++) {
      s[i] = str(preference[i]) ;
    }
    println(join(s, " ")) ;
  }
  int calcInfluence(Coalition X) {
    int influence = 0 ;
    for (Player p : X) {
      if (affiliation != p.affiliation) continue ;
      influence += evaluation(p) ;
    }
    return influence ;
  }
}
