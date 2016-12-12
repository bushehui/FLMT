function modify_fi(in_fi,in_flm,res_fi,res_flm)
% Modify the face image (Resize and rotate the image)
%
% in_fi  : input original face image
% in_flm : input original landmark
% res_fi : the modified face image
% res_flm: landmark of the modified face


%Í¼Æ¬µÄÐý×ª£ºimrotate(image,90);
%Í¼Æ¬µÄ¼ôÇÐ£ºimcrop(image,[10 10 50 60 ]);
% imresize()

% Check the file 
if ~exist(in_fi, 'file')
   fprintf('Error : the input original face image file %s is not existed!\n',in_fi);
   return;
elseif ~exist(in_flm, 'file')
   fprintf('Error : the input original landmark file %s is not existed!\n',in_flm);
   return;
end


LM_DATA = load_lmdata(in_flm);

ORI_FACEIMG = imread(in_fi);

Rect_LM_DATA = LM_DATA;
Rote_LM_DATA = LM_DATA;

%--------------------

%{
Key points:
1 :contour_chin

25:left_eye_pupil
65:nose_tip
71:right_eye_pupil
%}

Max_X = max(LM_DATA.XX);
Max_Y = max(LM_DATA.YY);
Min_X = min(LM_DATA.XX);
Min_Y = min(LM_DATA.YY);

delta_x = (Max_X - Min_X) / 2.0;
delta_y = (Max_Y - Min_Y) / 2.0;

% center of the eyebowers (pupil)
pu_x =  (LM_DATA.XX(25) + LM_DATA.XX(71))/2.0;
pu_y =  (LM_DATA.YY(25) + LM_DATA.YY(71))/2.0;

pu_dx = pu_x - LM_DATA.XX(65);
pu_dy = pu_y - LM_DATA.YY(65);

dr = sqrt(pu_dx^2 + pu_dy^2);

dx = max(dr,delta_x)*1.5; 
dy = max(2*dr,delta_y)*1.5;

%left_top
left_x = LM_DATA.XX(65) - dx;
if left_x < 0
    left_x = 0;
end

top_y = LM_DATA.YY(65) - dy;
if top_y < 0
    topy_y = 0;
end

%right_bottom
right_x = LM_DATA.XX(65) + dx;
if right_x > LM_DATA.IM_WIDTH
    right_x = LM_DATA.IM_WIDTH;
end

bottom_y = LM_DATA.YY(65) + dy;
if bottom_y > LM_DATA.IM_HEIGHT
    bottom_y = LM_DATA.IM_HEIGHT;
end

%--------------------

Rect_FACEIMG = imcrop(ORI_FACEIMG, [left_x top_y 2*dx 2*dy]);
%[xmin ymin width height] 

Rect_LM_DATA.XX = LM_DATA.XX - left_x;
Rect_LM_DATA.YY = LM_DATA.YY - top_y;

%--------------------

dx = LM_DATA.XX(71) - LM_DATA.XX(25);
dy = LM_DATA.YY(71) - LM_DATA.YY(25);

theta =  atan(dy/dx);

ROT_FACEIMG = imrotate(Rect_FACEIMG,(180*theta)/pi);

RotMatrix = [cos(theta), -sin(theta); sin(theta), cos(theta)];

s = size(Rect_FACEIMG);

Rect_LM_DATA.IM_WIDTH = s(2);
Rect_LM_DATA.IM_HEIGHT = s(1);

temp_XY = [Rect_LM_DATA.XX' - Rect_LM_DATA.IM_WIDTH/2; Rect_LM_DATA.YY' - Rect_LM_DATA.IM_HEIGHT/2]';

t_XY = temp_XY*RotMatrix;

s = size(ROT_FACEIMG);

Rote_LM_DATA.IM_WIDTH = s(2);
Rote_LM_DATA.IM_HEIGHT = s(1);

Rote_LM_DATA.XX = t_XY(:,1) + Rote_LM_DATA.IM_WIDTH/2;
Rote_LM_DATA.YY = t_XY(:,2) + Rote_LM_DATA.IM_HEIGHT/2;

%--------------------

%{
%ORI_FACEIMG = imread(in_fi);
figure;
gcf;
fig1 = imshow(ORI_FACEIMG);
axis image;
hold on;
for idx = 1:LM_DATA.Num
    x = LM_DATA.XX(idx);
    y = LM_DATA.YY(idx);
    
    plot(x,y,'.');
end

figure;
gcf;
fig2 = imshow(Rect_FACEIMG);
axis image;
hold on;
for idx = 1:LM_DATA.Num
    x = Rect_LM_DATA.XX(idx);
    y = Rect_LM_DATA.YY(idx);
    
    plot(x,y,'.');
end

figure;
gcf;
fig2 = imshow(ROT_FACEIMG);
axis image;
hold on;
%imwrite(ROT_FACEIMG,res_fi);
for idx = 1:LM_DATA.Num
    x = Rote_LM_DATA.XX(idx);
    y = Rote_LM_DATA.YY(idx);
    
    plot(x,y,'.');
end
%}

%--------------------

imwrite(ROT_FACEIMG,res_fi,'jpg');
save_lmdata(Rote_LM_DATA,res_flm);


