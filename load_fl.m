%function [F_Dir, F_Num, F_Name_Data] = load_fl(FL_Path, FL_Fn)
function [FL_DATA] = load_fl(FL_Path, FL_Fn)
% Load the facial image file name
% 
%

FL_DATA.F_Dir = '';
FL_DATA.Operator = '';
FL_DATA.Ver = 0;
FL_DATA.F_Num = 0;
FL_DATA.F_Name_Data = {};


if (strcmp(FL_Path,'.'))
    disp(FL_Path);
end


%fprintf('Open file : %s\n', FL_Fn);

FileName = fullfile(FL_Path, FL_Fn);

if exist(FileName, 'file')
    fid = fopen(FileName,'rt');
end

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
            %FL_DATA.F_Dir = FL_Path;

        elseif (strcmp(tline(2:p-1),'operator'))
            %disp(tline(p-1:d(2)));
            FL_DATA.Operator = tline(p+1:d(2));
            
        elseif (strcmp(tline(2:p-1),'num'))
            %disp(tline(p-1:d(2)));
            FL_DATA.F_Num = str2num(tline(p+1:d(2)));
            
        elseif (strcmp(tline(2:p-1),'ver'))
            %disp(tline(p-1:d(2)));
            FL_DATA.Ver = str2num(tline(p+1:d(2)));
        
        end
        
    elseif (tline(1) == '@')
        %disp(tline(2:d(2)));
        i = i + 1;
        FL_DATA.F_Name_Data{i} = tline(2:d(2));
    end
end


fclose(fid);


if (i ~= FL_DATA.F_Num) 
    disp('Error : the num is incorrect!');
end



%disp(F_Dir);
%disp(F_Num);
%disp(F_Name_Data);


