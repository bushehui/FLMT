function [FL_DATA, FS_DATA] = load_fsl(FL_Path, FL_Fn)
% Load the facial score data
% 
%

FL_DATA.F_Dir = '';
FL_DATA.Operator = '';
FL_DATA.Ver = 0;
FL_DATA.F_Num = 0;
FL_DATA.F_Name_Data = {};

FS_DATA.FACE_EMOTATION = {};
FS_DATA.FACE_TYPE = {};
FS_DATA.LEFT_EYE = {};
FS_DATA.RIGHT_EYE = {};
FS_DATA.MOUTH_TYPE = {};
FS_DATA.FACE_SCORE = {};

%LM_DATA.FACE_EMOTATION: 0 default; 1 smile; 2 cry; 3 angry; 4 fear; 5 sorrow
%LM_DATA.FACE_TYPE: 0 default; 1 cute; 2 cool; 3 smart; 4 normal; 5 others
%LM_DATA.LEFT_EYE: 1 close; 0 open
%LM_DATA.RIGHT_EYE: 1 close; 0 open
%LM_DATA.MOUTH_TYPE: 0 close; 1 open; 2 moddle
%Face_Score : 1 (worst) ~ 5 (best)


if (strcmp(FL_Path,'.'))
    disp(FL_Path);
end

fid = fopen(FL_Fn,'rt');

i = 0;

while (feof(fid) == 0) 
    tline = fgetl(fid);
    d = size(tline);
    
    if (tline(1) == '#')
        p = findstr(tline, '=');
        
        if (strcmp(tline(2:p-1),'name'))
            %disp(tline(p-1:d(2)));
            
        elseif (strcmp(tline(2:p-1),'dir'))
            %disp(tline(p-1:d(2)));
            FL_DATA.F_Dir = tline(p+1:d(2));

        elseif (strcmp(tline(2:p-1),'operator'))
            %disp(tline(p-1:d(2)));
            FL_DATA.Operator = tline(p+1:d(2));
            
        elseif (strcmp(tline(2:p-1),'num'))
            %disp(tline(p-1:d(2)));
            FL_DATA.F_Num = str2num(tline(p+1:d(2)));
            
            FS_DATA.FACE_EMOTATION = zeros(FL_DATA.F_Num,1);
            FS_DATA.FACE_TYPE = zeros(FL_DATA.F_Num,1);
            FS_DATA.LEFT_EYE = zeros(FL_DATA.F_Num,1);
            FS_DATA.RIGHT_EYE = zeros(FL_DATA.F_Num,1);
            FS_DATA.MOUTH_TYPE = zeros(FL_DATA.F_Num,1);
            FS_DATA.FACE_SCORE = zeros(FL_DATA.F_Num,1);
            
        elseif (strcmp(tline(2:p-1),'ver'))
            %disp(tline(p-1:d(2)));
            FL_DATA.Ver = str2num(tline(p+1:d(2)));
        
        end
        
    elseif (tline(1) == '@')
        i = i + 1;
        
        p = findstr(tline, ' ');
        
        FL_DATA.F_Name_Data{i} = tline(2:p(1)-1);
        
        numlist = str2num(tline(p(1)+1:d(2)));
        
        FS_DATA.FACE_SCORE(i) = numlist(1);
        FS_DATA.FACE_EMOTATION(i) = numlist(2);
        FS_DATA.FACE_TYPE(i) = numlist(3);
        FS_DATA.LEFT_EYE(i) = numlist(4);
        FS_DATA.RIGHT_EYE(i) = numlist(5);
        FS_DATA.MOUTH_TYPE(i) = numlist(6);
    end
end


fclose(fid);


if (i ~= FL_DATA.F_Num) 
    disp('Error : the num is incorrect!');
end


