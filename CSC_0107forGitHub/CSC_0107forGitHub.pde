int playerNum = 50 ;
int pfRange = 10 ;
Game game ;
int[] ord = {4 , 1} ;
void setup() {
  game = new Game(playerNum, ord) ;
       println("ord: "+ join(nf(game.utility.manager.order,0),",")) ;
  game.setProfile() ;
  CoalitionSet cs = game.findCSCPartition() ;
  println() ;
  int[] newOrder = {5 , 1} ;
  game.setOrder(newOrder) ;
      println("ord: "+ join(nf(game.utility.manager.order,0),",")) ;
 cs = game.findCSCPartition() ;
  exit() ;
}
