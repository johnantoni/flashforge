// translate([]) scale cube difference
//cube([1,1,1], center = true);
module negCube(a,b,c) {
    translate([-0.01,-0.01,-0.01]){
      scale([1.01,1.01,1.01]){
         cube([a,b,c]);
      }
   }
}

module horizontalHole(d,x,y,z){
   rotate(90,[x,y,z]){
      cylinder(h = 200, r=(d/2), center = true);
   }
}

module legs(){
   difference(){
      rotate([0,20,0]){
         difference(){
            cube([35,45,15]);
            translate([3,0,5]){
               negCube(10,45,45);
            }
            
            translate([0,41,9]){
               horizontalHole(3,0,1,0);
            }
            
            translate([0,4,9]){
               horizontalHole(3,0,1,0);
            }
              
            translate([0,8,0]){
               negCube(35,29,15);
            }
         }
      }
      //
      translate([0,0,-15]){
         negCube(50,45,15);
      }
   }
}

difference(){
   union(){
      translate([0,0,3]){
         legs();
      }
      
      negCube(50,45,3);
   }
   
   translate([0,8,0]){
   negCube(40,29,15);
   }
}


