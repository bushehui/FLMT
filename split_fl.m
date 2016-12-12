function split_fl(FL_Fn, SFL_Fn, MaxNum_sf)
% splite the files into several files 
% FL_FN  : Original file name of the total file list
% SFL_FN : Split file name
% MaxNum_sf: max num of the files for created file lsit


[FL_DATA] = load_fl('', FL_Fn);


SF_Num = ceil(FL_DATA.F_Num / MaxNum_sf);

for i = 1:(SF_Num-1)
    res_fn = sprintf('%s_%d.fl',SFL_Fn,i)
    
    fid = fopen(res_fn,'wt');
    fprintf(fid,'#name=%s\n',res_fn);
    fprintf(fid,'#dir=%s\n',FL_DATA.F_Dir);
    fprintf(fid,'#operator=%s\n',FL_DATA.Operator);
    fprintf(fid,'#num=%d\n',MaxNum_sf);
    fprintf(fid,'#ver=%s\n',FL_DATA.Ver);
    
    st_index = (i-1)*MaxNum_sf + 1;
    ed_index = i*MaxNum_sf;
    
    for j = st_index:ed_index
        fprintf(fid,'@%s\n',FL_DATA.F_Name_Data{j});
    end
    
    fclose(fid);
end



res_fn = sprintf('%s_%d.fl',SFL_Fn,SF_Num)

st_index = (SF_Num-1)*MaxNum_sf + 1;
ed_index = FL_DATA.F_Num;
num = ed_index - st_index + 1;

fid = fopen(res_fn,'wt');

fprintf(fid,'#name=%s\n',res_fn);
fprintf(fid,'#dir=%s\n',FL_DATA.F_Dir);
fprintf(fid,'#operator=%s\n',FL_DATA.Operator);
fprintf(fid,'#num=%d\n',num);
fprintf(fid,'#ver=%s\n',FL_DATA.Ver);
    
for j = st_index:ed_index
    fprintf(fid,'@%s\n',FL_DATA.F_Name_Data{j});
end
    
fclose(fid);
