class Comparison {
  CoalitionUtility utility ;
  Comparison(CoalitionUtility ut) {
    utility = ut ;
  }
  int compare(Coalition c, Coalition cc) {
    return 1 ;
  }
}
class Comparison_Method_0 extends Comparison {
  Comparison_Method_0(CoalitionUtility ut) {
    super(ut) ;
  }
  int compare(Coalition c, Coalition cc) {
    return 0 ;
  }
}

class Comparison_Method_I extends Comparison {//最小の効用値を最大にする
  Comparison_Method_I(CoalitionUtility ut) {
    super(ut) ;
  }
  int compare(Coalition c, Coalition cc) {
    int minC = c.get(0).evaluation(c);
    for (Player p : c)
      if (minC >p.evaluation(c)) minC = p.evaluation(c) ;
    Coalition remainC = game.utility.getComplement(c) ;
    for (Player p : remainC) {
      int a = p.utility - p.evaluation(c) ;
      if (minC > a) minC = a ;
    }

    int minCC = cc.get(0).evaluation(cc);
    for (Player p : cc)
      if (minCC > p.evaluation(cc)) minCC = p.evaluation(cc) ;
    Coalition remainCC = game.utility.getComplement(cc);
    for (Player p : remainCC) {
      int b = p.utility - p.evaluation(cc) ;
      if (minCC > b) minCC = b ;
    }
    if (minC > minCC)
      return 1 ;
    return 0 ;
  }
}


class Comparison_Method_II extends Comparison { //尺度１ CSC逸脱Xのプレイヤーの評価値の合計
  Comparison_Method_II(CoalitionUtility ut) {
    super(ut) ;
  }
  int compare(Coalition c , Coalition cc){
    return 0 ;
  }
}
