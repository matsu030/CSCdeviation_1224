class CoalitionUtility {
  Player[] players ;
  Coalition[] coalitions ;
  int complementBit ;
  CoalitionUtility(int n) {
    playerSetup(n) ;
    coalitionSetup(n) ;
    complementBit = (1 << n) - 1 ;
  }
  void playerSetup(int n) {
    players = new Player[n] ;
    for (int i = 0 ; i < n ; i++) {
      players[i] = new Player(i) ;
    }
  }
  void coalitionSetup(int n) {
    coalitions = new Coalition[1 << n] ;
    for (int b = 0 ; b < coalitions.length ; b++) {
      coalitions[b] = new Coalition(n, b) ;
      for (int i = 0 ; i < n ; i++) {
        if ((b & (1 << i)) == 0) continue ;
        coalitions[b].add(players[i]) ;
      }
    }
    int nn = (1 << n) - 1 ;
    for (int b = 0 ; b < coalitions.length ; b++) {
      coalitions[b].complement = coalitions[nn - b] ;
    }
  }
  void setProfile(int[][] profile) {
    for (Player p : players) {
      p.preference = profile[p.index] ;
      for (Coalition c : coalitions) {
        c.evaluations[p.index] = p.evaluation(c) ;
      }
    }
  }
  Coalition get(int b) {
    return coalitions[b] ;
  }
  Coalition getSingleton(Player p) {
    return coalitions[1 << p.index] ;
  }
  CoalitionSet getSingletonPartition() {
    CoalitionSet cs = new CoalitionSet() ;
    for (Player p : players) {
      cs.add(getSingleton(p)) ;
    }
    return cs ;
  }
  Coalition getIntersection(Coalition c, Coalition cc) {
    return coalitions[c.bit & cc.bit] ;
  }
  Coalition getSetminus(Coalition c, Coalition cc) {
    return coalitions[c.bit - (c.bit & cc.bit)] ;
  }
  Coalition getComplement(Coalition c) {
    return coalitions[complementBit - c.bit] ;
  }
  boolean permit(CoalitionSet cs, Coalition c) {
    for (Coalition cc : cs) {
      Coalition deviators = getIntersection(cc, c) ;
      if (deviators.isEmpty() || deviators == cc) continue ;
      Coalition reminders = getSetminus(cc, deviators) ;
      for (Player p : reminders) {
        if (deviators.evaluations[p.index] > 0) return false ;
      }
    }
    return true ;
  }
  boolean isCSCDeviation(CoalitionSet cs, Coalition c) {
    return c.hasWeakIncentive() && permit(cs, c) ;
  }
  CoalitionSet getDeviationSet(CoalitionSet cs) {
    CoalitionSet deviations = new CoalitionSet() ;
    for (Coalition c : coalitions) {
      if (isCSCDeviation(cs, c)) deviations.add(c) ;
    }
    return deviations ;
  }
  CoalitionSet implement(CoalitionSet pi, Coalition c) {
    CoalitionSet cs = new CoalitionSet() ;
    cs.add(c) ;
    for (Coalition cc : pi) {
      Coalition nc = getSetminus(cc, c) ;
      if (!nc.isEmpty()) cs.add(nc) ;
    }
    return cs ;
  }
}
