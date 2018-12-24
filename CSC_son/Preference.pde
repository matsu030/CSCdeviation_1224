class Preference {
  int memberValue[][] ;
  Preference(Coalition N) {
    memberValue = new int[N.size()][N.size()] ;
    for (int i = 0 ; i < N.size(); i++) {
      for (int j = 0 ; j < N.size(); j++)
        memberValue[i][j] =(int)random(-5, 5);
      memberValue[i][i] = 0 ;
    }
    setPreference(N) ;
  }
  void setPreference(Coalition N) {
    for (int i = 0; i < N.size(); i++)
      N.get(i).setPreference(memberValue[i]) ;
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
