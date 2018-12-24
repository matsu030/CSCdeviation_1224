class Player {
  int index ;
  int preference[] ;
  Coalition affiliation ;//Pi(i)
  int utility ;//Pi(i)=affiliationへの評価値．v_(Pi(i))
  Player(int i) {
    index = i ;
  }
  void setPreference(Preference pf) {
    preference = pf.memberValue[index] ;
  }
  int evaluation(Player p) {
    return preference[p.index];
  }
  int evaluation(Coalition c) {
    int eva = 0 ;
    for (Player p : c)
      eva += evaluation(p) ;
    return eva ;
  }
  void setEvaluation(Coalition c) {
    c.evaluation[index] = evaluation(c) ;
  }
  void setAffiliation(Coalition c) {
    affiliation = c ;
    utility = c.evaluation[index] ;
  }
  // boolean isAgainst(Coalition X){
  //   return utility > evaluation(X) ;
  // }
  // boolean wannaGo(Coalition X){
  //   return evaluation(X) > utility ;
  // }

  /*
  int calcInfluence(Coalition c) {
    int influence = 0 ;
    for (Player p : c) {
      if (affiliation == p.affiliation) {
        influence += evaluation(p) ;
      }
    }
    return influence ;
  }
  boolean permit(Coalition X) {
    return calcInfluence(X) <= 0 ;
  }
  */
  void printPreference() {
    println(join(nf(preference, 0), " ")) ;
  }
}
