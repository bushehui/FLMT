function [imgfilelist] = creat_fl(FL_DIR, FL_Fn)
% Creat the File list in the given file path
%
%

dirData = dir(FL_DIR);      %# Get the data for the current directory
dirIndex = [dirData.isdir];  %# Find the index for directories
%fileList = {dirData(~dirIndex).name}';  %'# Get a list of the files
fileList = dirData(~dirIndex)

%disp(length(fileList));


fnsum = 0;
imgfilelist = {};


for i = 1:length(fileList)
    filename = fileList(i).name;
    [path_str, name_str, ext_str] = fileparts(filename);
    
    if fileList(i).bytes > 262144
        disp(fileList(i).bytes);
        continue;
    end
    
    if (strcmp(ext_str,'.jpg'))
        fnsum = fnsum + 1;
        imgfilelist{fnsum} = filename; %fileList{i};
    elseif (strcmp(ext_str,'.png'))
        fnsum = fnsum + 1;
        imgfilelist{fnsum} = filename; %fileList{i};
    end
end



fid = fopen(FL_Fn,'wt');

fprintf(fid,'#name=%s\n',FL_Fn);
fprintf(fid,'#dir=%s\n',FL_DIR);
fprintf(fid,'#operator=BU\n');
fprintf(fid,'#num=%d\n',fnsum);
fprintf(fid,'#ver=1alpha\n');

for i = 1:fnsum
	fprintf(fid,'@%s\n',imgfilelist{i});
end

fclose(fid);


