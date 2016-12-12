function [FS_DATA] = InitFSData(Num)
% Creat and Initial the facial landmark data
% 
%

if (Num > 1)
    FS_DATA.FACE_SCORE = zeros(1,Num);
    FS_DATA.FACE_EMOTATION = zeros(1,Num);
    FS_DATA.FACE_TYPE = zeros(1,Num);
    FS_DATA.LEFT_EYE = zeros(1,Num);
    FS_DATA.RIGHT_EYE = zeros(1,Num);
    FS_DATA.MOUTH_TYPE = zeros(1,Num);
else
    disp('Error : the Num is illegal!\n');
end


