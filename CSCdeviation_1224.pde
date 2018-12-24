int playerNum ;
int maxsize ;
Instance ins ;
void setup() {
 playerNum = 4;// プレイヤー人数
 maxsize = 3 ; //一つの集団の最大の大きさ
 //for (int i = 0; i < 50; i++) {  //様々なインスタンスを同時に試すとき
 ins = new Instance(playerNum) ;
 //println(ins.profile) ;
 for (Player p : ins.N)
 p.printPreference() ;
 //println("-------------------------------------------------");
 println("尺度１の逸脱回数") ;
 println(ins.findCSCStablePartition()) ;
 // println("-・-・-・-・-・-・-・-・-・-・-・-・-・-・");
 //  println("最小の効用値を最大にした時の逸脱回数 :") ; //プレイヤーの平等性に意識．社会に最も向いているかも
 // println(ins.findCSCStablePartitionMax()) ;
 // println("-・-・-・-・-・-・-・-・-・-・-・-・-・-・");
 //println("尺度３-１の逸脱回数 :") ; //プレイヤーの平等性に意識．社会に最も向いているかも
 //println(ins.findCSCStablePartition3to1()) ;
 println("-------------------------------------------------");
 
 //int m = combination(playerNum, 2);
 //for (int i = 0; i < m; i++) {
 //println("R :"+ ins.KSubsetRevDoorUnRank(i, 2, playerNum)) ;
 //}
 ////successorが正しく動くか確認コード
 //for (Coalition c : ins.allCoalitions) {
 //if (c.size() == 0) continue ;
 //println(c + " to " +  ins.KSubsetRevDoorSuccessor2(c, c.size(), playerNum));
 //}
 //
 //println(ins.allCoalitions);
 //Coalition c = ins.allCoalitions.get(1);s
 //println(c + " to " +  ins.KSubsetRevDoorSuccessor2(c, c.size(), playerNum));
 exit();
 }
 


//CSC stable
//set pi = { N }
//repeats until cont & weak = 0
//find cont & weak
//set pi = { Y - X | Y in Pi & Y not subseteq X } & { X }
//return pi
int combination (int n, int r ) {
  int x = 1, y = 1; 
  int nn = n, rr = r; 
  for (int i = 0; i < r; i++) {
    x *= nn; 
    y *= rr; 
    nn--; 
    rr--;
  }
  return x / y;
}

void kSubset(int k, int n) {
  int[] t = new int[k+1] ;
  for (int i = 0; i < k; i++)
    t[i] = i ;
  t[k] = n ;
  if (k == n) {
    setPrint(t)   ;
  } else { 
    while (true  ) {
      setPrint(t)   ;
      if (!succ(t, n)) break ;
    }
  }
}

boolean succ(int[] t, int n ) {
  int k = t.length  -1 ;
  int j = 0 ;
  while ( j < k && t[j] == j ) {
    j ++ ;
  }
  println("・k = " + k) ;
  println("・j = " + j) ;
  if ((k% 2) == (j % 2)) {
    if (j == 0) {
      t[0]-- ;
    } else {
      t[j - 1] = j ;
      if (j >= 2)  t[j - 2] = j - 1 ;  //変わる場所が先頭の時エラーが起きる
    }
  } else {
    if (t[j + 1] != (t[j] + 1) ) {  //
      if (j >= 1) t[j - 1] = t[j] ;
      t[j]++ ;
    } else {
      t[j + 1] = t[j] ;
      t[j] = j ;
    }
  }
  return (t[k] == n) ;
}

void setPrint(int[] t) {
  for (int i = 0; i < t.length - 1; i++) 
    print(t[i]) ;
  println() ;
}
