%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#人工Landmark point标注工具
flmt.fig
flmt.m

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

＃人脸打分工具
fst.fig
fst.m

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

＃利用face++来得到人脸的Landmark point
facepp_lm.m
% function facepp_lm(FL_Fn,st_idx)
% Face++ application for the Landmark of the face features
% FL_Fn  : file list
% st_idx : start index of the list

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

creat_fl.m
% Creat the File list in the given file path
% function [imgfilelist] = creat_fl(FL_DIR, FL_Fn)

load_fl.m
% function [FL_DATA] = load_fl(FL_Path, FL_Fn)
% Load the facial image file name
 
split_fl.m
% function split_fl(FL_Fn, SFL_Fn, MaxNum_sf)
% splite the files into several files 
% FL_FN  : Original file name of the total file list
% SFL_FN : Split file name
% MaxNum_sf: max num of the files for created file lsit

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

load_fsl.m
% function [FL_DATA, FS_DATA] = load_fsl(FL_Path, FL_Fn)
% Load the facial score data

save_fsl.m
＃

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

initfsdata.m
% function [FS_DATA] = InitFSData(Num)
% Creat and Initial the facial landmark data


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
load_lmdata.m
＃function [LM_DATA] = load_lmdata(LM_Path)
% Load the facial image file name
% 
% LM_Path : Landmark data File path
% LM_DATA : Landmark data

save_lmdata.m
% function save_lmdata(LM_DATA,LM_Path)
% save the facial landmark data to a text file
% 
% LM_Path : Landmark data File path
% LM_DATA : Landmark data

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

initlmdata.m
% function [LM_DATA] = InitLMData()
% Creat and Initial the facial landmark data

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

modify_fi.m
＃

norm_fi.m
＃

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

get_abspath.m
＃

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

"landmark": 83 Points

1:"contour_chin": {"x": 46.414878,"y": 57.787805},
2:"contour_left1": {"x": 29.173415,"y": 34.049268},
3:"contour_left2": {"x": 29.64878,"y": 37.368293},
4:"contour_left3": {"x": 30.460244,"y": 40.832195},
5:"contour_left4": {"x": 31.672683,"y": 44.194146},
6:"contour_left5": {"x": 32.764878,"y": 47.36122},
7:"contour_left6": {"x": 34.497073,"y": 50.051951},
8:"contour_left7": {"x": 36.669024,"y": 52.966341},
9:"contour_left8": {"x": 39.232195,"y": 55.297805},
10:"contour_left9": {"x": 42.444634,"y": 57.212927},
11:"contour_right1": {"x": 62.625366,"y": 29.352195},
12:"contour_right2": {"x": 63.308049,"y": 33.364146},
13:"contour_right3": {"x": 63.534878,"y": 37.223659},
14:"contour_right4": {"x": 63.783171,"y": 41.228537},
15:"contour_right5": {"x": 63.134146,"y": 45.31561},
16:"contour_right6": {"x": 61.216585,"y": 48.963171},
17:"contour_right7": {"x": 58.397317,"y": 51.92878},
18:"contour_right8": {"x": 55.259024,"y": 54.796341},
19:"contour_right9": {"x": 51.476098,"y": 56.856341},
20:"left_eye_bottom": {"x": 35.253171,"y": 34.098293},
21:"left_eye_center": {"x": 35.399512,"y": 33.256585},
22:"left_eye_left_corner": {"x": 32.066098,"y": 33.522927},
23:"left_eye_lower_left_quarter": {"x": 33.68878,"y": 33.95878},
24:"left_eye_lower_right_quarter": {"x": 37.243171,"y": 33.611707},
25:"left_eye_pupil": {"x": 36.033902,"y": 32.567317},
26:"left_eye_right_corner": {"x": 39.17878,"y": 33.430732},
27:"left_eye_top": {"x": 35.139024,"y": 31.793171},
28:"left_eye_upper_left_quarter": {"x": 33.525122,"y": 32.384146},
29:"left_eye_upper_right_quarter": {"x": 36.961707,"y": 32.17122},
30:"left_eyebrow_left_corner": {"x": 29.242439,"y": 30.029268},
31:"left_eyebrow_lower_left_quarter": {"x": 31.008537,"y": 29.34561},
32:"left_eyebrow_lower_middle": {"x": 33.326341,"y": 29.742439},
33:"left_eyebrow_lower_right_quarter": {"x": 35.683659,"y": 30.21439},
34:"left_eyebrow_right_corner": {"x": 38.099756,"y": 30.421463},
35:"left_eyebrow_upper_left_quarter": {"x": 30.958049,"y": 28.006585},
36:"left_eyebrow_upper_middle": {"x": 33.423902,"y": 28.449024},
37:"left_eyebrow_upper_right_quarter": {"x": 35.770244,"y": 29.02439},
38:"mouth_left_corner": {"x": 39.00878,"y": 48.307073},
39:"mouth_lower_lip_bottom": {"x": 44.716341,"y": 51.013415},
40:"mouth_lower_lip_left_contour1": {"x": 41.912683,"y": 48.465366},
41:"mouth_lower_lip_left_contour2": {"x": 40.593171,"y": 49.719756},
42:"mouth_lower_lip_left_contour3": {"x": 42.557561,"y": 50.880488},
43:"mouth_lower_lip_right_contour1": {"x": 47.794146,"y": 47.52561},
44:"mouth_lower_lip_right_contour2": {"x": 49.760732,"y": 48.358293},
45:"mouth_lower_lip_right_contour3": {"x": 47.286098,"y": 49.999024},
46:"mouth_lower_lip_top": {"x": 44.623902,"y": 48.608049},
47:"mouth_right_corner": {"x": 51.676829,"y": 46.061951},
48:"mouth_upper_lip_bottom": {"x": 44.450732,"y": 47.92122},
49:"mouth_upper_lip_left_contour1": {"x": 42.67439,"y": 46.402683},
50:"mouth_upper_lip_left_contour2": {"x": 40.511463,"y": 47.345366},
51:"mouth_upper_lip_left_contour3": {"x": 42.039512,"y": 48.049268},
52:"mouth_upper_lip_right_contour1": {"x": 45.329512,"y": 46.045854},
53:"mouth_upper_lip_right_contour2": {"x": 48.429024,"y": 46.085854},
54:"mouth_upper_lip_right_contour3": {"x": 47.760976,"y": 47.101707},
55:"mouth_upper_lip_top": {"x": 44.161707,"y": 46.606098},
56:"nose_contour_left1": {"x": 40.480488,"y": 32.890244},
57:"nose_contour_left2": {"x": 39.550244,"y": 39.207561},
58:"nose_contour_left3": {"x": 41.082439,"y": 43.290976},
59:"nose_contour_lower_middle": {"x": 42.997073,"y": 43.409756},
60:"nose_contour_right1": {"x": 44.614146,"y": 32.492683},
61:"nose_contour_right2": {"x": 46.087317,"y": 38.35},
62:"nose_contour_right3": {"x": 45.39878,"y": 42.754634},
63:"nose_left": {"x": 39.161951,"y": 42.39878},
64:"nose_right": {"x": 47.571951,"y": 41.289756},
65:"nose_tip": {"x": 41.650244,"y": 40.774146},
66:"right_eye_bottom": {"x": 51.453415,"y": 31.899024},
67:"right_eye_center": {"x": 50.970244,"y": 31.204634},
68:"right_eye_left_corner": {"x": 47.382439,"y": 32.167317},
69:"right_eye_lower_left_quarter": {"x": 49.356341,"y": 31.962927},
70:"right_eye_lower_right_quarter": {"x": 53.292439,"y": 31.13561},
71:"right_eye_pupil": {"x": 51.460732,"y": 30.57561},
72:"right_eye_right_corner": {"x": 55.089756,"y": 30.516829},
73:"right_eye_top": {"x": 50.842927,"y": 29.673415},
74:"right_eye_upper_left_quarter": {"x": 49.186585,"y": 30.526341},
75:"right_eye_upper_right_quarter": {"x": 52.834146,"y": 29.780732},
76:"right_eyebrow_left_corner": {"x": 45.671707,"y": 29.460732},
77:"right_eyebrow_lower_left_quarter": {"x": 48.697805,"y": 28.473171},
78:"right_eyebrow_lower_middle": {"x": 51.362439,"y": 27.44439},
79:"right_eyebrow_lower_right_quarter": {"x": 54.367317,"y": 26.657805},
80:"right_eyebrow_right_corner": {"x": 57.113902,"y": 26.924878},
81:"right_eyebrow_upper_left_quarter": {"x": 48.366585,"y": 27.347073},
82:"right_eyebrow_upper_middle": {"x": 50.99439,"y": 26.087805},
83:"right_eyebrow_upper_right_quarter": {"x": 54.373659,"y": 25.471951}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

handles:

% FACE_EMOTATION: 0 default; 1 smile; 2 cry; 3 angry; 4 fear; 5 sorrow
faceemotion_default
faceemotion_smile
faceemotion_cry
faceemotion_angry
faceemotion_fear
faceemotion_sorrow

% FACE_TYPE: 0 default; 1 cute; 2 cool; 3 smart; 4 normal; 5 others
facetype_default
facetype_cute
facetype_cool
facetype_smart
facetype_normal
facetype_other

% LEFT_EYE: 1 close; 0 open
lefteye_open
lefteye_close

% RIGHT_EYE: 1 close; 0 open
righteye_open
righteye_close

% MOUTH_TYPE: 0 close; 1 open; 2 moddle
mouth_close
mouth_open
mouth_middle

% Face Score : 1 (worst) ~ 5 (best)
facescore_1
facescore_2
facescore_3
facescore_4
facescore_5

edit_operator

%USE : 1 use; 0 not use
use_toggle

active_toggle

point_idx


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



