class ComparisonManager {
  Comparison[] comparisons ;
  int[] order ;
  ComparisonManager(CoalitionUtility ut, int[] ord) {
    comparisonSetup(ut) ;
    setOrder(ord) ;
  }
  void comparisonSetup(CoalitionUtility ut) {
    comparisons = new Comparison[6] ;
    comparisons[0] = new Comparison_Method_I(ut) ; //最小の効用値を最大にする
    comparisons[1] = new Comparison_Method_II(ut) ; //尺度１ CSC逸脱Xのプレイヤーの評価値の合計  全てのutilityを確認する
    comparisons[2] = new Comparison_Method_III(ut) ;  //抜けられるプレイヤーの評価値の効用の差分
    comparisons[3] = new Comparison_Method_IV(ut) ;   //Method１ ＋ Method３
    comparisons[4] = new Comparison_Method_V(ut) ;   //CSC逸脱集団の大きさが小さい集団を優先
    comparisons[5] = new Comparison_Method_VI(ut) ;  //CSC逸脱集団の大きさが大きい集団を優先
  }
  void setOrder(int[] ord) {
    order = ord ;
  }
  Coalition getWinner(Coalition c, Coalition cc) {
    if (c == null) return cc ;
    for (int i = 0; i < order.length; i++) {
      int v = comparisons[order[i]].compare(c, cc) ;
      if (v == 0) continue ;
      return (v == 1) ? c : cc ;
    }
    return c ;
  }
}
