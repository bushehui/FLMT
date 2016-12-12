function varargout = FST(varargin)
% FST MATLAB code for FST.fig
%      FST, by itself, creates a new FST or raises the existing
%      singleton*.
%
%      H = FST returns the handle to a new FST or the handle to
%      the existing singleton*.
%
%      FST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FST.M with the given input arguments.
%
%      FST('Property','Value',...) creates a new FST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FST_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FST_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FST

% Last Modified by GUIDE v2.5 19-Oct-2014 08:35:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FST_OpeningFcn, ...
                   'gui_OutputFcn',  @FST_OutputFcn, ...
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


% --- Executes just before FST is made visible.
function FST_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FST (see VARARGIN)

% Choose default command line output for FST
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FST wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = FST_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --------------------------------------------------------------------

% --- Executes on button press in open_fl.
function open_fl_Callback(hObject, eventdata, handles)
% hObject    handle to open_fl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global FL_DATA

GUI_LoadFL(hObject, eventdata, handles);

set(handles.edit_operator,'String',FL_DATA.Operator);


% --------------------------------------------------------------------

% --- Executes on button press in next_img.
function next_img_Callback(hObject, eventdata, handles)
% hObject    handle to next_img (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

GetHandleObject(handles)

ShowFaceIMG(hObject, eventdata, handles, 1);

SetHandleObject(handles)


% --- Executes on button press in pre_img.
function pre_img_Callback(hObject, eventdata, handles)
% hObject    handle to pre_img (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

GetHandleObject(handles)

ShowFaceIMG(hObject, eventdata, handles, -1);

SetHandleObject(handles)

% --------------------------------------------------------------------

% --- Executes on button press in save_res.
function save_res_Callback(hObject, eventdata, handles)
% hObject    handle to save_res (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fl_filename;
global fs_filename;
global fl_pathname;

global FL_DATA
global FS_DATA

FL_DATA.Operator = get(handles.edit_operator,'String');

save_fsl(FL_DATA, FS_DATA,fs_filename);


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

function imgfile_name_Callback(hObject, eventdata, handles)
% hObject    handle to imgfile_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of imgfile_name as text
%        str2double(get(hObject,'String')) returns contents of imgfile_name as a double


% --- Executes during object creation, after setting all properties.
function imgfile_name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to imgfile_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --------------------------------------------------------------------

function GUI_LoadFL(hObject, eventdata, handles)
% load fl data

global FL_DATA
global FS_DATA

global FL_idx;

global fl_filename;
global fs_filename;
global fl_pathname;

[tmp_filename, fl_pathname] = uigetfile( ...
       {'*.fl', 'All Face Image Files List(*.fl)'; 
        '*.fsl', 'Face Score Results List(*.fsl)';}, ...
        'Load Face Image File Name List');
if isequal(tmp_filename,0)|| isequal(fl_pathname,0)
    return;
end

[path_str, name_str, ext_str] = fileparts(tmp_filename);

if strcmp(ext_str,'.fl')
    fl_filename = tmp_filename;
    
    tmp_fsname = strcat(name_str,'.fsl');
    fs_filename = fullfile(path_str,tmp_fsname);
    
    [FL_DATA] = load_fl(fl_pathname, fl_filename);
    [FS_DATA] = InitFSData(FL_DATA.F_Num);
else
    fs_filename = tmp_filename;
    
	[FL_DATA, FS_DATA] = load_fsl(fl_pathname, fs_filename);
end


FL_idx = 1;

ShowFaceIMG(hObject, eventdata, handles, -1);

SetHandleObject(handles)


% --------------------------------------------------------------------
% --------------------------------------------------------------------
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
