class Preference {
  int memberValue[][] ;
  Preference(Coalition gc) {
    memberValue = new int[gc.size()][gc.size()] ;
    for (int i = 0 ; i < gc.size() ; i++) {
      for (int j = 0 ; j < gc.size() ; j++) {
        memberValue[i][j] = int(random(-prefRange, prefRange)) ;
      }
      memberValue[i][i] = 0 ;
    }
  }
  String toString() {
    String s[] = new String[memberValue.length] ;
    for (int i = 0; i < s.length; i++) {
      String[] ss = new String[s.length] ;
      for (int j = 0; j < s.length; j++)
      ss[j] = str(memberValue[i][j]);
      s[i] = join(ss, " ") ;
    }
    return  join(s, "\n") ;
  }
}
