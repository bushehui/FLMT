function [LM_DATA] = InitLMData()
% Creat and Initial the facial landmark data
% 
%



LM_DATA.Path = '';

LM_DATA.Num = 83;
%LM_DATA.Num = 52;

LM_DATA.Operator = '';

LM_DATA.FACE_EMOTATION = 0;

LM_DATA.FACE_TYPE = 0;

LM_DATA.MOUTH_TYPE = 0;

LM_DATA.LEFT_EYE = 0;

LM_DATA.RIGHT_EYE = 0;

LM_DATA.IM_WIDTH = 0;

LM_DATA.IM_HEIGHT = 0;

LM_DATA.VER = 1;

LM_DATA.SCORE = 0;

LM_DATA.USE = 0;

LM_DATA.XX = zeros(1,LM_DATA.Num);
LM_DATA.YY = zeros(1,LM_DATA.Num);


