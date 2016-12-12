function varargout = FLMT(varargin)
% FLMT M-file for FLMT.fig
%      FLMT, by itself, creates a new FLMT or raises the existing
%      singleton*.
%
%      H = FLMT returns the handle to a new FLMT or the handle to
%      the existing singleton*.
%
%      FLMT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FLMT.M with the given input arguments.
%
%      FLMT('Property','Value',...) creates a new FLMT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FLMT_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FLMT_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FLMT

% Last Modified by GUIDE v2.5 21-Oct-2014 02:57:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FLMT_OpeningFcn, ...
                   'gui_OutputFcn',  @FLMT_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% --------------------------------------------------------------------


% --- Executes just before FLMT is made visible.
function FLMT_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FLMT (see VARARGIN)

% Choose default command line output for FLMT
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FLMT wait for user response (see UIRESUME)
% uiwait(handles.FLMT);

% Display the reference face image
axes(handles.axes_ref);
A=imread('ref.jpg');
imshow(A);
%axis image; 
hold on;

% --------------------------------------------------------------------



% --- Executes during object creation, after setting all properties.
function FLMT_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FLMT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --------------------------------------------------------------------

function edit_operator_Callback(hObject, eventdata, handles)
% hObject    handle to edit_operator (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_operator as text
%        str2double(get(hObject,'String')) returns contents of edit_operator as a double


% --- Executes during object creation, after setting all properties.
function edit_operator_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_operator (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --------------------------------------------------------------------

% --- Outputs from this function are returned to the command line.
function varargout = FLMT_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function File_Callback(hObject, eventdata, handles)
% hObject    handle to File (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function m_file_open_Callback(hObject, eventdata, handles)
% hObject    handle to m_file_open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
GUI_LoadFL(hObject, eventdata, handles);


% --------------------------------------------------------------------
function Face_Callback(hObject, eventdata, handles)
% hObject    handle to Face (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function m_face_preview_Callback(hObject, eventdata, handles)
% hObject    handle to m_face_preview (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ShowFaceIMG(hObject, eventdata, handles, -1);


% --------------------------------------------------------------------
function m_face_next_Callback(hObject, eventdata, handles)
% hObject    handle to m_face_next (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ShowFaceIMG(hObject, eventdata, handles, 1);


% --------------------------------------------------------------------
function m_about_Callback(hObject, eventdata, handles)
% hObject    handle to m_about (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function m_file_quit_Callback(hObject, eventdata, handles)
% hObject    handle to m_file_quit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%exit(0);
close(handles.FLMT);

% --------------------------------------------------------------------


% --- Executes on button press in pushbutton_openfl.
function pushbutton_openfl_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_openfl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
GUI_LoadFL(hObject, eventdata, handles);

% --------------------------------------------------------------------

% --- Executes on button press in pushbutton_nextimg.
function pushbutton_nextimg_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_nextimg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ShowFaceIMG(hObject, eventdata, handles, 1);

% --------------------------------------------------------------------

% --- Executes on button press in pushbutton_preimg.
function pushbutton_preimg_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_preimg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ShowFaceIMG(hObject, eventdata, handles, -1);

% --------------------------------------------------------------------

% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function FLMT_WindowButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to Myone (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%global pointXY;
%global hTex;

global ML_Active;

global LM_DATA;
global LM_idx;

global HPoint;
%global HText;

if ( ML_Active == 1)
    %pt = get(gca,'CurrentPoint');
    %pt = get(handles.axes_fig,'CurrentPoint');
    %disp(pt);

    [x, y, v] = ginput(1);
    
    if (x < LM_DATA.IM_WIDTH) && (y < LM_DATA.IM_HEIGHT)
        if LM_idx < LM_DATA.Num
            LM_DATA.XX(LM_idx) = x;
            LM_DATA.YY(LM_idx) = y;
            
            HPoint(LM_idx) = plot(x,y,'.');
            
            %idx_str = sprintf('%d', LM_idx);
            %hText(LM_idx) = text(x+5, y+5, idx_str,'color',[1 0 0]);
            
            LM_idx = LM_idx + 1;
            set(handles.point_idx,'String',LM_idx);
        elseif LM_idx == LM_DATA.Num
            LM_DATA.XX(LM_idx) = x;
            LM_DATA.YY(LM_idx) = y;
            
            HPoint(LM_idx) = plot(x,y,'.');
            
            set(handles.point_idx,'String',LM_idx);
            
            ML_Active = 0;
        else
            fprintf('The Landmark index is out of range!');
            set(handles.point_idx,'String','Out of range!');
        end
    else
        errmsg =fprintf('The Point coordinates ars out of range!');
        set(handles.point_idx,'String','Out of range!');
    end
end



% --------------------------------------------------------------------

function GUI_LoadFL(hObject, eventdata, handles)
% load fl data

global fl_filename 
global fl_pathname

global FL_DATA
global FL_idx;

global ML_Active;

[fl_filename, fl_pathname] = uigetfile( ...
       {'*.fl', 'All Face Image Files List(*.fl)';
        '*.*',  'ALL File(*.*)';}, ...
        'Load Face Image File Name List');
if isequal(fl_filename,0)|| isequal(fl_pathname,0)
    return;
end

[FL_DATA] = load_fl(fl_pathname, fl_filename);
%set(handles.FileListBox,'String',F_Name_Data);

%disp(F_Num);

ML_Active = 0;

FL_idx = 1;
ShowFaceIMG(hObject, eventdata, handles, -1);

% --------------------------------------------------------------------


% --- Executes on button press in lefteye_open.
function lefteye_open_Callback(hObject, eventdata, handles)
% hObject    handle to lefteye_open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of lefteye_open

global LM_DATA;

%LM_DATA.LEFT_EYE: 1 close; 0 open

if get(handles.lefteye_open,'Value')
    LM_DATA.LEFT_EYE = 0;
    set(handles.lefteye_close,'value',0);
else
    LM_DATA.LEFT_EYE = 1;
    set(handles.lefteye_close,'value',1);
end


% --- Executes on button press in lefteye_close.
function lefteye_close_Callback(hObject, eventdata, handles)
% hObject    handle to lefteye_close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of lefteye_close

global LM_DATA;

%LM_DATA.LEFT_EYE: 1 close; 0 open

if get(handles.lefteye_close,'Value')
    LM_DATA.LEFT_EYE = 1;
    set(handles.lefteye_open,'value',0);
else
    LM_DATA.LEFT_EYE = 0;
    set(handles.lefteye_open,'value',1);
end

% --------------------------------------------------------------------


% --- Executes on button press in righteye_open.
function righteye_open_Callback(hObject, eventdata, handles)
% hObject    handle to righteye_open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of righteye_open

global LM_DATA;

%LM_DATA.RIGHT_EYE: 1 close; 0 open

if get(handles.righteye_open,'Value')
    LM_DATA.RIGHT_EYE = 0;
    set(handles.righteye_close,'value',0);
else
    LM_DATA.RIGHT_EYE = 1;
    set(handles.righteye_close,'value',1);
end


% --- Executes on button press in righteye_close.
function righteye_close_Callback(hObject, eventdata, handles)
% hObject    handle to righteye_close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of righteye_close

global LM_DATA;

%LM_DATA.RIGHT_EYE: 1 close; 0 open

if get(handles.righteye_close,'Value')
    LM_DATA.RIGHT_EYE = 1;
    set(handles.righteye_open,'value',0);
else
    LM_DATA.RIGHT_EYE = 0;
    set(handles.righteye_open,'value',1);
end

% --------------------------------------------------------------------


% --- Executes on button press in pushbutton_save_lm_data.
function pushbutton_save_lm_data_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_save_lm_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global LM_DATA;
global IM_Path;

%check the data file
if exist(IM_Path)
    warnmsg = sprintf('The LM Data File %s is existed and will be overwrited!', IM_Path);
    msgbox(warnmsg, 'Warning', 'warn');
end

GetHandleObject(handles);

save_lmdata(LM_DATA, IM_Path);

% --------------------------------------------------------------------


% --- Executes on button press in pushbutton_lmdata_next.
function pushbutton_lmdata_next_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_lmdata_next (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global LM_DATA;
global LM_idx;

if LM_idx < LM_DATA.Num
    LM_idx = LM_idx + 1;
    set(handles.point_idx,'String',LM_idx);
%{else
    warnmsg = fprintf('The Landmark index is out of range!');
    msgbox(warnmsg, 'Warning', 'warn');
    msgbox(warnmsg);
%}
  set(handles.point_idx,'String',warnmsg);
end


% --- Executes on button press in pushbutton_lmdata_pre.
function pushbutton_lmdata_pre_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_lmdata_pre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global LM_DATA;
global LM_idx;

if LM_idx > 1
    LM_idx = LM_idx - 1;
    set(handles.point_idx,'String',LM_idx);
%else
%    warnmsg = fprintf('The Landmark index is out of range!');
    %msgbox(warnmsg, 'Warning', 'warn');
%    msgbox(warnmsg);
    %set(handles.point_idx,'String',warnmsg);    
end

% --------------------------------------------------------------------


% --- Executes on button press in pushbutton_lmpoint_del.
function pushbutton_lmpoint_del_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_lmpoint_del (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global LM_DATA;
global LM_idx;

global HPoint;
%global HText;

if (LM_idx >= 1) && (LM_idx <= LM_DATA.Num)
    delete(HPoint(LM_idx));
    %delete(HText(LM_idx));
else
    warnmsg = fprintf('The Landmark index is out of range!');
    %msgbox(warnmsg, 'Warning', 'warn');
    set(handles.point_idx,'String',warnmsg);    
end

% --------------------------------------------------------------------


% --- Executes during object creation, after setting all properties.

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --------------------------------------------------------------------



% --------------------------------------------------------------------

% --- Executes on button press in use_toggle.
function use_toggle_Callback(hObject, eventdata, handles)
% hObject    handle to use_toggle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global FL_DATA
global ML_Active;

button_state = get(handles.use_toggle,'Value');

%LM_DATA.USE
% 1: use; 0: not use

if button_state == get(handles.use_toggle,'Max')
    LM_DATA.USE = 1;
elseif button_state == get(handles.use_toggle,'Min')
    LM_DATA.USE = 0;
else
    LM_DATA.USE = 0;
end
% Hint: get(hObject,'Value') returns toggle state of use_toggle


% --------------------------------------------------------------------


% --- Executes on button press in active_toggle.
function active_toggle_Callback(hObject, eventdata, handles)
% hObject    handle to active_toggle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global ML_Active;
global LM_DATA;

button_state = get(handles.active_toggle,'Value');

if LM_DATA.USE == 1
    if button_state == get(handles.active_toggle,'Max')
        ML_Active = 1;
    elseif button_state == get(handles.active_toggle,'Min')
        ML_Active = 0;
    else
        ML_Active = 0;
    end
else
    if button_state == get(handles.active_toggle,'Max')
        ML_Active = 0;
        set(handles.active_toggle,'Value',0);
    elseif button_state == get(handles.active_toggle,'Min')
        ML_Active = 0;
        set(handles.active_toggle,'Value',1);
    else
        ML_Active = 0;
        set(handles.active_toggle,'Value',1);
    end    
end

% --------------------------------------------------------------------
