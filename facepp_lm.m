function facepp_lm(FL_Fn,st_idx)
% Face++ application for the Landmark of the face features
% FL_Fn  : file list
% st_idx : start index of the list
%

% input the API_KEY & API_SECRET
%API_KEY = 'd45344602f6ffd77baeab05b99fb7730';
%API_SECRET = 'jKb9XJ_GQ5cKs0QOk6Cj1HordHFBWrgL';
API_KEY = '687468b54703394b4c5220b2d9800d81';
API_SECRET = 'n24aguS_uZU0VF1R-yxgz2_skc2PNiNn';

api = facepp(API_KEY, API_SECRET);


%FL_DATA.F_Dir = FL_Fn;
%FL_DATA.Operator = '';
%FL_DATA.Ver = 0;
%FL_DATA.F_Num = 0;
%FL_DATA.F_Name_Data = {};


% Load the list of the image files 
[FL_DATA] = load_fl('', FL_Fn);



for i = st_idx:FL_DATA.F_Num
    % Generate the image file name and the corresponding landmark file name 
    imgfile = fullfile(FL_DATA.F_Dir, FL_DATA.F_Name_Data{i});
    resfile = sprintf('%s.lm',imgfile);
    
    if exist(imgfile, 'file')
        fprintf('No.%d(%d) : %s -> %s \n',i,FL_DATA.F_Num,imgfile,resfile);
        
        rst = detect_file(api, imgfile, 'all');
        img_width = rst{1}.img_width;
        img_height = rst{1}.img_height;
        
        face = rst{1}.face;
        if length(face) ~= 1
            fprintf('Totally %d faces detected!\n', length(face));
            continue;
        end
        fid = fopen(resfile,'wt');
        
        fprintf(fid,'#name=%s\n',resfile);
        fprintf(fid,'#num=83\n');
        fprintf(fid,'#operator=%s\n',FL_DATA.Operator);
        fprintf(fid,'#score=0\n');
        
        fprintf(fid,'#use=1\n');

        fprintf(fid,'#face_emotation=0\n');
        %LM_DATA.FACE_EMOTATION:
        %0:default; 1:smile; 2:cry; 3:angry; 4:fear; 5:sorrow

        fprintf(fid,'#face_type=0\n');
        %LM_DATA.FACE_TYPE:
        %0:default; 1:cute; 2:cool; 3:smart; 4:normal; 5:others

        fprintf(fid,'#mouth_type=0\n');
        %LM_DATA.MOUTH_TYPE:
        %0:close; 1:open; 2:moddle

        fprintf(fid,'#left_eye=0\n');
        %LM_DATA.LEFT_EYE:
        %1:close; 0:open

        fprintf(fid,'#right_eye=0\n');
        %LM_DATA.RIGHT_EYE:
        %1:close; 0:open
        
        fprintf(fid,'#ver=1\n');
        
        fprintf(fid,'#im_width=%d\n',img_width);
        fprintf(fid,'#im_height=%d\n',img_height);
        
        face_i = rst{1}.face{1};
        
        rst2 = api.landmark(face_i.face_id, '83p');
        landmark_points = rst2{1}.result{1}.landmark;
        landmark_names = fieldnames(landmark_points);
        
        for i =  1 : length(landmark_names)
            pt = getfield(landmark_points, landmark_names{i});
            
            fprintf(fid,'@%d %d %d\n',i,(pt.x*img_width)/100, (pt.y*img_height)/100);
        end
        
        fclose(fid);
    else
        printf('Img File %s is not existed!',imgfile);
    end
    
    rand_t = ceil(random('norm',1,0.6,1,1)*100)+25;
    pause(rand_t);
end


