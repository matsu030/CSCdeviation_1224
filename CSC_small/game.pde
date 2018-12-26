class Game {
  Player[] players ;
  Coalition[] coalitions ;
  Game(int n) {
    setPlayers(n) ;
    setCoalitions(n) ;
  }
  void setPlayers(int n) {
    players = new Player[n] ;
    for (int i = 0 ; i < n ; i++) {
      players[i] = new Player(i) ;
    }
  }
  void setCoalitions(int n) {
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
  void setProfile() {
    int n = players.length ;
    int[][] profile = new int[n][n] ;
    for (int i = 0 ; i < n ; i++) {
      for (int j = 0 ; j < n ; j++) {
        profile[i][j] = int(random(-pfRange, pfRange)) ;
      }
      profile[i][i] = 0 ;
    }
    setProfile(profile) ;
  }
  void setProfile(int[][] profile) {
    for (Player p : players) {
      p.preference = profile[p.index] ;
      for (Coalition c : coalitions) {
        p.evaluation(c) ;
      }
    }
  }
  CoalitionSet getSingletonPartition() {
    CoalitionSet cs = new CoalitionSet() ;
    for (Player p : players) {
      cs.add(coalitions[1 << p.index]) ;
    }
    return cs ;
  }
  boolean isPartition(CoalitionSet cs) {
    int[] counts = new int[players.length] ;
    for (Coalition c : cs) {
      for (Player p : c) {
        counts[p.index]++ ;
      }
    }
    for (int v : counts) {
      if (v != 1) return false ;
    }
    return true ;
  }
  CoalitionSet findCSCPartition() {
    CoalitionSet cs = getSingletonPartition() ;
    cs.setAffiliation() ;
    while (true) {
      CoalitionSet deviations = new CoalitionSet() ;
      for (Coalition c : coalitions) {
        if (cs.isCSCDeviation(c)) deviations.add(c) ;
      }
      if (deviations.isEmpty()) break ;
      cs = cs.implement(deviations.get(0)) ;
      cs.setAffiliation() ;
      println(cs) ;
    }
    return cs ;
  }
}
