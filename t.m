clear all;
clc;

%FL_Path = '~/Downloads/Face/FaceImg/';
FL_Path = '~/Downloads/FaceImage/';
FL_Fn = 't.fl';

%disp(FL_Path);

FL_DATA = load_fl(FL_Path, FL_Fn);



%{
in_fi  = '~/Downloads/FaceImage/3.jpg';
in_flm = '~/Downloads/FaceImage/3.jpg.lm';

res_fi  = 't.jpg';
res_flm = 't.jpg.lm';

modify_fi(in_fi,in_flm,res_fi,res_flm);
%}


