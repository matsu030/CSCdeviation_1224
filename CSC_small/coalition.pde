class Coalition extends ArrayList<Player> {
  int[] evaluations ;
  int bit ;
  Coalition complement ;
  Coalition(int n, int b) {
    evaluations = new int[n] ;
    bit = b ;
  }
  void setAffiliation() {
    for (Player p : this) {
      p.affiliation = this ;
    }
  }
  String toString() {
    String[] stg = new String[size()] ;
    for (int i = 0 ; i < size() ; i++) {
      stg[i] = get(i).toString() ;
    }
    return "{" + join(stg, ", ") + "}" ;
  }
}
