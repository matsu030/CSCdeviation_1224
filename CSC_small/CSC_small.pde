int playerNum = 10 ;
int pfRange = 5 ;
Game game ;

void setup() {
  game = new Game(playerNum) ;
  game.setProfile() ;
  CoalitionSet cs = game.findCSCPartition() ;
  println(cs) ;
  exit() ;
}
