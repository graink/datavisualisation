/* 
GEOMAP TESTING 
OUTCOME - CANT LOCATE LIBRARY 
GeoMap geoMap;
  
void setup()
{
  size(800, 400);  
  geoMap = new GeoMap(this);  // Create the geoMap object.
  geoMap.readFile("world");   // Read shapefile.
}
  
void draw()
{
  background(202, 226, 245);  // Ocean colour
  fill(206,173,146);          // Land colour
  stroke(0,40);               // Boundary colour
    
  geoMap.draw();              // Draw the entire map.
   
  noLoop();                  // Static map so no need to redraw.
} */

Table table;
float xlocation;
float ylocation;
float radius;
String country;


void setup(){
  
  //size(3000, 1200, P3D);
  // size(3000, 1200);
  
 //fit to screen
 size(displayWidth, displayHeight, P3D);
  
  table=loadTable("health-income.csv", "header");
  
  background(255);
  stroke(0);
  
  //label y axis
  line(50, 0, 50, 1150);
  fill(0);
  text ("100", 12, 25);
  text ("H", 25, 500);
  text ("E", 25, 525);
  text ("A", 25, 550);
  text ("L", 25, 575);
  text ("T", 25, 600);
  text ("H", 25, 625);
  text ("%", 25, 650);
  text ("0", 20, 1150);
  
  //label x axis
  line(50, 1150, 3000, 1150);
  text ("0", 50, 1180);
  text ("I N C O M E ", 1350, 1180);
  text ("150,000", 2500, 1180);
  populateTable();
}

void populateTable(){
  
  noStroke();
  
  for(TableRow row: table.rows()){
     
  float income = row.getFloat("income");
  float health = row.getFloat("health");
  float population = row.getFloat("population");
  
  float xlocation=200+income*0.016;
  float ylocation = 1200-(1200*(health/100));
  
  //determine size and colour of points on plot
  float radius = population/3000000;
  float R = random (255);
  float G = random (255);
  float B = random (255);
  
  
  fill(R, G, B, 127);
  
  circle(xlocation, ylocation, radius);

  noLoop();
}
}

void draw(){
  loop();
  stroke(0.5);

//country to show when mouse is clicked 
if (mousePressed &&(mouseButton ==LEFT)){
  for(TableRow row: table.rows()){
  float income = row.getFloat("income");
  float health = row.getFloat("health");
  String country = row.getString("country");
  
  float xlocation=200+income*0.016;
  float ylocation = 1200-(1200*(health/100));
  fill(10);
  text(country, xlocation, ylocation);  
  println(country);
  }
}
}
