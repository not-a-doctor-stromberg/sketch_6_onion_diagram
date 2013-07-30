//TODO:
/* Add support for a m_sDescription field. It can be used to access more info about the
 stakeholder. Also, perhaps a display() method, to bring up stats when it's hovered over. */

int iDiameter;

//Meat Industry
Stakeholder shMeatIndustry;

//Consumers of Meat Industry
Stakeholder shConsumers;

//Hippies
Stakeholder shHippies;

//Distributers
Stakeholder shDistributers;

//ArrayList to hold stakeholders
ArrayList<Stakeholder> alStakeholders;
final color RED = color(255, 0, 0);
final color BLUE = color(0, 0, 255);
final color GREEN = color(0, 255, 0);
final color PURPLE = color(255, 0, 255);
final color YELLOW = color(255, 255, 0);
PImage piLegend;

void setup()
{
  size(500, 500);

  iDiameter = width - 150; //Cushion of 150 pixels around the radius

  shMeatIndustry = new Stakeholder(5, 4, "Meat Industry", RED);
  shConsumers = new Stakeholder(3, 5, "Consumers of the Meat Industry", BLUE);
  shHippies = new Stakeholder(2, 3, "Hippies", GREEN);
  shDistributers = new Stakeholder(4, 3, "Distributers", PURPLE);

  //Add stakeholders to the ArrayList
  alStakeholders = new ArrayList();
  alStakeholders.add(shMeatIndustry);
  alStakeholders.add(shConsumers);
  alStakeholders.add(shHippies);
  alStakeholders.add(shDistributers);

  ellipse(width/2, height/2, iDiameter, iDiameter);
  piLegend = loadImage("legend.png");
}

void draw()
{
  background(255);
  int iTotalInfluence = 0;
  int totalCloseness = 0;
  int iRadius = iDiameter/2;
  float fTotalAngle = 0.0;
  for (Stakeholder stakeholder : alStakeholders)
  {
    iTotalInfluence += stakeholder.getInfluence();
    totalCloseness += stakeholder.getCloseness();
  }

  //TODO
  /*Don't include the last line. Your proportions aren't correct because the first segment
   is based of the idea that there's a line drawn at pi = 0*/

  //Draw the lines, first starting w a line at angle 0;
  for (Stakeholder stakeholder : alStakeholders)
  {  
    float fAngle = 0;

    //Find the offset for the lines based on their closeness
    float fClosenessX = (cos(fTotalAngle) * (iRadius * (1 - (float(stakeholder.getCloseness()) / 5))));
    float fClosenessY = (sin(fTotalAngle) * (iRadius * (1 - (float(stakeholder.getCloseness()) / 5))));

    //draw the section of the pie
    stroke(0);
    strokeWeight(1);

    line(width/2, 
    height/2, 
    width/2 + (cos(fTotalAngle) * iRadius), 
    height/2 + (sin(fTotalAngle) * iRadius));

    //color the lines
    stroke(stakeholder.getColor());
    strokeWeight(4);

    //draw the lines
    /*line(width/2 + fClosenessX, 
    height/2 + fClosenessY, 
    width/2 + (cos(fTotalAngle) * iRadius), 
    height/2 + (sin(fTotalAngle) * iRadius));*/

    //Calculate length of the line
    float fLineLength = sqrt( sq(((height/2 + fClosenessY) - (height/2 + (cos(fTotalAngle) * iRadius)))) +
      sq((width/2 + fClosenessX) - (width/2 + (sin(fTotalAngle) * iRadius))));

    float fClosenessLength = sqrt( sq(height/2 - (height/2 + fClosenessY)) +
      sq(width/2 - (width/2 + fClosenessX)));

    //Calculate the angle for the next stake holder
    fAngle = float(stakeholder.getInfluence()) / iTotalInfluence;
    fAngle = fAngle * TWO_PI;
    fTotalAngle += fAngle;

    //Draw the arc
    noFill();
    strokeWeight(1);
    for (int i = 0; i <= iDiameter - (fClosenessLength * 2); i++)
    {
      arc(width/2, height/2, (fClosenessLength * 2) + i , (fClosenessLength * 2) + i, 
        fTotalAngle - fAngle, 
        fTotalAngle);
    }
  }
  
  //Draw the legend if they press l(for legen- wait for it....DARY!)
  if (keyPressed)
  {
    if (key == 'l' || key == 'L')
    {
      image(piLegend, mouseX, mouseY);
    }
  }
}

