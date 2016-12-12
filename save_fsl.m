function save_fsl(FL_DATA, FS_DATA,FS_Path)
% save the facial score data to a text file

LM_DATA.Path=Get_ABSPATH(FS_Path);


fid = fopen(FS_Path,'wt');

fprintf(fid,'#dir=%s\n',FL_DATA.F_Dir);

fprintf(fid,'#operator=%s\n',FL_DATA.Operator);

fprintf(fid,'#num=%d\n',FL_DATA.F_Num);

fprintf(fid,'#ver=%d\n',FL_DATA.Ver);

for i = 1:FL_DATA.F_Num
    fprintf(fid,'@%s %d %d %d %d %d %d\n',FL_DATA.F_Name_Data{i}, ...
                                        FS_DATA.FACE_SCORE(i), ...
                                        FS_DATA.FACE_EMOTATION(i), ...
                                        FS_DATA.FACE_TYPE(i), ...
                                        FS_DATA.LEFT_EYE(i), ...
                                        FS_DATA.RIGHT_EYE(i), ...
                                        FS_DATA.MOUTH_TYPE(i));
end




fclose(fid);
