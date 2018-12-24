class CoalitionSet extends ArrayList <Coalition> {
  void setAffiliation() {
    for (Coalition c : this)
      for (Player p : c)
        p.setAffiliation(c) ;
  }
  String toString() {
    String s[] = new String[this.size()] ;
    for (int i = 0; i < size(); i++)
      s[i] = get(i).toString() ;
    return "{" + join(s, ",") + "}" ;
  }
  void apply(Coalition X) {
    //println("before:"+this);  逸脱実行前の分割
    for (Player p : X) {
      p.affiliation.remove(p) ;
      if (p.affiliation.isEmpty()) remove(p.affiliation);
    }
    // for(Coalition c : this)
    // if(c.isEmpty()) remove(c) ;
    add(X) ;
    setAffiliation() ;
    //println("after:"+this);  逸脱実行後の分割
  }
}
