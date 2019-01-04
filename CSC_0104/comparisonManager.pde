class ComparisonManager {
  Comparison[] comparisons ;
  int[] order ;
  ComparisonManager(CoalitionUtility ut, int[] ord) {
    comparisonSetup(ut) ;
    setOrder(ord) ;
  }
  void comparisonSetup(CoalitionUtility ut) {
    comparisons = new Comparison[7] ;
    comparisons[0] = new Comparison(ut) ;
    comparisons[1] = new Comparison_Method_I(ut) ;
    comparisons[2] = new Comparison_Method_II(ut) ;
    comparisons[3] = new Comparison_Method_III(ut) ;
    comparisons[4] = new Comparison_Method_IV(ut) ;
    comparisons[5] = new Comparison_Method_V(ut) ;
    comparisons[6] = new Comparison_Method_VI(ut) ;
  }
  void setOrder(int[] ord) {
    order = ord ;
  }
  Coalition getWinner(Coalition c, Coalition cc) {
    if (c == null) return cc ;
    for (int i = 0; i < order.length; i++) {
      int v = comparisons[i].compare(c, cc) ;
      if (v == 0) continue ;
      return (v == 1) ? c : cc ;
    }
    return c ;
  }
}
