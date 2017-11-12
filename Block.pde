/*---------------------------------------------------------------
Block
Physical objects that are opaque. Made from a collection of lines
and points.

----------------------------------------------------------------*/

class Block{
  ArrayList<PVector> points;
  ArrayList<PVector> points_origin;
  
  /*---------------------------------------------------------------
  Init
  ----------------------------------------------------------------*/

  Block(ArrayList<PVector> ps){
    points = new ArrayList<PVector>();
    points_origin = new ArrayList<PVector>();
    //make sure new instances are created, not just reference passing
    for(PVector p : ps) {
      PVector P = p.copy();
      points.add(P);
      points_origin.add(p.copy());
    }
  }
 
  /*---------------------------------------------------------------
  Display
  ----------------------------------------------------------------*/
  void display() {
    fill(0);
    for(PVector p : points){
      rectMode(CENTER);
      rect(p.x, p.y, 5, 5);
    }
  }
  
}

void loadBlocks(ArrayList<Block> blocks) {
  String[] lines = loadStrings("points.txt");
  for(int i = 0; i < lines.length; i++) {
    
    //setup for new block
    String[] points = lines[i].split(",");
    ArrayList<PVector> blockPoints = new ArrayList<PVector>();
    
    //for each point to a block
    for(int j = 0; j < points.length; j++) {
      String[] coords = points[j].split(" ");
      blockPoints.add(new PVector(float(coords[0])*width, float(coords[1])*height));
    }
    
    Block b = new Block(blockPoints);
    blocks.add(b);
    blockPoints.clear();
  }
}