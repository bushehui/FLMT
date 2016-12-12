function SetHandleObject(handles)

global LM_DATA;
global ML_Active;

%LM_DATA.FACE_EMOTATION: 0 default; 1 smile; 2 cry; 3 angry; 4 fear; 5 sorrow
if LM_DATA.FACE_EMOTATION == 0
    set(handles.faceemotion_default,'value',1);
    set(handles.faceemotion_smile,'value',0);
    set(handles.faceemotion_cry,'value',0);
    set(handles.faceemotion_angry,'value',0);
    set(handles.faceemotion_fear,'value',0);
    set(handles.faceemotion_sorrow,'value',0);
elseif LM_DATA.FACE_EMOTATION == 1
    set(handles.faceemotion_default,'value',0);
    set(handles.faceemotion_smile,'value',1);
    set(handles.faceemotion_cry,'value',0);
    set(handles.faceemotion_angry,'value',0);
    set(handles.faceemotion_fear,'value',0);
    set(handles.faceemotion_sorrow,'value',0);
elseif LM_DATA.FACE_EMOTATION == 2
    set(handles.faceemotion_default,'value',0);
    set(handles.faceemotion_smile,'value',0);
    set(handles.faceemotion_cry,'value',1);
    set(handles.faceemotion_angry,'value',0);
    set(handles.faceemotion_fear,'value',0);
    set(handles.faceemotion_sorrow,'value',0);
elseif LM_DATA.FACE_EMOTATION == 3
    set(handles.faceemotion_default,'value',0);
    set(handles.faceemotion_smile,'value',0);
    set(handles.faceemotion_cry,'value',0);
    set(handles.faceemotion_angry,'value',1);
    set(handles.faceemotion_fear,'value',0);
    set(handles.faceemotion_sorrow,'value',0);
elseif LM_DATA.FACE_EMOTATION == 4
    set(handles.faceemotion_default,'value',0);
    set(handles.faceemotion_smile,'value',0);
    set(handles.faceemotion_cry,'value',0);
    set(handles.faceemotion_angry,'value',0);
    set(handles.faceemotion_fear,'value',1);
    set(handles.faceemotion_sorrow,'value',0);
elseif LM_DATA.FACE_EMOTATION == 5
    set(handles.faceemotion_default,'value',0);
    set(handles.faceemotion_smile,'value',0);
    set(handles.faceemotion_cry,'value',0);
    set(handles.faceemotion_angry,'value',0);
    set(handles.faceemotion_fear,'value',0);
    set(handles.faceemotion_sorrow,'value',1);
else
    set(handles.faceemotion_default,'value',1);
    set(handles.faceemotion_smile,'value',0);
    set(handles.faceemotion_cry,'value',0);
    set(handles.faceemotion_angry,'value',0);
    set(handles.faceemotion_fear,'value',0);
    set(handles.faceemotion_sorrow,'value',0);
end

%LM_DATA.FACE_TYPE: 0 default; 1 cute; 2 cool; 3 smart; 4 normal; 5 others
if LM_DATA.FACE_TYPE == 0
    set(handles.facetype_default,'Value',1);
    set(handles.facetype_cute,'Value',0);
    set(handles.facetype_cool,'Value',0);
    set(handles.facetype_smart,'Value',0);
    set(handles.facetype_normal,'Value',0);
    set(handles.facetype_other,'Value',0);
elseif LM_DATA.FACE_TYPE == 1
    set(handles.facetype_default,'Value',0);
    set(handles.facetype_cute,'Value',1);
    set(handles.facetype_cool,'Value',0);
    set(handles.facetype_smart,'Value',0);
    set(handles.facetype_normal,'Value',0);
    set(handles.facetype_other,'Value',0);
elseif LM_DATA.FACE_TYPE == 2
    set(handles.facetype_default,'Value',0);
    set(handles.facetype_cute,'Value',0);
    set(handles.facetype_cool,'Value',1);
    set(handles.facetype_smart,'Value',0);
    set(handles.facetype_normal,'Value',0);
    set(handles.facetype_other,'Value',0);
elseif LM_DATA.FACE_TYPE == 3
    set(handles.facetype_default,'Value',0);
    set(handles.facetype_cute,'Value',0);
    set(handles.facetype_cool,'Value',0);
    set(handles.facetype_smart,'Value',1);
    set(handles.facetype_normal,'Value',0);
    set(handles.facetype_other,'Value',0);
elseif LM_DATA.FACE_TYPE == 4
    set(handles.facetype_default,'Value',0);
    set(handles.facetype_cute,'Value',0);
    set(handles.facetype_cool,'Value',0);
    set(handles.facetype_smart,'Value',0);
    set(handles.facetype_normal,'Value',1)
    set(handles.facetype_other,'Value',0);
elseif LM_DATA.FACE_TYPE == 5
    set(handles.facetype_default,'Value',0);
    set(handles.facetype_cute,'Value',0);
    set(handles.facetype_cool,'Value',0);
    set(handles.facetype_smart,'Value',0);
    set(handles.facetype_normal,'Value',0);
    set(handles.facetype_other,'Value',1);
else
    set(handles.facetype_default,'Value',1);
    set(handles.facetype_cute,'Value',0);
    set(handles.facetype_cool,'Value',0);
    set(handles.facetype_normal,'Value',0);
    set(handles.facetype_other,'Value',0);
end

%LM_DATA.LEFT_EYE: 1 close; 0 open
if LM_DATA.LEFT_EYE == 0 
    set(handles.lefteye_open,'Value',1);
    set(handles.lefteye_close,'Value',0);
elseif LM_DATA.LEFT_EYE == 1
    set(handles.lefteye_open,'Value',0);
    set(handles.lefteye_close,'Value',1);
else
    set(handles.lefteye_open,'Value',1);
    set(handles.lefteye_close,'Value',0);
end

%LM_DATA.RIGHT_EYE: 1 close; 0 open
if LM_DATA.RIGHT_EYE == 0
    set(handles.righteye_open,'Value',1);
    set(handles.righteye_close,'Value',0);
elseif LM_DATA.RIGHT_EYE == 1
    set(handles.righteye_open,'Value',0);
    set(handles.righteye_close,'Value',1);
else
    set(handles.righteye_open,'Value',1);
    set(handles.righteye_close,'Value',0);
end

%LM_DATA.MOUTH_TYPE: 0 close; 1 open; 2 moddle
if LM_DATA.MOUTH_TYPE == 0
    set(handles.mouth_close,'Value',1);
    set(handles.mouth_open,'Value',0);
    set(handles.mouth_middle,'Value',0);
elseif LM_DATA.MOUTH_TYPE == 1
    set(handles.mouth_close,'Value',0);
    set(handles.mouth_open,'Value',1);
    set(handles.mouth_middle,'Value',0);
elseif LM_DATA.MOUTH_TYPE == 2
    set(handles.mouth_close,'Value',0);
    set(handles.mouth_open,'Value',0);
    set(handles.mouth_middle,'Value',1);
else
    set(handles.mouth_close,'Value',1);
    set(handles.mouth_open,'Value',0);
    set(handles.mouth_middle,'Value',0);
end

% Face Score : 1 (worst) ~ 5 (best)
if LM_DATA.SCORE == 1
    set(handles.facescore_1,'value',1);
    set(handles.facescore_2,'value',0);
    set(handles.facescore_3,'value',0);
    set(handles.facescore_4,'value',0);
    set(handles.facescore_5,'value',0);
elseif LM_DATA.SCORE == 2
    set(handles.facescore_1,'value',0);
    set(handles.facescore_2,'value',1);
    set(handles.facescore_3,'value',0);
    set(handles.facescore_4,'value',0);
    set(handles.facescore_5,'value',0);
elseif LM_DATA.SCORE == 3
    set(handles.facescore_1,'value',0);
    set(handles.facescore_2,'value',0);
    set(handles.facescore_3,'value',1);
    set(handles.facescore_4,'value',0);
    set(handles.facescore_5,'value',0);
elseif LM_DATA.SCORE == 4
    set(handles.facescore_1,'value',0);
    set(handles.facescore_2,'value',0);
    set(handles.facescore_3,'value',0);
    set(handles.facescore_4,'value',1);
    set(handles.facescore_5,'value',0);
elseif LM_DATA.SCORE == 5
    set(handles.facescore_1,'value',0);
    set(handles.facescore_2,'value',0);
    set(handles.facescore_3,'value',0);
    set(handles.facescore_4,'value',0);
    set(handles.facescore_5,'value',1);
else
    set(handles.facescore_1,'value',0);
    set(handles.facescore_2,'value',0);
    set(handles.facescore_3,'value',0);
    set(handles.facescore_4,'value',0);
    set(handles.facescore_5,'value',0);
end

set(handles.edit_operator,'String',LM_DATA.Operator);

%LM_DATA.USE : 1 use; 0 not use
if LM_DATA.USE == 1
    set(handles.use_toggle,'Value',1);
elseif LM_DATA.USE == 0
    set(handles.use_toggle,'Value',0);
else
    set(handles.use_toggle,'Value',0);
end

if ML_Active == 1
    set(handles.active_toggle,'Value',1);
elseif ML_Active == 0
    set(handles.active_toggle,'Value',0);
else
    set(handles.active_toggle,'Value',0);
end


