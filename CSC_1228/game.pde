class Game {
  Player[] players ;
  CoalitionUtility utility ;
  Game(int n, int[] ord) {
    playerSetup(n) ;
    //utility = new CoalitionUtility(players, ord) ;
    utility = new CoalitionUtilityBit(players, ord) ;
}
  void playerSetup(int n) {
    players = new Player[n] ;
    for (int i = 0 ; i < n ; i++) {
      players[i] = new Player(i) ;
    }
  }
  void setOrder(int[] ord) {
    utility.manager.setOrder(ord) ;
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
    utility.setProfile(profile) ;
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
  void setAffiliation(CoalitionSet cs) {
    cs.setAffiliation() ;
    utility.setUtility() ;
  }
  CoalitionSet findCSCPartition() {
    CoalitionSet pi = utility.getSingletonPartition() ;
    setAffiliation(pi) ;
    while (true) {
      Coalition deviation = utility.getDeviation(pi) ;
      if (deviation == null) break ;
      pi = utility.implement(pi, deviation) ;
      setAffiliation(pi) ;
      println(pi) ;
    }
    return pi ;
  }
}
