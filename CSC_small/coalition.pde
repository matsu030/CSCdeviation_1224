class Coalition extends ArrayList<Player> {
  int[] evaluations ;
  int bit ;
  Coalition complement ;
  Coalition(int n, int b) {
    evaluations = new int[n] ;
    bit = b ;
  }
  String toString() {
    String[] stg = new String[size()] ;
    for (int i = 0 ; i < size() ; i++) {
      stg[i] = get(i).toString() ;
    }
    return "{" + join(stg, ", ") + "}" ;
  }
  void setAffiliation() {
    for (Player p : this) {
      p.affiliation = this ;
      p.utility = p.evaluation(this) ;
    }
  }
  boolean hasWeakIncentive() {
    boolean incentive = false ;
    for (Player p : this) {
      int gain = p.evaluation(this) - p.utility ;
      if (gain < 0) return false ;
      if (gain > 0) incentive = true ;
    }
    return incentive ;
  }
}
