class Coalition extends ArrayList<Player> {
  int bit ;
  int[] evaluation ;
  Coalition complement ;
  Coalition() {
  }
  Coalition (int n, int b, Player[] players) {
    bit = b ;
    evaluation = new int[n] ;
    for (int i = 0 ; i < n ; i++) {
      if ((bit & (1 << i)) == 0) continue ;
      add(players[i]) ;
    }

  }
  void setPreference(Preference pf) {
    for (Player p : this) {
      p.setPreference(pf) ;
    }
  }
  void setEvaluation() {
    for (Player p : this) {
      p.setEvaluation(this) ;
    }
  }
  /*
  CoalitionSet powerSet() {
    return powerSet(0) ;
  }
  CoalitionSet powerSet(int k, CoalitionSet cs) {
    if (k == size()) return cs ;

    Player p = get(k) ;
    CoalitionSet ccs = (CoalitionSet) cs.clone() ;
    for (Coalition c : cs) {
      Coalition cc = (Coalition) c.clone() ;
      cc.add(p) ;
      ccs.add(cc) ;
    }
    powerSet(k+1, ccs) ;
  }
  */
  /*
  CoalitionSet powerSet() {
    CoalitionSet cs = new CoalitionSet() ;
    if (isEmpty()) {
      cs.add(new Coalition()) ;
    } else {
      Coalition c = (Coalition) clone() ;
      Player p = c.remove(c.size() - 1) ;
      CoalitionSet ps = c.powerSet() ;
      cs.addAll(ps);
      for (Coalition X : ps) {
        Coalition XX = (Coalition) X.clone() ;
        XX.add(p) ;
        cs.add(XX) ;
      }
    }
    return cs ;
  }
  */
  String toString() {
    String s[] = new String[this.size()] ;
    for (int i = 0; i < size(); i++)
      s[i] = str(get(i).index) ;
    return "{" + join(s, ",") + "}" ;
  }
}
