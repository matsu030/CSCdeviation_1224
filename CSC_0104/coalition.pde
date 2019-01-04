class Coalition extends ArrayList<Player> {
  int bit ;
  Coalition(int b) {
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
    }
  }
}
