                   .:                     :,                                          
,:::::::: ::`      :::                   :::                                          
,:::::::: ::`      :::                   :::                                          
.,,:::,,, ::`.:,   ... .. .:,     .:. ..`... ..`   ..   .:,    .. ::  .::,     .:,`   
   ,::    :::::::  ::, :::::::  `:::::::.,:: :::  ::: .::::::  ::::: ::::::  .::::::  
   ,::    :::::::: ::, :::::::: ::::::::.,:: :::  ::: :::,:::, ::::: ::::::, :::::::: 
   ,::    :::  ::: ::, :::  :::`::.  :::.,::  ::,`::`:::   ::: :::  `::,`   :::   ::: 
   ,::    ::.  ::: ::, ::`  :::.::    ::.,::  :::::: ::::::::: ::`   :::::: ::::::::: 
   ,::    ::.  ::: ::, ::`  :::.::    ::.,::  .::::: ::::::::: ::`    ::::::::::::::: 
   ,::    ::.  ::: ::, ::`  ::: ::: `:::.,::   ::::  :::`  ,,, ::`  .::  :::.::.  ,,, 
   ,::    ::.  ::: ::, ::`  ::: ::::::::.,::   ::::   :::::::` ::`   ::::::: :::::::. 
   ,::    ::.  ::: ::, ::`  :::  :::::::`,::    ::.    :::::`  ::`   ::::::   :::::.  
                                ::,  ,::                               ``             
                                ::::::::                                              
                                 ::::::                                               
                                  `,,`


http://www.thingiverse.com/thing:1675208
FlashForge Creator Pro front dual fan duct by DrLex is licensed under the Creative Commons - Attribution license.
http://creativecommons.org/licenses/by/3.0/

# Summary

This is a drop-in replacement fan duct that fits the *FlashForge Creator Pro* and similar models that have the ‘turbo fan’ at the left of the nozzles. It has been confirmed to fit the 2015 FFCP (with upwards opening door), the 2016 (sideways door), and the Dreamer. It probably also fits clones like CTC and PowerSpec.

The stock duct has an obvious problem: it only cools the left nozzle. This means it pretty much obliges you to always print filaments like PLA or PETG with the left nozzle, because they require active cooling for a good result. This new duct offers cooling for both nozzles at the same time, which allows you to use any filament with any of the nozzles, and also do dual PLA extrusions with proper cooling as well.

After reports that the v4 and v5 versions of this duct did not perform as well as the stock duct (for single extrusion with the left nozzle obviously), I made some more improvements and did some extensive tests that confirmed the new v6 outperforms the stock duct on a particular challenging model. It is however still possible that the stock duct will provide better results in specific situations, but those should be rare.

**Be sure to check for updates:** use the ‘watch’ button. This design has been improved multiple times and it is possible there will be future updates. I didn't mark it as being a ‘work-in-progress’ because each version is usable on its own. Before printing, remember to check whether the file you downloaded is the newest version. Check the **updates** section below for information about the latest version (currently **v6r**).

**Printing**
This should be printed in a filament that can withstand some heat like ABS. Avoid PLA, as it is likely to deform from the heat of the nozzles and possibly the heated bed as well. PETG is not recommended either: it will deform rather quickly (been there, done that). A translucent material has the advantage that it will pass through some of the light from the LED strip (although you may want to add [an extra LED](http://www.thingiverse.com/thing:1790072) to compensate).

See the Print Settings section for details.

**Installing**
The only post-processing you should probably do, is widen the small hole next to the screw with a 2mm drill, this will ensure a perfect and snug fit.

Your nozzles should be roughly at the stock installation height for the airflow to be correctly aimed. This means there should be about 10 mm between the bottom of the cradle and the tip of the nozzle (see photo at the end of the “How I Designed This” section). One way to ensure this, is to use [this leveler](http://www.thingiverse.com/thing:1582720).

Mounting is very easy. You will have a tiny bit of margin to wiggle the duct up and down, ensure it is not rubbing against the rail by pushing it down while tightening the screw. The little tab should be resting on top of the cradle. I recommend to stick the tab to the carriage by means of a small piece of rubber wrapped in double-sided tape. The reason is that I have observed the printer sometimes making unaccelerated jerky moves that could be violent enough to break the duct.

Even though it is considerably larger than the stock fan duct, my ABS print of the v5 duct weighs exactly the same as the stock duct, so there should be no impact on print performance.

If you want to retrofit the blower fan and this duct on an older printer that does not have the mounting bracket, you can print [my clone of it](http://www.thingiverse.com/thing:2086927).

**Using**
Just like with the stock duct, a limitation is that it only blows in one direction, meaning that parts in the ‘shadow’ of the nozzle (i.e. at the back) will get the least cooling. If possible, orient the model such that overhangs, or whatever parts should look best, are at the front.

You can enable the fan on ABS prints to improve quality, but this will greatly increase the risk of warping and cracking. Enabling the fan continuously with ABS is only feasible for smaller objects printed with thin layers. Be sure to increase your print temperature if you do, and seal the enclosure to keep the air inside cozy and warm. A raft can also help to prevent warping. On large ABS prints, you should rely on smart cooling features of your slicer software to only enable the fan while printing overhangs. The best solution to use the fan with ABS, is to install a PWM controller to reduce fan speed (don't bother trying to vary the speed in your slicer program, the fan circuit in the FFCP is on/off only).

In theory you could plug the exhaust of the unused nozzle when doing single-extrusion prints. This will provide even more airflow but it is a hassle to do, and will cause the fan to spin faster because of the restricted flow, therefore do it at your own risk.

# Print Settings

Printer Brand: FlashForge
Printer: Creator Pro
Rafts: No
Supports: No
Resolution: 0.2 mm
Infill: 100%

Notes: 
Make sure to disable supports, otherwise the duct may be blocked by material added on the inside. The model is designed to be printed easily without supports, and a raft or brim should also be unnecessary. Just ensure your bed is well-levelled and you have no problems printing bridges. The model has internal structures to minimise the risk of problems caused by your slicer and printer, but only if you print it with the intake pointing upwards.

Do not rush this print. To get a strong result, print *slowly* and only provide the minimum amount of cooling necessary. If you can control fan speed (which is **not** the case on an unmodified FFCP), you can enable it all the time at about 50%. Otherwise, only enable the fan while the large overhangs are being printed. You should get an OK result without fan altogether.

Don't be afraid to set infill to 100%: the model consists of thin walls for the most part, so you would save very little material with a lower infill. 100% is needed to ensure the strength of the few small solid parts. You won't be saving much filament or weight by trying to enforce a lower infill, you would only make the duct weaker.

In Slic3r, I used two perimeters, 2 top layers and 2 bottom layers (more layers can cause a mess on the ‘ceiling’ of the duct due to quirks of the slicer).

# How I Designed This

![Alt text](https://cdn.thingiverse.com/assets/83/94/ad/04/39/Windmill_test.jpg)
The ‘windmill test’

## The basics

The screw mounting part was taken from FFCP DUCT by natewin, for the rest this was designed from scratch.

I created the first iteration by measuring the dimensions of the FFCP printing assembly with a caliper, and making a rough model of it in Blender. Then I constructed the duct around this model. For the exhaust shapes, I started out with a wet-finger guess. This seemed to do the job at first, but eventually I noticed it didn't perform well. To find out in what direction the air really was being blown, I printed a small windmill that can be mounted on an empty ballpoint refill, and enabled the fan with a custom x3g file. This showed the air was aimed way too much downward, and also at a wrong angle in the horizontal plane. So, I tweaked the exhaust shapes and printed new ones, testing them with the little windmill until the airflow was just right. Of course I didn't re-print the entire duct every time, only the exhaust part, which I attached to the decapitated duct with some adhesive tape (nope, not with *duct* tape, just ordinary tape).

I did the same windmill test on the stock fan duct, and it also suffers from a poorly aimed airflow. So even if you will never print with more than one nozzle, this should still be a noticeable upgrade.

![Alt text](https://cdn.thingiverse.com/assets/6d/8a/53/30/8c/DuctSCIENCE.jpg)
Now with more science!

## The refinements

For the v6 version, I went even further and compared the performance of new prototypes to the stock duct and the v5. For this, I created a small [mushroom-shaped model](http://www.thingiverse.com/thing:2005832) which I printed in PLA at a higher temperature than usual. This model warps like crazy without proper cooling. Because my duct blows from the front unlike the stock duct which blows from the left, I manipulated the test GCode file by rotating all coordinates 90° clockwise, to make the comparison as fair as possible. This ensured that when printing the test with the stock duct, exactly the same movements were made with the air blowing roughly from the same direction w.r.t. the orientation of the model.
 

![Alt text](https://cdn.thingiverse.com/assets/91/d0/cd/dd/a3/ductalign.jpg)
The duct was designed to be optimal for nozzles that extend 10 mm below the bottom edge of the extruder cradle. If you have custom extruders that extend deeper, I can make a custom duct for you if you can tell me the distance as shown in the photo by moving the bed against the nozzles and then measuring the distance between bed and cradle.

# Updates

## Version 2 (July 27, 2016)

If you printed the first version, you will definitely want to upgrade to this one: the first version directed its air way too much downwards and performed even worse than the stock duct (which also doesn't really produce any appreciable airflow at the height of the nozzle). This new duct should allow to print overhangs that previously ended in disaster, with *both* nozzles. Moreover, it requires less material, making it lighter than the first one.

## Version 3 (October 1, 2016)

This is a minor upgrade from v2, the only differences are that it has thinner walls and other tweaks to require less material, and I modified the bottom to reduce obstruction of the view. I specifically made this version to be printed in PETG. Even though PETG is considerably heavier than ABS, thanks to the weight trimming v3 weighs less in PETG than v2 did in ABS. However, my PETG duct eventually started to melt so I do not recommend it, unless you always enable the fan and print at low temperatures.


## Version 4 (October 15, 2016)

Again small changes, most important is that the exhausts are slightly further away from the heaters, this provides a better directed airflow and lower risk of melting. Also some more weight trimming.



## Version 5 (December 18, 2016)

Added plugs, rounded one of the corners mainly for aesthetic reasons (although it could help a bit to reduce turbulence), also improved airflow where the exhaust joins the main body. Again shaved off a bit of material as well, and tweaked some of the internal structures to reduce the risk that slicer programs will make a mess out of the ‘ceiling’ part.
(Small update December 20th: chamfered the inlet as per suggestion by user FlashErase, to make it easier to install the duct.)

The v2 model is still available, in case you would have problems creating a strong print from the v5 model, but I highly recommend to try printing the v5 first.


## Version 6 (December 30, 2016)

Increased the radius of the front right corner (this really should reduce turbulence), and made other small airflow improvements. Redesigned the exhausts to be larger and better directed, and incorporated small baffles to ensure the air is aimed directly at the nozzles. Also incorporated small details that increase the chance of good bridging. Small bonus: it produces a slight jet engine sound.

Removed the v2 model: the v6 should be so easy to print and is so much better than the v2, that there is no point anymore in allowing people to print this old version. Dropped the plugs as well: they were way too finicky to install and remove, and they caused the fan to spin faster, which could cause it to wear out quickly.

## Version 6r (May 7, 2017)

No functional differences with v6, only some reinforcements have been added around the region where the duct is the weakest. If you have already printed the v6 and do not have problems with it, then there is no reason to print this one.

## Future plans

I plan on creating variations that have a single wider exhaust for either the left or right nozzle only. This would provide more airflow if you're printing with only one nozzle. I have thought about making the exhausts modular to avoid the need for printing an entire duct for each situation, but I cannot think of a system that will be both reliable and practical. The duct uses little material anyway, and swapping it entirely can be done in about 30 seconds with some practice, even without having to remove the hood from the printer.