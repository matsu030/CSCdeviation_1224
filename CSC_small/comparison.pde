class Comparison {
  CoalitionUtility utility ;
  Comparison(CoalitionUtility ut) {
    utility = ut ;
  }
  int compare(Coalition c, Coalition cc) {
    return 1 ;
  }
}

class Comparison_Method_I extends Comparison {
  Comparison_Method_I(CoalitionUtility ut) {
    super(ut) ;
  }
  int compare(Coalition c, Coalition cc) {
    return 0 ;
  }
}
