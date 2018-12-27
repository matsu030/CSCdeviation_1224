class ComparisonManager {
  Comparison[] comparisons ;
  int[] order ;
  ComparisonManager(CoalitionUtility ut, int[] ord) {
    comparisonSetup(ut) ;
    order = ord ;
  }
  void comparisonSetup(CoalitionUtility ut) {
    comparisons = new Comparison[2] ;
    comparisons[0] = new Comparison(ut) ;
    comparisons[1] = new Comparison_Method_I(ut) ;
  }
  Coalition getWinner(Coalition c, Coalition cc) {
    if (c == null) return cc ;
    for (int i = 0 ; i < order.length ; i++) {
      int v = comparisons[i].compare(c, cc) ;
      if (v == 0) continue ;
      return (v == 1) ? c : cc ;
    }
    return c ;
  }
}
