function [VarName1,VarName2,VarName3,VarName4,VarName5,VarName6,VarName7,VarName8,VarName9,VarName10,VarName11,VarName12,VarName13,VarName14,VarName15,VarName16,VarName17,VarName18,VarName19,VarName20,VarName21,VarName22,VarName23,VarName24,VarName25,VarName26,VarName27,VarName28,VarName29,VarName30,VarName31] = importItem(filename, startRow, endRow)
%IMPORTFILE 将文本文件中的数值数据作为列矢量导入。
%   [VARNAME1,VARNAME2,VARNAME3,VARNAME4,VARNAME5,VARNAME6,VARNAME7,VARNAME8,VARNAME9,VARNAME10,VARNAME11,VARNAME12,VARNAME13,VARNAME14,VARNAME15,VARNAME16,VARNAME17,VARNAME18,VARNAME19,VARNAME20,VARNAME21,VARNAME22,VARNAME23,VARNAME24,VARNAME25,VARNAME26,VARNAME27,VARNAME28,VARNAME29,VARNAME30,VARNAME31]
%   = IMPORTFILE(FILENAME) 读取文本文件 FILENAME 中默认选定范围的数据。
%
%   [VARNAME1,VARNAME2,VARNAME3,VARNAME4,VARNAME5,VARNAME6,VARNAME7,VARNAME8,VARNAME9,VARNAME10,VARNAME11,VARNAME12,VARNAME13,VARNAME14,VARNAME15,VARNAME16,VARNAME17,VARNAME18,VARNAME19,VARNAME20,VARNAME21,VARNAME22,VARNAME23,VARNAME24,VARNAME25,VARNAME26,VARNAME27,VARNAME28,VARNAME29,VARNAME30,VARNAME31]
%   = IMPORTFILE(FILENAME, STARTROW, ENDROW) 读取文本文件 FILENAME 的 STARTROW 行到
%   ENDROW 行中的数据。
%
% Example:
%   [VarName1,VarName2,VarName3,VarName4,VarName5,VarName6,VarName7,VarName8,VarName9,VarName10,VarName11,VarName12,VarName13,VarName14,VarName15,VarName16,VarName17,VarName18,VarName19,VarName20,VarName21,VarName22,VarName23,VarName24,VarName25,VarName26,VarName27,VarName28,VarName29,VarName30,VarName31]
%   = importItem('item_feature1.csv',1, 230355);
%
%    另请参阅 TEXTSCAN。

% 由 MATLAB 自动生成于 2016/04/18 10:42:46

%% 初始化变量。
delimiter = ',';
if nargin<=2
    startRow = 1;
    endRow = inf;
end

%% 每个文本行的格式字符串:
%   列1: 双精度值 (%f)
%	列2: 双精度值 (%f)
%   列3: 双精度值 (%f)
%	列4: 双精度值 (%f)
%   列5: 双精度值 (%f)
%	列6: 双精度值 (%f)
%   列7: 双精度值 (%f)
%	列8: 双精度值 (%f)
%   列9: 双精度值 (%f)
%	列10: 双精度值 (%f)
%   列11: 双精度值 (%f)
%	列12: 双精度值 (%f)
%   列13: 双精度值 (%f)
%	列14: 双精度值 (%f)
%   列15: 双精度值 (%f)
%	列16: 双精度值 (%f)
%   列17: 双精度值 (%f)
%	列18: 双精度值 (%f)
%   列19: 双精度值 (%f)
%	列20: 双精度值 (%f)
%   列21: 双精度值 (%f)
%	列22: 双精度值 (%f)
%   列23: 双精度值 (%f)
%	列24: 双精度值 (%f)
%   列25: 双精度值 (%f)
%	列26: 双精度值 (%f)
%   列27: 双精度值 (%f)
%	列28: 双精度值 (%f)
%   列29: 双精度值 (%f)
%	列30: 双精度值 (%f)
%   列31: 双精度值 (%f)
% 有关详细信息，请参阅 TEXTSCAN 文档。
formatSpec = '%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%[^\n\r]';

%% 打开文本文件。
fileID = fopen(filename,'r');

%% 根据格式字符串读取数据列。
% 该调用基于生成此代码所用的文件的结构。如果其他文件出现错误，请尝试通过导入工具重新生成代码。
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'EmptyValue' ,NaN,'HeaderLines', startRow(1)-1, 'ReturnOnError', false);
for block=2:length(startRow)
    frewind(fileID);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', delimiter, 'EmptyValue' ,NaN,'HeaderLines', startRow(block)-1, 'ReturnOnError', false);
    for col=1:length(dataArray)
        dataArray{col} = [dataArray{col};dataArrayBlock{col}];
    end
end

%% 关闭文本文件。
fclose(fileID);

%% 对无法导入的数据进行的后处理。
% 在导入过程中未应用无法导入的数据的规则，因此不包括后处理代码。要生成适用于无法导入的数据的代码，请在文件中选择无法导入的元胞，然后重新生成脚本。

%% 将导入的数组分配给列变量名称
VarName1 = dataArray{:, 1};
VarName2 = dataArray{:, 2};
VarName3 = dataArray{:, 3};
VarName4 = dataArray{:, 4};
VarName5 = dataArray{:, 5};
VarName6 = dataArray{:, 6};
VarName7 = dataArray{:, 7};
VarName8 = dataArray{:, 8};
VarName9 = dataArray{:, 9};
VarName10 = dataArray{:, 10};
VarName11 = dataArray{:, 11};
VarName12 = dataArray{:, 12};
VarName13 = dataArray{:, 13};
VarName14 = dataArray{:, 14};
VarName15 = dataArray{:, 15};
VarName16 = dataArray{:, 16};
VarName17 = dataArray{:, 17};
VarName18 = dataArray{:, 18};
VarName19 = dataArray{:, 19};
VarName20 = dataArray{:, 20};
VarName21 = dataArray{:, 21};
VarName22 = dataArray{:, 22};
VarName23 = dataArray{:, 23};
VarName24 = dataArray{:, 24};
VarName25 = dataArray{:, 25};
VarName26 = dataArray{:, 26};
VarName27 = dataArray{:, 27};
VarName28 = dataArray{:, 28};
VarName29 = dataArray{:, 29};
VarName30 = dataArray{:, 30};
VarName31 = dataArray{:, 31};


