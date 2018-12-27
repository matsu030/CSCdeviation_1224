class Game {
  CoalitionUtility utility ;
  Player[] players ;
  Game(int n) {
    utility = new CoalitionUtility(n) ;
    players = utility.players ;
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
  CoalitionSet findCSCPartition() {
    CoalitionSet pi = utility.getSingletonPartition() ;
    pi.setAffiliation() ;
    while (true) {
      CoalitionSet deviations = utility.getDeviationSet(pi) ;
      if (deviations.isEmpty()) break ;
      pi = utility.implement(pi, deviations.get(0)) ;
      pi.setAffiliation() ;
      println(pi) ;
    }
    return pi ;
  }
}
