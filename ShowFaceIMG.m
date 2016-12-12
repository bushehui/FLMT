function ShowFaceIMG(hObject, eventdata, handles, PMSymbol)
%show the face image

global FL_DATA;
global FL_idx;

global LM_idx;
global LM_DATA

global ML_Active;

global HPoint;
%global HText;


hold off;

ML_Active = 0;

% Get the Facial Image File index
if (PMSymbol == -1)
    if (FL_idx == 1)
        %printf('The first file');
        FL_idx = 1;
    else
        FL_idx = FL_idx - 1;
    end
else
    if (FL_idx == FL_DATA.F_Num)
        FL_idx = FL_DATA.F_Num;
    else
        FL_idx = FL_idx + 1;
    end
end

% Dispaly the file name
set(handles.imgfile_name,'String',FL_DATA.F_Name_Data{FL_idx});

% Show the facial image
%img_path = [FL_DATA.F_Dir FL_DATA.F_Name_Data{FL_idx}];
img_path = fullfile(FL_DATA.F_Dir, FL_DATA.F_Name_Data{FL_idx});

axes(handles.axes_fig);

FACE_IMG = imread(img_path);
imshow(FACE_IMG);
axis image;
hold on;

% Initial the landmark point index and the data
LM_idx = 1;

LM_DATA = InitLMData();
LM_DATA.Operator = FL_DATA.Operator;

s = size(FACE_IMG);

LM_DATA.IM_HEIGHT = s(1);
LM_DATA.IM_WIDTH  = s(2);

HPoint = zeros(LM_DATA.Num);
%HText  = zeros(LM_DATA.Num);

% Initial the landmark point index and the data
%LM_Path = sprintf('%s%s.lm',FL_DATA.F_Dir,FL_DATA.F_Name_Data{FL_idx});
LM_Path = sprintf('%s.lm',img_path);

if exist(LM_Path)
    LM_DATA = load_lmdata(LM_Path);
    
    for idx = 1:LM_DATA.Num
        x = LM_DATA.XX(idx);
        y = LM_DATA.YY(idx);
        
        HPoint(idx) = plot(x,y,'.');
    
    end
    %LM_idx = LM_DATA.Num;
end

if ishandle(handles.point_idx)
    set(handles.point_idx,'String',LM_idx);
end

%set the radiobutton
SetHandleObject(handles)

