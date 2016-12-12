%function [LM_Num,LM_XX,LM_YY] = load_lmdata(LM_Path)
function [LM_DATA] = load_lmdata(LM_Path)
% Load the facial image file name
% 
% LM_Path : Landmark data File path
%
% LM_Num : Landmark data size
% LM_XX  : Landmark data x-axis
% LM_YY  : Landmark data y-axis
%

%Initial the LM data
LM_DATA = InitLMData();


%i = 0;

fid = fopen(LM_Path,'rt');

while (feof(fid) == 0) 
    tline = fgetl(fid);
    d = size(tline);

    if (tline(1) == '#')
        p = findstr(tline, '=');
        
        if (strcmp(tline(2:p-1),'name'))
            %disp(tline(p-1:d(2)));
            LM_DATA.Path = tline(p+1:d(2));


        elseif (strcmp(tline(2:p-1),'operator'))
            %disp(tline(p-1:d(2)));
            LM_DATA.Operator = tline(p+1:d(2));

        elseif (strcmp(tline(2:p-1),'num'))
            %disp(tline(p-1:d(2)));
            LM_DATA.Num = str2num(tline(p+1:d(2)));

            if LM_DATA.Num < 52
                LM_DATA.Num = 52;
            end

            LM_DATA.XX = zeros(LM_DATA.Num,1);
            LM_DATA.YY = zeros(LM_DATA.Num,1);
            %i = 0;
        elseif (strcmp(tline(2:p-1),'use'))
            LM_DATA.USE = str2num(tline(p+1:d(2)));
            
            
        elseif (strcmp(tline(2:p-1),'score'))
            %disp(tline(p-1:d(2)));
            LM_DATA.SCORE = str2num(tline(p+1:d(2)));

            if LM_DATA.SCORE > 5
                LM_DATA.SCORE = 5;
            elseif LM_DATA.SCORE < 0
                LM_DATA.SCORE = 0;
            end


        elseif (strcmp(tline(2:p-1),'face_emotation'))
            %LM_DATA.FACE_EMOTATION:
            %0:default; 1:smile; 2:cry; 3:angry; 4:fear; 5:sorrow
            LM_DATA.FACE_EMOTATION = str2num(tline(p+1:d(2)));
            %disp(tline(p-1:d(2)));

        elseif (strcmp(tline(2:p-1),'face_type'))
            %LM_DATA.FACE_TYPE:
            %0:default; 1:cute; 2:cool; 3:smart; 4:normal; 5:others
            LM_DATA.FACE_TYPE = str2num(tline(p+1:d(2)));
            %disp(tline(p-1:d(2)));

        elseif (strcmp(tline(2:p-1),'mouth_type'))
            %LM_DATA.MOUTH_TYPE:
            %0:close; 1:open; 2:moddle
            LM_DATA.MOUTH_TYPE = str2num(tline(p+1:d(2)));
            %disp(tline(p-1:d(2)));

        elseif (strcmp(tline(2:p-1),'left_eye'))
            %LM_DATA.LEFT_EYE:
            %1:close; 0:open
            LM_DATA.LEFT_EYE = str2num(tline(p+1:d(2)));
            %disp(tline(p-1:d(2)));

        elseif (strcmp(tline(2:p-1),'right_eye'))
            %LM_DATA.RIGHT_EYE:
            %1:close; 0:open
            LM_DATA.RIGHT_EYE = str2num(tline(p+1:d(2)));
            %disp(tline(p-1:d(2)));
        
        elseif (strcmp(tline(2:p-1),'im_width'))
            LM_DATA.IM_WIDTH = str2num(tline(p+1:d(2)));
            %disp(tline(p-1:d(2)));

        elseif (strcmp(tline(2:p-1),'im_height'))
            LM_DATA.IM_HEIGHT = str2num(tline(p+1:d(2)));
            %disp(tline(p-1:d(2)));

        elseif (strcmp(tline(2:p-1),'ver'))
            %Landmark data file fomart version
            LM_DATA.VER = str2num(tline(p+1:d(2)));
            %disp(tline(p-1:d(2)));

        end

    elseif (tline(1) == '@')
        %disp(tline(2:d(2)));

        numlist = str2num(tline(2:d(2)));

        idx = numlist(1);
        LM_DATA.XX(idx) = numlist(2);
        LM_DATA.YY(idx) = numlist(3);
    end
end

fclose(fid);


