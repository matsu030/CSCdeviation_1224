class Player {
  int index ;
  int[] preference ;
  Coalition affiliation ;
  Player(int i) {
    index = i ;
  }
  void evaluation(Coalition c) {
    int eva = 0 ;
    for (Player p : c) {
      eva += preference[p.index] ;
    }
    c.evaluations[index] = eva ;
  }
  int utility() {
    return utility(affiliation) ;
  }
  int utility(Coalition c) {
    return c.evaluations[index] ;
  }
  String toString() {
    return str(index) ;
  }
}
