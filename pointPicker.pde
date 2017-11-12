/*
pointPicker.pde
Daniel Hoare 2017

Allows sets of points to be chosen from the display and saved to a text file.
Points are saved as "x1 y1, x2 y2, ..." with each set on a new line.
Coordinates are saved as mouseX/width and mouseY/height.

Click to add point to current set, press n to start a new set and s to save to file.
*/

//arraylist to store collections
ArrayList<PointCollection> pointCollections;
PointCollection currentPc;

ArrayList<Block> blocks;

void setup() {
  size(700,700);
  background(255);
  colorMode(HSB);
  
  pointCollections = new ArrayList<PointCollection>();
  
  //create an initial pc with a colour and set to active
  PointCollection p = new PointCollection(color(0, 255, 188));
  pointCollections.add(p);
  currentPc = p;
  
  blocks = new ArrayList<Block>();
  loadBlocks(blocks);
}

void draw() {
  background(255);
  
  for(int i = 0; i < blocks.size(); i++) {
      Block b = blocks.get(i);
      b.display();
    }
  
  for(PointCollection p : pointCollections) {
    p.display();
  }
}


//add points on mouse click
void mousePressed() {
  currentPc.addPoint(mouseX, mouseY);
}

//new point collection and save to file
void keyPressed() {
  if(key == 's') {
    //save to file
    String[] list = new String[pointCollections.size()];
    for(PointCollection p : pointCollections) {
      list[pointCollections.indexOf(p)] = (p.writePoints());
    }
    saveStrings("points.txt", list);
    
  } else if(key == 'n'){
    //new set with a new colour, each set distinct colour but no direct loop
    PointCollection p = new PointCollection(color((30 * pointCollections.size()) %255, 255, 188));
    pointCollections.add(p);
    currentPc = p;
  }
}