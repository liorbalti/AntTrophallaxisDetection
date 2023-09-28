% load network and video
load('TrophNet.mat');
raw_vid = VideoReader(fullfile('example_data', 'Raw_video_for_example.avi'));
tagged_vid = VideoReader(fullfile('example_data', 'Tagged_video_for_example.avi'));
bugtag_data = readtable(fullfile('example_data', 'Bugtag_data_for_example.csv'));

% define and create directory to save output
output_dir = 'trophallaxis_detection_output';
mkdir(output_dir)

% define ROI
[roiRect, leftEdges, upEdges] = get_roi_for_trophallaxis_detection(raw_vid,output_dir);

% detect trophallaxis
disp('detecting trophallaxis in video')
set(raw_vid,'CurrentTime',0);
[BBoxes, Scores] = detect_trophallaxis(TrophNet,raw_vid,output_dir,roiRect,leftEdges,upEdges);

% create event list
disp('creating list of trophallaxis events')
outfile = fullfile(output_dir,'trophallaxis_table.csv');
event_table = generate_trophallaxis_event_list(BBoxes,Scores,bugtag_data,roiRect,outfile);

% create video with overlaid detections
disp('creating video with overlaid trophallaxis detections')
generate_trophallaxis_detection_video(tagged_vid,BBoxes,Scores,roiRect,output_dir,'example_detection_video.avi',false)

