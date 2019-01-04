int playerNum = 10 ;
int pfRange = 5 ;
Game game ;
int[] ord = {0,1} ;
void setup() {
  game = new Game(playerNum, ord) ;
  game.setProfile() ;
  CoalitionSet cs = game.findCSCPartition() ;
  println() ;
  int[] newOrder = {1,0} ;
  game.setOrder(newOrder) ;
 cs = game.findCSCPartition() ;

  exit() ;
}
