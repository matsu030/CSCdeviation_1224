class  Instance {
  Coalition N ;
  Preference profile ;
  CoalitionSet allCoalitions ;
  Instance(int n) {
    N = new Coalition(n) ;
    profile = new Preference(N) ;
    allCoalitions = N.powerSet() ;
  }

  //Coalition findCSCDeviation(CoalitionSet pi) {
  //  pi.setAffiliation() ;
  //  for (Coalition X : allCoalitions) {
  //    if (isCSCDeviation(pi, X)) {
  //      return X ;
  //    }
  //  }
  //  return null ;
  //}

  Coalition findCSCDeviation(CoalitionSet pi) {
    pi.setAffiliation() ;
    for (Coalition X : allCoalitions) {
      if (isCSCDeviation(pi, X)) {
        return X ;
      }
    }
    return null ;
  }
  Coalition findCSCDeviation2(CoalitionSet pi) {
    pi.setAffiliation() ;
    // for (Coalition X : allCoalitions) {

    for (int k = 1; k <= maxsize; k++) {
      for (int r = 1; r <= combination(playerNum, k); r++) {
        Coalition X = KSubsetRevDoorUnRank(r, k, playerNum) ;
        if (isCSCDeviation(pi, X)) {
          return X ;
        }
      }
    }
    return null ;
  }

  boolean isCSCDeviation(CoalitionSet pi, Coalition X) {
    if (X.isEmpty()) return false ;//これはallcoalitionsに空集合があるから
    //X が pi からの CSC 逸脱のとき true, どうでない時 false
    boolean wannaGo = false ;
    for (Player p : X) {
      int newUtility = p.evaluation(X) ;
      if (newUtility > p.utility) wannaGo = true ;
      if (p.utility > newUtility) return false ;
    }
    if (!wannaGo) return false ;
    Coalition remains = (Coalition) N.clone() ;
    remains.removeAll(X) ;
    for (Player p : remains)
      if (!p.permit(X)) return false ;
    //
    return true ;
  }



  int findCSCStablePartition() {
    CoalitionSet pi = new CoalitionSet() ;
    for (Player p : N) {
      Coalition single = new Coalition() ;
      single.add(p) ;
      pi.add(single) ;
    }
    pi.setAffiliation() ;
    return findCSCStablePartition(pi) ;
  }

  int findCSCStablePartition(CoalitionSet pi) {
    //このpiは初期分割
    //CSC逸脱が存在しなくなるまでCSC逸脱を繰り返し，CSC安定分割を構成する．
    //逸脱回数を返す
    int count = 0 ;
    while (true) {
      Coalition d = null ;
      for (Coalition c : allCoalitions) {
        if (! isCSCDeviation( pi, c )) continue ;
        if (d == null || comparison1(c, d)) d = c ;  //comparison1を変えることによって行いたい尺度を指定できる comparisonMax(pi, c, d)
      }
      if (d == null) break ;
      // println("before " + pi) ;
      // println(d) ;
      pi.apply(d) ;
      // println("after " + pi) ;
      count++;
    }
    return count ;
  }


  //ここから最小の効用値を最大にする

  int findCSCStablePartitionMax() {
    CoalitionSet pi = new CoalitionSet() ;
    for (Player p : N) {
      Coalition single = new Coalition() ;
      single.add(p) ;
      pi.add(single) ;
    }
    pi.setAffiliation() ;
    return findCSCStablePartitionMax(pi) ;
  }



  int findCSCStablePartitionMax(CoalitionSet pi) {
    //このpiは初期分割
    //CSC逸脱が存在しなくなるまでCSC逸脱を繰り返し，CSC安定分割を構成する．
    //逸脱回数を返す
    int count = 0 ;
    while (true) {
      Coalition d = null ;
      for (Coalition c : allCoalitions) {
        if (! isCSCDeviation( pi, c )) continue ;
        if (d == null || comparisonMax(pi, c, d)) d = c ;  //comparison1を変えることによって行いたい尺度を指定できる comparisonMax(pi, c, d)
      }
      if (d == null) break ;
      // println("before " + pi) ;
      // println(d) ;
      pi.apply(d) ;
      // println("after " + pi) ;
      count++;
    }
    return count ;
  }
  //ここまで最小の効用値を最大にする

  //ここから尺度３-１

  int findCSCStablePartition3to1() {
    CoalitionSet pi = new CoalitionSet() ;
    for (Player p : N) {
      Coalition single = new Coalition() ;
      single.add(p) ;
      pi.add(single) ;
    }
    pi.setAffiliation() ;
    return findCSCStablePartition3to1(pi) ;
  }

  int findCSCStablePartition3to1(CoalitionSet pi) {
    int count = 0 ;
    while (true) {
      Coalition d = null ;
      for (Coalition c : allCoalitions) {
        if (! isCSCDeviation( pi, c )) continue ;
        if (d == null || comparison3to1(c, d)) d = c ;  //comparison1を変えることによって行いたい尺度を指定できる comparisonMax(pi, c, d)
      }
      if (d == null) break ;
      // println("before " + pi) ;
      // println(d) ;
      pi.apply(d) ;
      // println("after " + pi) ;
      count++;
    }
    return count ;
  }

  //ここまで尺度３-１


  int findCSCStablePartition3to2() {
    CoalitionSet pi = new CoalitionSet() ;
    for (Player p : N) {
      Coalition single = new Coalition() ;
      single.add(p) ;
      pi.add(single) ;
    }
    pi.setAffiliation() ;
    return findCSCStablePartition3to2(pi) ;
  }
  int findCSCStablePartition3to2(CoalitionSet pi) {
    int count = 0 ;
    while (true) {
      Coalition d = null ;
      for (Coalition c : allCoalitions) {
        if (! isCSCDeviation( pi, c )) continue ;
        if (d == null || comparison3to2(c, d)) d = c ;  //comparison1を変えることによって行いたい尺度を指定できる comparisonMax(pi, c, d)
      }
      if (d == null) break ;
      // println("before " + pi) ;
      // println(d) ;
      pi.apply(d) ;
      // println("after " + pi) ;
      count++;
    }
    return count ;
  }

  //ここまで尺度3-3


  int findCSCStablePartition4to1() {
    CoalitionSet pi = new CoalitionSet() ;
    for (Player p : N) {
      Coalition single = new Coalition() ;
      single.add(p) ;
      pi.add(single) ;
    }
    pi.setAffiliation() ;
    return findCSCStablePartition4to1(pi) ;
  }
  int findCSCStablePartition4to1(CoalitionSet pi) {
    int count = 0 ;
    while (true) {
      Coalition d = null ;
      for (Coalition c : allCoalitions) {
        if (! isCSCDeviation( pi, c )) continue ;
        if (d == null || comparison4to1(c, d)) d = c ;  //comparison1を変えることによって行いたい尺度を指定できる comparisonMax(pi, c, d)
      }
      if (d == null) break ;
      // println("before " + pi) ;
      // println(d) ;
      pi.apply(d) ;
      // println("after " + pi) ;
      count++;
    }
    return count ;
  }

  //ここまで尺度4--1


  int findCSCStablePartition4to2() {
    CoalitionSet pi = new CoalitionSet() ;
    for (Player p : N) {
      Coalition single = new Coalition() ;
      single.add(p) ;
      pi.add(single) ;
    }
    pi.setAffiliation() ;
    return findCSCStablePartition4to2(pi) ;
  }
  int findCSCStablePartition4to2(CoalitionSet pi) {
    int count = 0 ;
    while (true) {
      Coalition d = null ;
      for (Coalition c : allCoalitions) {
        if (! isCSCDeviation( pi, c )) continue ;
        if (d == null || comparison4to2(c, d)) d = c ;  //comparison1を変えることによって行いたい尺度を指定できる comparisonMax(pi, c, d)
      }
      if (d == null) break ;
      // println("before " + pi) ;
      // println(d) ;
      pi.apply(d) ;
      // println("after " + pi) ;
      count++;
    }
    return count ;
  }

  //ここまで尺度4-2

  int findCSCStablePartition5() {
    CoalitionSet pi = new CoalitionSet() ;
    for (Player p : N) {
      Coalition single = new Coalition() ;
      single.add(p) ;
      pi.add(single) ;
    }
    pi.setAffiliation() ;
    return findCSCStablePartition5(pi) ;
  }
  int findCSCStablePartition5(CoalitionSet pi) {
    int count = 0 ;
    while (true) {
      Coalition d = null ;
      for (Coalition c : allCoalitions) {
        if (! isCSCDeviation( pi, c )) continue ;
        if (d == null || comparison5(c, d)) d = c ;  //comparison1を変えることによって行いたい尺度を指定できる comparisonMax(pi, c, d)
      }
      if (d == null) break ;
      // println("before " + pi) ;
      // println(d) ;
      pi.apply(d) ;
      // println("after " + pi) ;
      count++;
    }
    return count ;
  }

  //ここまで尺度5




  boolean comparisonMax(CoalitionSet pi, Coalition c, Coalition cc) {
    //最小の効用値を最大化するための
    int minc = c.get(0).evaluation(c) ;
    for (Player p : c)
      if (minc > p.evaluation(c)) minc = p.evaluation(c) ;
    Coalition NN = (Coalition) N.clone() ;
    NN.removeAll(c) ;
    for (Player p : NN) {
      int a = p.utility - p.calcInfluence(c) ;
      if (minc > a)
        minc = a ;
    }
    int mincc = cc.get(0).evaluation(cc) ;
    for (Player p : cc)
      if (mincc > p.evaluation(cc)) mincc = p.evaluation(cc) ;
    NN = (Coalition) N.clone() ;
    NN.removeAll(cc) ;
    for (Player p : NN) {
      int a = p.utility - p.calcInfluence(cc) ;
      if (mincc > a)
        mincc = a ;
    }
    return (minc > mincc) ;
  }


  boolean comparison(CoalitionSet pi, Coalition c, Coalition cc) {
    //CSC逸脱回数を少なくするための
    return false ;
  }

  boolean comparison1(Coalition c, Coalition cc ) { //尺度１
    return(syakudo1(c) > syakudo1(cc));
  }

  boolean comparison3to1 (Coalition c, Coalition cc) { // 尺度3-1
    return (syakudo3to1(c) > syakudo3to1(cc)) ;
  }

  boolean comparison3to2 (Coalition c, Coalition cc) {
    return (syakudo3to2(c) > syakudo3to2(cc)) ;
  }

  boolean comparison4to1(Coalition c, Coalition cc) {
    return (syakudo4(c) > syakudo4(cc)) ;
  }

  boolean comparison4to2(Coalition c, Coalition cc) {
    return (syakudo4(c) < syakudo4(cc)) ;
  }

  boolean comparison5(Coalition c, Coalition cc) {
    return (syakudo5(c) < syakudo5(cc)) ;
  }

  int syakudo1 (Coalition c) {
    // CSC逸脱のutilityを全て確認したい
    //p.affiliation pi(i)
    //utility v_(pi(i))
    //v_i(X) - v_i(pi(i))
    int utilitySum = 0 ;
    for (Player p : c ) 
      utilitySum += (p.evaluation(c) - p.utility) ;
    return utilitySum ;
  }


  int syakudo3to1 (Coalition c) {  // i ¥in X , p in pi(i) - i  抜けられるプレイヤーの評価値の効用の差分
    int sum = 0 ;
    Coalition X = (Coalition) N.clone();
    X.removeAll(c) ; 
    for (Player i : X) {
      sum += i.calcInfluence(c) ;
    }
    return sum ;
  }

  int syakudo3to2 (Coalition c) {
    return syakudo3to1(c) + syakudo1(c) ;
  }


  int syakudo4(Coalition c) {
    //CSC逸脱候補の集団の大きさが大きいもの（小さいもの）を優先に処理する．
    return c.size() ;
  }

  int syakudo5(Coalition c) {
    //逸脱に関わるプレイヤーの数を計算する
    int psum = 0 ;
    CoalitionSet cs = new CoalitionSet() ;
    for (Player p : c) {
      if (! cs.contains(p.affiliation))
        cs.add(p.affiliation) ;
    }
    for (Coalition cc : cs)
      psum+=cc.size() ;
    return psum ;
  }


  int  KSubsetRevDoorRank(Coalition c, int k ) {
    int r = 1 ;
    int s = 0 ;
    if (k%2==0)  r = 0 ;
    else  r = -1 ;
    s=1 ;
    for (int i = k; i >= 0; i--) {
      r +=s * combination(c.get(i).index, i) ;
      s *= -1 ;
    }
    return r ;
  }

  Coalition KSubsetRevDoorUnRank(int r, int k, int n) {
    Coalition t = new Coalition () ;
    int x = n ; 
    for (int i = k; i >= 1; i --) {
      while (combination(x, i ) > r) {
        x -- ;
      }
      Player p = N.get(x) ;
      t.add(p) ;
      r = combination(x + 1, i ) - r - 1 ;
    }
    return  t;
  }

  //  Coalition KSubsetRevDoorSuccessor(Coalition c, int k, int n ) {
  //    Coalition cc = (Coalition) c.clone() ;
  //    cc.get(k).index = n + 1 ;
  //    int j = 1 ; 
  //    while ( j < = k && cc.get(j).index == j ) {
  //      j ++ ;
  //    }
  //    if (k % 2 != j ) {
  //      if (j = 1) c.get(j).index = c.get(j) -1 ;
  //      else {
  //        c.get(j - 1) = j ;
  //        c.get(j - 2) = j - 1 ;
  //      }
  //    } else 
  //    if ( c.get(j + 1) != c.get(j) + 1) {
  //      c.get(j - 1) = c.get(j) ;
  //      c.get(j) = c.get(j + 1) ;
  //    } else {
  //      c.get(j + 1) = c.get(j) ;
  //      c.get(j) = j ;
  //    }
  //  }
  //  return c ;
  //}

  Coalition KSubsetRevDoorSuccessor2(Coalition c, int k, int n ) {
    println("succ : " + c + " " + k);
    int T[] = new int[k+ 1] ;
    for (int i = 0; i < k; i++)
      T[i] = c.get(i).index ;
    T[k] = n  ;
    int j = 0 ;
    while ( j <( k - 1)  && T[j] == j ) {
      j ++ ;
    }
    println(j);
    if (((k - 1)% 2) != (j % 2)) {
      if (j == 0) {
        T[0]-- ;
      } else {
        T[j - 1] = j ;
        if (j !=1) 
          T[j - 2] = j - 1 ;
      }
    } else {
      if (T[j + 1] != (T[j] + 1) ) {
        if (j != 0) 
          T[j - 1] = T[j] ;
        T[j] = T[j] + 1 ;
      } else {
        T[j + 1] = T[j] ;
        T[j] = j ;
      }
    }
    Coalition cc = new Coalition() ;
    for (int i = 0; i < k; i++) {
      cc.add(N.get(T[i])) ;
    }
    return cc ;
  }
  Coalition KSubsetRevDoorSuccessor3(Coalition c, int k, int n ) {
    println("succ : " + c + " " + k);
    int T[] = new int[k+ 1] ;
    for (int i = 0; i < k; i++)
      T[i] = c.get(i).index ;
    T[k] = n + 1 ;
    int j = 0 ;
    while ( j < k && T[j] == j ) {
      j ++ ;
    }
    println(j);
    if ((k% 2) != (j % 2)) {
      if (j == 0) {
        T[0]-- ;
      } else {
        T[j - 1] = j ;
        T[j - 2] = j - 1 ;
      }
    } else {
      if (T[j + 1] != (T[j] + 1) ) {
        T[j - 1] = T[j] ;
        T[j] = T[j] + 1 ;
      } else {
        T[j + 1] = T[j] ;
        T[j] = j ;
      }
    }
    Coalition cc = new Coalition() ;
    for (int i = 0; i < k; i++) {
      cc.add(N.get(T[i])) ;
    }
    return cc ;
  }
}
