class Player {
  int index ;
  int[] preference ;
  Coalition affiliation ;
  int utility ;
  Player(int i) {
    index = i ;
  }
  String toString() {
    return str(index) ;
  }
  int evaluation(Coalition c) {
    int eva = 0 ;
    for (Player p : c) {
      eva += preference[p.index] ;
    }
    return eva ;
  }
  int utility() {
    return utility ;
  }
  int utility(Coalition c) {
    return c.evaluations[index] ;
  }
}
