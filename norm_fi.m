function norm_fi(in_fi,in_flm,res_fi,res_flm)
% Modify the face image
%
% in_fi  : input original face image
% in_flm : input original landmark
% res_fi : the modified face image
% res_flm: the modified face landmark 
%

% Í¼Æ¬µÄÐý×ª£ºimrotate(image,90);
% Í¼Æ¬µÄ¼ôÇÐ£ºimcrop(image,[10 10 50 60 ]);
% imresize()


% Check the file 
if ~exist(in_fi, 'file')
   fprintf('Error : the input original face image file %s is not existed!\n',in_fi);
   return;
elseif ~exist(in_flm, 'file')
   fprintf('Error : the input original landmark file %s is not existed!\n',in_flm);
   return;
end



LM_DATA = load_lmdata(in_flm)

% Key points:
%  25:left_eye_pupil
%  65:nose_tip
%  71:right_eye_pupil


% center of the eyebowers
eb_x =  (LM_DATA.XX(25) + LM_DATA.XX(71))/2;
eb_y =  (LM_DATA.YY(25) + LM_DATA.YY(71))/2;

dx = eb_x - LM_DATA.XX(65);
dy = eb_y - LM_DATA.YY(65);

theta = acos(dy / sqrt(dx^2 + dy^2));


