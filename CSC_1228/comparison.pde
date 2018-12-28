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


class Comparison_Method_II extends Comparison { //尺度１ CSC逸脱Xのプレイヤーの評価値の合計  全てのutilityを確認する
  Comparison_Method_II(CoalitionUtility ut) {
    super(ut) ;
  }
  int compare(Coalition c, Coalition cc) {
    int utilitySumC = 0 ;
    for (Player p : c)
      utilitySumC += (utility.evaluation(p, c) - p.utility) ;

    int utilitySumCC = 0 ;
    for (Player p : cc)
      utilitySumCC += (utility.evaluation(p, cc) - p.utility) ;

    if (utilitySumC >= utilitySumCC) return 1 ;
    return 0;
  }
}

class Comparison_Method_III extends Comparison { //抜けられるプレイヤーの評価値の効用の差分
  Comparison_Method_III(CoalitionUtility ut) {
    super(ut) ;
  }
  int compare(Coalition c, Coalition cc) {
    int sumC = 0 ;
    Coalition X = (Coalition) utility.get(playerNum).clone() ;  
    X.removeAll(c) ;
    for (Player p : X)
      sumC += utility.evaluation(p, c) ;

    int sumCC = 0 ;
    Coalition Y = (Coalition) utility.get(playerNum).clone() ;  
    X.removeAll(c) ;
    for (Player p : Y)
      sumCC += utility.evaluation(p, c) ;

    if (sumC >= sumCC) return 1 ;
    return 0 ;
  }
}

class Comparison_Method_IIII extends Comparison{ //尺度１＋３
  Comparison_Method_IIII(CoalitionUtility ut){
    super(ut) ;
  }
  int Comprare(Coalition c ,Coalition cc){
    
    return 0 ;
  }
}
