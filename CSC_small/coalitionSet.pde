class CoalitionSet extends ArrayList<Coalition> {
  CoalitionSet() {
  }
  void setAffiliation() {
    for (Coalition c : this) {
      c.setAffiliation() ;
    }
  }
  boolean isCSCDeviation(Coalition c) {
    boolean incentive = false ;
    for (Player p : c) {
      int gain = p.utility(c) - p.utility() ;
      if (gain < 0) return false ;
      if (gain > 0) incentive = true ;
    }
    if (! incentive) return false ;

    for (Coalition cc : this) {
      int deviatorsBit = cc.bit & c.bit ;
      if (deviatorsBit == 0 || deviatorsBit == cc.bit) continue ;
      Coalition deviators = game.coalitions[deviatorsBit] ;
      Coalition reminders = game.coalitions[cc.bit - deviatorsBit] ;
      for (Player p : reminders) {
        if (deviators.evaluations[p.index] > 0) return false ;
      }
    }
    return true ;
  }
  CoalitionSet implement(Coalition c) {
    CoalitionSet cs = new CoalitionSet() ;
    cs.add(c) ;
    for (Coalition cc : this) {
      int b = cc.bit - (cc.bit & c.bit) ;
      if (b == 0) continue ;
      cs.add(game.coalitions[b]) ;
    }
    return cs ;
  }
  String toString() {
    String[] stg = new String[size()] ;
    for (int i = 0 ; i < size() ; i++) {
      stg[i] = get(i).toString() ;
    }
    return "{" + join(stg, ", ") + "}" ;
  }
}
