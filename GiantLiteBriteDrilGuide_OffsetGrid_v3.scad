//Giant LiteBrite offset grid, distance from holes is 1/2.
// Defined in mm but, set for Imperial

//*******  Setup  *******
//Template Size
templateSizeX = 152.4; // 6" 
//templateSizeX = 609.6; // 2'
templateSizeY = 152.4; // 6"
//templateSizeY = 1219.2; // 4'
templateThickness = 1.0; 
stripSize = 25.4/3; // 1/3"
//stripSize = 4;

//HoleSize and Spacing
holeSize = 28.575;  // 1-1/8" 
penHoleSize = 3; // 2mm for sharpie
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
		//square([templateSizeX,templateSizeY]);
        union()
        {
            //big grid of strips for support
            
            //Horizontal
            for(y = [(startingY-stripSize/2):(shortIntervalY*2):templateSizeY])
            {
				translate([0,y])square([templateSizeY,stripSize]);
            }
            for(y = [(startingY+shortIntervalY-stripSize/2):(shortIntervalY*2):templateSizeY])
            {
                translate([0,y])square([templateSizeY,stripSize]);
            }
            
            //Vertical
            for(x = [(startingX-stripSize/2):intervalX:templateSizeX])
			{
                translate([x,0])square([stripSize,templateSizeX]);
            }
            for(x = [(offsetStartingX+intervalX/2-stripSize/2):intervalX:templateSizeX])
            {
                translate([x,0])square([stripSize,templateSizeX]);
            }
        }    
    
    
        
        //echo("Normal Rows");
		for(y = [startingY:(shortIntervalY*2):templateSizeY])
        {
            for(x = [startingX:intervalX:templateSizeX])
				{translate([x,y])circle(d=penHoleSize);}
            //echo(y);
        }
        
        //echo("Offset Rows");
		for(y = [(startingY+shortIntervalY):(shortIntervalY*2):templateSizeY])
        {
            for(x = [offsetStartingX+(intervalX/2):intervalX:templateSizeX])
                   {translate([x,y])circle(d=penHoleSize);}
            //echo(y);
        }	
	}

}
	




