//Giant LiteBrite offset grid, distance from holes is 1/2.
// Defined in mm but, set for Imperial

//*******  Setup  *******
//Template Size
templateSizeX = 152.4; // 6" 
//templateSizeX = 609.6; // 2'
templateSizeY = 152.4; // 6"
//templateSizeY = 1219.2; // 4'
templateThickness = 1; 

//HoleSize and Spacing
holeSize = 28.575;  // 1-1/8" 
xSpacing = 12.7; // 1/2"
offsetSpacing = 12.7;  //Distance from the holes in the next row (think 45 degree angle). 1/2"

//***********************


ySpacing = offsetSpacing*sin(45); 

//On Center Intervals
startingX = xSpacing + holeSize/2;
intervalX = xSpacing + holeSize;
//offsetStartingX = xSpacing + holeSize/2;
offsetStartingX = -(holeSize/2);

startingY = offsetSpacing + holeSize/2;
shortIntervalY = ySpacing + holeSize;
normIntervalY = offsetSpacing + holeSize;

linear_extrude(height = templateThickness)
{
	difference()
	{
		square([templateSizeX,templateSizeY]);
            
        echo("Normal Rows");
		for(y = [startingY:(shortIntervalY*2):templateSizeY])
        {
            for(x = [startingX:intervalX:templateSizeX])
				{translate([x,y])circle(d=holeSize);}
            echo(y);
        }
        
        echo("Offset Rows");
		for(y = [(startingY+shortIntervalY):(shortIntervalY*2):templateSizeY])
        {
            for(x = [offsetStartingX+(intervalX/2):intervalX:templateSizeX])
                   {translate([x,y])circle(d=holeSize);}
            echo(y);
        }	
	}

}
	




