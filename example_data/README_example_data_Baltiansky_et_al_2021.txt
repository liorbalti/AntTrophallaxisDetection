Example data for trophallaxis detection.
Related to the manuscripte:
"Dual fluorescence imaging and automated trophallaxis detection for studying multinutrient regulation in superorganisms"
Methods in Ecology and Evolution 2021
Authors: Lior Baltiansky, Einav Sarafian-Tamam, Efrat Greenwald and Ofer Feinerman
Department of Physics of Complex Systems, Weizmann Institute of Science, Rehovot, Israel.

---------
Contents:
---------


1. Raw_video_for_example.avi - a short video (6 frames) from a food sharing experiment with tagged Camponotus sanctus ants.

--------------------------------------------------------------------------------------

2. Tagged_video_for_example.avi - the short raw video with overlaid ant IDs as outputed by the BugTag software.

--------------------------------------------------------------------------------------

3. Bugtag_data_for_example.csv - a table containing spatial data on tag detections as outputed by the BugTag software.
Columns:
	- frame # - number of frame in video.
	- recogintions - total number of detected tags in the frame.
	For every tag number 'a':
	- a-x - the x coordinate of tag 'a' in the frame
	- a-y - the y coordinate of tag 'a' in the frame
	- a-angle - the angle of thag 'a' in the frame (in degrees)
	- a-error - an index indicated the certainty of the detection (0-best, 5-worst).
A value of '-1' in the columns of a tag indicate that this tag was not detected in the frame.