class Coalition extends ArrayList<Player> {
  Coalition() {
  }
  Coalition (int n) {
    for (int i = 0; i < n; i++)
      add(new Player (i)) ;
  }

  CoalitionSet powerSet() {
    CoalitionSet cs = new CoalitionSet() ;
    if (isEmpty()) {
      cs.add(new Coalition()) ;
    } else {
      Coalition c = (Coalition) clone() ;
      Player p = c.remove(c.size() - 1) ;
      CoalitionSet ps = c.powerSet() ;
      cs.addAll(ps);
      for (Coalition X : ps) {
        Coalition XX = (Coalition) X.clone() ;
        XX.add(p) ;
        cs.add(XX) ;
      }
    }
    return cs ;
  }
  String toString() {
    String s[] = new String[this.size()] ;
    for (int i = 0; i < size(); i++)
      s[i] = str(get(i).index) ;
    return "{" + join(s, ",") + "}" ;
  }
}
