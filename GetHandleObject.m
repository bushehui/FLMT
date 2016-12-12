function GetHandleObject(handles)
%Get the radiobutton value

global LM_DATA;
global ML_Active;

%LM_DATA.FACE_EMOTATION: 0 default; 1 smile; 2 cry; 3 angry; 4 fear; 5 sorrow
if get(handles.faceemotion_default,'Value')
    LM_DATA.FACE_EMOTATION = 0;
elseif get(handles.faceemotion_smile,'Value')
    LM_DATA.FACE_EMOTATION = 1;
elseif get(handles.faceemotion_cry,'Value')
    LM_DATA.FACE_EMOTATION = 2;
elseif get(handles.faceemotion_angry,'Value')
    LM_DATA.FACE_EMOTATION = 3;
elseif get(handles.faceemotion_fear,'Value')
    LM_DATA.FACE_EMOTATION = 4;
elseif get(handles.faceemotion_sorrw,'Value')
    LM_DATA.FACE_EMOTATION = 5;
else
    LM_DATA.FACE_EMOTATION = 0;
end

%LM_DATA.FACE_TYPE: 0 default; 1 cute; 2 cool; 3 smart; 4 normal; 5 others
if get(handles.facetype_default,'Value')
    LM_DATA.FACE_TYPE = 0;
elseif get(handles.facetype_cute,'Value')
    LM_DATA.FACE_TYPE = 1;
elseif get(handles.facetype_cool,'Value')
    LM_DATA.FACE_TYPE = 2;
elseif get(handles.facetype_smart,'Value')
    LM_DATA.FACE_TYPE = 3;
elseif get(handles.facetype_normal,'Value')
    LM_DATA.FACE_TYPE = 4;
elseif get(handles.facetype_others,'Value')
    LM_DATA.FACE_TYPE = 5;
else
    LM_DATA.FACE_TYPE = 0;
end

%LM_DATA.LEFT_EYE: 1 close; 0 open
if get(handles.lefteye_close,'Value')
    LM_DATA.LEFT_EYE = 1;
else 
    LM_DATA.LEFT_EYE = 0;
end

%LM_DATA.RIGHT_EYE: 1 close; 0 open
if get(handles.righteye_close,'Value')
    LM_DATA.RIGHT_EYE = 1;
else 
    LM_DATA.RIGHTT_EYE = 0;
end

%LM_DATA.MOUTH_TYPE: 0 close; 1 open; 2 moddle
if get(handles.mouth_close,'Value')
    LM_DATA.MOUTH_TYPE = 0;
elseif get(handles.mouth_open,'Value')
    LM_DATA.MOUTH_TYPE = 1;
elseif get(handles.mouth_middle,'Value')
    LM_DATA.MOUTH_TYPE = 2;
else
    LM_DATA.MOUTH_TYPE = 0;
end

% Face Score : 1 (worst) ~ 5 (best)
if get(handles.facescore_1,'Value')
    LM_DATA.SCORE = 1;
elseif get(handles.facescore_2,'Value')
    LM_DATA.SCORE = 2;
elseif get(handles.facescore_3,'Value')
    LM_DATA.SCORE = 3;
elseif get(handles.facescore_4,'Value')
    LM_DATA.SCORE = 4;
elseif get(handles.facescore_5,'Value')
    LM_DATA.SCORE = 5;
else
    LM_DATA.SCORE = 0;
end

LM_DATA.Operator = get(handles.edit_operator,'String');

%LM_DATA.USE : 1 use; 0 not use
%if ishandle(handles.use_toggle)
    button_state = get(handles.use_toggle,'Value');
    if button_state == get(handles.use_toggle,'Max')
        LM_DATA.USE = 1;
    elseif button_state == get(handles.use_toggle,'Min')
        LM_DATA.USE = 0;
    else
        LM_DATA.USE = 0;
    end
%end

%if ishandle(handles.active_toggle)
    button_state = get(handles.active_toggle,'Value');
    if button_state == get(handles.active_toggle,'Max')
        ML_Active = 1;
    elseif button_state == get(handles.active_toggle,'Min')
        ML_Active = 0;
    else
        ML_Active = 0;
    end
%end


