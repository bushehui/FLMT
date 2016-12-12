%function save_lmdata(LM_Path, LM_Num,LM_XX,LM_YY)
function save_lmdata(LM_DATA,LM_Path)
% save the facial landmark data to a text file
% 
% LM_Path : Landmark data File path
%
% LM_Num : Landmark data size
% LM_XX  : Landmark data x-axis
% LM_YY  : Landmark data y-axis
%

%i = 0;

s1 = size(LM_DATA.XX);
s2 = size(LM_DATA.YY);

if s1(2) == s2(2)
    %LM_DATA.Num = s1(2);
else
    LM_DATA.Num = max(s1(2),s2(2));
end

LM_DATA.Path=Get_ABSPATH(LM_Path);
disp(LM_Path);
disp(LM_DATA.Path);

%fid = fopen(LM_DATA.Path,'wt');
fid = fopen(LM_Path,'wt');

fprintf(fid,'#name=%s\n',LM_DATA.Path);

fprintf(fid,'#operator=%s\n',LM_DATA.Operator);

fprintf(fid,'#num=%d\n',LM_DATA.Num);

fprintf(fid,'#score=%d\n',LM_DATA.SCORE);

fprintf(fid,'#use=%d\n',LM_DATA.USE);
%LM_DATA.USE
% 1: use; 0: not use

fprintf(fid,'#face_emotation=%d\n',LM_DATA.FACE_EMOTATION);
%LM_DATA.FACE_EMOTATION:
%0:default; 1:smile; 2:cry; 3:angry; 4:fear; 5:sorrow

fprintf(fid,'#face_type=%d\n',LM_DATA.FACE_TYPE);
%LM_DATA.FACE_TYPE:
%0:default; 1:cute; 2:cool; 3:smart; 4:normal; 5:others

fprintf(fid,'#mouth_type=%d\n',LM_DATA.MOUTH_TYPE);
%LM_DATA.MOUTH_TYPE:
%0:close; 1:open; 2:moddle

fprintf(fid,'#left_eye=%d\n',LM_DATA.LEFT_EYE);
%LM_DATA.LEFT_EYE:
%1:close; 0:open

fprintf(fid,'#right_eye=%d\n',LM_DATA.RIGHT_EYE);
%LM_DATA.RIGHT_EYE:
%1:close; 0:open

fprintf(fid,'#im_width=%d\n',LM_DATA.IM_WIDTH);

fprintf(fid,'#im_height=%d\n',LM_DATA.IM_HEIGHT);

fprintf(fid,'#ver=%d\n',LM_DATA.VER);


for i = 1:LM_DATA.Num
    fprintf(fid,'@%d %d %d\n',i,LM_DATA.XX(i),LM_DATA.YY(i));
end

fclose(fid);

% --------------------------------------------------------------------


