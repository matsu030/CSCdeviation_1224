int playerNum = 10 ;
int pfRange = 5 ;
Game game ;
int[] ord = {0,1} ;
void setup() {
  game = new Game(playerNum, ord) ;
  game.setProfile() ;
  game.utility.id() ;
  CoalitionSet cs = game.findCSCPartition() ;

  game.utility = new CoalitionUtilityBit(game.players, ord) ;
  game.utility.id() ;
  game.utility.setEvaluation() ;
  cs = game.findCSCPartition() ;
  exit() ;
}
