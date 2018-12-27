class CoalitionUtility {
  Player[] players ;
  int complementBit ;
  ComparisonManager manager ;
  CoalitionUtility(Player[] pa, int[] ord) {
    players = pa ;
    manager = new ComparisonManager(this, ord) ;
    complementBit = (1 << players.length) - 1 ;
  }
  void id() {
    println("full") ;
  }
  void setProfile(int[][] profile) {
    for (Player p : players) {
      p.preference = profile[p.index] ;
    }
  }
  Coalition get(int b) {
    Coalition c = new Coalition(b) ;
    for (int i = 0 ; i < players.length ; i++) {
      if ((b & (1 << i)) > 0) c.add(players[i]) ;
    }
    return c ;
  }
  Coalition getSingleton(Player p) {
    Coalition c = new Coalition(1 << p.index) ;
    c.add(players[p.index]) ;
    return c ;
  }
  CoalitionSet getSingletonPartition() {
    CoalitionSet cs = new CoalitionSet() ;
    for (Player p : players) {
      cs.add(getSingleton(p)) ;
    }
    return cs ;
  }
  Coalition getIntersection(Coalition c, Coalition cc) {
    return get(c.bit & cc.bit) ;
  }
  Coalition getSetminus(Coalition c, Coalition cc) {
    return get(c.bit - (c.bit & cc.bit)) ;
  }
  Coalition getComplement(Coalition c) {
    return get(complementBit - c.bit) ;
  }
  void setEvaluation() {
  }
  int evaluation(Player p, Coalition c) {
    return p.evaluation(c) ;
  }
  void setUtility() {
    for (Player p : players) {
      p.utility = evaluation(p, p.affiliation) ;
    }
  }
  boolean hasWeakIncentive(Coalition c) {
    boolean incentive = false ;
    for (Player p : c) {
      int gain = evaluation(p, c) - p.utility ;
      if (gain < 0) return false ;
      if (gain > 0) incentive = true ;
    }
    return incentive ;
  }
  boolean permit(CoalitionSet cs, Coalition c) {
    for (Coalition cc : cs) {
      Coalition deviators = getIntersection(cc, c) ;
      if (deviators.isEmpty() || deviators == cc) continue ;
      Coalition reminders = getSetminus(cc, deviators) ;
      for (Player p : reminders) {
        if (evaluation(p, deviators) > 0) return false ;
      }
    }
    return true ;
  }
  boolean isCSCDeviation(CoalitionSet cs, Coalition c) {
    return hasWeakIncentive(c) && permit(cs, c) ;
  }
  Coalition getDeviation(CoalitionSet cs) {
    Coalition d = null ;
    for (int b = 1 ; b <= complementBit ; b++) {
      Coalition c = get(b) ;
      if (! isCSCDeviation(cs, c)) continue ;
      d = manager.getWinner(d, c) ;
    }
    return d ;
  }
  CoalitionSet implement(CoalitionSet pi, Coalition c) {
    CoalitionSet cs = new CoalitionSet() ;
    for (Coalition cc : pi) {
      Coalition nc = getSetminus(cc, c) ;
      if (! nc.isEmpty()) cs.add(nc) ;
    }
    cs.add(c) ;
    return cs ;
  }
}

class CoalitionUtilityBit extends CoalitionUtility {
  Coalition[] coalitions ;
  int[][] evaluations ;
  CoalitionUtilityBit(Player[] pa, int[] ord) {
    super(pa, ord) ;
    coalitionSetup(pa.length) ;
  }
  void id() {
    println("bit") ;
  }
  void coalitionSetup(int n) {
    coalitions = new Coalition[1 << n] ;
    for (int b = 0 ; b < coalitions.length ; b++) {
      coalitions[b] = new Coalition(b) ;
      for (int i = 0 ; i < n ; i++) {
        if ((b & (1 << i)) == 0) continue ;
        coalitions[b].add(players[i]) ;
      }
    }
  }
  void setEvaluation() {
    evaluations = new int[coalitions.length][players.length] ;
    for (Player p : players) {
      for (Coalition c : coalitions) {
        evaluations[c.bit][p.index] = p.evaluation(c) ;
      }
    }
  }
  void setProfile(int[][] profile) {
    super.setProfile(profile) ;
    setEvaluation() ;
  }
  int evaluation(Player p, Coalition c) {
    return evaluations[c.bit][p.index] ;
  }
  Coalition get(int b) {
    return coalitions[b] ;
  }
  Coalition getSingleton(Player p) {
    return get(1 << p.index) ;
  }
}
