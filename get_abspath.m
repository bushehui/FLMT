function [ABS_PATH] = Get_ABSPATH(FULL_PATH)

[path_str, name_str, ext_str] = fileparts(FULL_PATH);

ABS_PATH =strcat(name_str, ext_str);

%L = length(FULL_PATH);

%P = findstr(FULL_PATH, '/');
%D = size(P);

%ABS_PATH = FULL_PATH(P(D(2))+1:L);


