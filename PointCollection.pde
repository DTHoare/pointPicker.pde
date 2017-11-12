/*
PointCollection
stores details of each set of points, and allows them to be written to a string
*/

class PointCollection {
  color colour;
  ArrayList<PVector> points;
  
  PointCollection(color c) {
    colour = c;
    points = new ArrayList<PVector>();
  }
  
  void addPoint(float x, float y) {
    points.add(new PVector(x / width, y / height));
  }
  
  void display() {
    noStroke();
    fill(colour);
    for(PVector p : points) {
      ellipse(p.x * width, p.y * height, 4, 4);
    }
  }
  
  String writePoints() {
    String output = "";
    for(PVector p : points) {
      output = output + p.x + " " + p.y + ",";
    }
    //remove excess comma at the end if exists
    if (output.length() > 0) {
      output = output.substring(0, output.length() -1);
    }
    
    return output;
  }
}