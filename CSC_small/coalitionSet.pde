class CoalitionSet extends ArrayList<Coalition> {
  CoalitionSet() {
  }
  String toString() {
    String[] stg = new String[size()] ;
    for (int i = 0 ; i < size() ; i++) {
      stg[i] = get(i).toString() ;
    }
    return "{" + join(stg, ", ") + "}" ;
  }
  void setAffiliation() {
    for (Coalition c : this) {
      c.setAffiliation() ;
    }
  }
}
