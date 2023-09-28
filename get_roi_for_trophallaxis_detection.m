function [roiRect, leftEdges, upEdges] = get_roi_for_trophallaxis_detection(video,outpath,l,d)
% GET_ROI_FOR_TROPHALLAXIS_DETECTION - define ROI to search for trophallaxis
% Interactive function to: 
%   1. define the boundaries within which to search for trophallaxis in the 
%      frame (for example - region which contains the nest).
%   2. define the coordinates of small squares that tile the ROI with length l
%      and stride d. These squares will be cropped from every frame in the video 
%      to be classified by the trophallaxis detection network. 
%
% Syntax:  [roiRect, leftEdges, upEdges] = get_roi_for_trophallaxis_detection(video,outpath,l,d)
%
% Inputs:
%   video    - a VideoReader object for the video in which to detect trophallaxis
%   outpath  - string of the path to a directory where the output will be saved
%   l        - (optional) integer indicating the length of the tile square edge (default 175)
%   d        - (optional) integer indicating the stride of the tiling squares,
%              i.e. the distance between square centroids (default 80)
%
% Outputs:
%   roiRect    - a 4-element numeric vector indicating the size and position of
%                 the ROI, in the form [xmin ymin width height]
%   leftEdges  - a matrix containing all 'xmin's of the tiling squares.
%   upEdges    - a matrix containing all 'ymin's of the tiling squares.
%


%------------- BEGIN CODE --------------

if nargin < 3
    l = 175; % length of square edge
    d = 80; % distance between square centroids
end

% get nest ROI from video
I1 = rgb2gray(readFrame(video));
h = figure; imshow(imadjust(I1,[0,90/256])); 
title('Draw/drag/resize rectangle to define region for trophallaxis detection. Double-click or press "enter" to finish.')
[Inest1, roiRect] = imcrop(h);
close

% get coordinates of squares to crop from every image and send to detection network
[h,w] = size(Inest1);
y_centers = ceil(l/2):d:(h-floor(l/2));
x_centers = ceil(l/2):d:(w-floor(l/2));
[X_centers, Y_centers] = meshgrid(x_centers,y_centers);
leftEdges = X_centers-l/2;
upEdges = Y_centers-l/2;

save(fullfile(outpath, 'roi_data.mat'),'roiRect','leftEdges','upEdges')

end
%------------- END OF CODE --------------