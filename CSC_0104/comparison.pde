class Comparison {
  CoalitionUtility utility ;
  Comparison(CoalitionUtility ut) {
    utility = ut ;
  }
  int compare(Coalition c, Coalition cc) {
    return 1 ;
  }
  int Method_II(Coalition c) {
    int utilitySum = 0 ;
    for (Player p : c)
      utilitySum += (utility.evaluation(p, c) - p.utility) ;
    return utilitySum ;
  }

  int Method_III(Coalition c) {
    int sum = 0 ;
    Coalition X = (Coalition) utility.get(playerNum).clone() ;  
    X.removeAll(c) ;
    for (Player p : X)
      sum += utility.evaluation(p, c) ;
    return sum ;
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
    if (Method_II(c) >= Method_II(cc)) return 1 ;
    return 0;
  }
}

class Comparison_Method_III extends Comparison { //抜けられるプレイヤーの評価値の効用の差分
  Comparison_Method_III(CoalitionUtility ut) {
    super(ut) ;
  }
  int compare(Coalition c, Coalition cc) {
    if (Method_III(c) >= Method_III(cc)) return 1 ;
    return 0 ;
  }
}

class Comparison_Method_IV extends Comparison { //Method１ ＋ Method３
  Comparison_Method_IV(CoalitionUtility ut) {
    super(ut) ;
  }
  int Comprare(Coalition c, Coalition cc) {
    if (( Method_II(c) +Method_III(c) ) >= (Method_II(cc) + Method_III(cc))) return 1 ;
    return 0 ;
  }
}

class Comparison_Method_V extends Comparison { //CSC逸脱集団の大きさが小さい集団を優先
  Comparison_Method_V(CoalitionUtility ut) {
    super(ut) ;
  }
  int compare(Coalition c, Coalition cc) {
    if(c.size() <= cc.size()) return 1 ;
    return 0 ;
  }
}

class Comparison_Method_VI extends Comparison { //CSC逸脱集団の大きさが大きい集団を優先
  Comparison_Method_VI(CoalitionUtility ut) {
    super(ut) ;
  }
  int compare(Coalition c, Coalition cc) {
    if(c.size() > cc.size()) return 1 ;
    return 0 ;
  }
}
