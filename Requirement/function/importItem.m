function [VarName1,VarName2,VarName3,VarName4,VarName5,VarName6,VarName7,VarName8,VarName9,VarName10,VarName11,VarName12,VarName13,VarName14,VarName15,VarName16,VarName17,VarName18,VarName19,VarName20,VarName21,VarName22,VarName23,VarName24,VarName25,VarName26,VarName27,VarName28,VarName29,VarName30,VarName31] = importItem(filename, startRow, endRow)
%IMPORTFILE ���ı��ļ��е���ֵ������Ϊ��ʸ�����롣
%   [VARNAME1,VARNAME2,VARNAME3,VARNAME4,VARNAME5,VARNAME6,VARNAME7,VARNAME8,VARNAME9,VARNAME10,VARNAME11,VARNAME12,VARNAME13,VARNAME14,VARNAME15,VARNAME16,VARNAME17,VARNAME18,VARNAME19,VARNAME20,VARNAME21,VARNAME22,VARNAME23,VARNAME24,VARNAME25,VARNAME26,VARNAME27,VARNAME28,VARNAME29,VARNAME30,VARNAME31]
%   = IMPORTFILE(FILENAME) ��ȡ�ı��ļ� FILENAME ��Ĭ��ѡ����Χ�����ݡ�
%
%   [VARNAME1,VARNAME2,VARNAME3,VARNAME4,VARNAME5,VARNAME6,VARNAME7,VARNAME8,VARNAME9,VARNAME10,VARNAME11,VARNAME12,VARNAME13,VARNAME14,VARNAME15,VARNAME16,VARNAME17,VARNAME18,VARNAME19,VARNAME20,VARNAME21,VARNAME22,VARNAME23,VARNAME24,VARNAME25,VARNAME26,VARNAME27,VARNAME28,VARNAME29,VARNAME30,VARNAME31]
%   = IMPORTFILE(FILENAME, STARTROW, ENDROW) ��ȡ�ı��ļ� FILENAME �� STARTROW �е�
%   ENDROW ���е����ݡ�
%
% Example:
%   [VarName1,VarName2,VarName3,VarName4,VarName5,VarName6,VarName7,VarName8,VarName9,VarName10,VarName11,VarName12,VarName13,VarName14,VarName15,VarName16,VarName17,VarName18,VarName19,VarName20,VarName21,VarName22,VarName23,VarName24,VarName25,VarName26,VarName27,VarName28,VarName29,VarName30,VarName31]
%   = importItem('item_feature1.csv',1, 230355);
%
%    ������� TEXTSCAN��

% �� MATLAB �Զ������� 2016/04/18 10:42:46

%% ��ʼ��������
delimiter = ',';
if nargin<=2
    startRow = 1;
    endRow = inf;
end

%% ÿ���ı��еĸ�ʽ�ַ���:
%   ��1: ˫����ֵ (%f)
%	��2: ˫����ֵ (%f)
%   ��3: ˫����ֵ (%f)
%	��4: ˫����ֵ (%f)
%   ��5: ˫����ֵ (%f)
%	��6: ˫����ֵ (%f)
%   ��7: ˫����ֵ (%f)
%	��8: ˫����ֵ (%f)
%   ��9: ˫����ֵ (%f)
%	��10: ˫����ֵ (%f)
%   ��11: ˫����ֵ (%f)
%	��12: ˫����ֵ (%f)
%   ��13: ˫����ֵ (%f)
%	��14: ˫����ֵ (%f)
%   ��15: ˫����ֵ (%f)
%	��16: ˫����ֵ (%f)
%   ��17: ˫����ֵ (%f)
%	��18: ˫����ֵ (%f)
%   ��19: ˫����ֵ (%f)
%	��20: ˫����ֵ (%f)
%   ��21: ˫����ֵ (%f)
%	��22: ˫����ֵ (%f)
%   ��23: ˫����ֵ (%f)
%	��24: ˫����ֵ (%f)
%   ��25: ˫����ֵ (%f)
%	��26: ˫����ֵ (%f)
%   ��27: ˫����ֵ (%f)
%	��28: ˫����ֵ (%f)
%   ��29: ˫����ֵ (%f)
%	��30: ˫����ֵ (%f)
%   ��31: ˫����ֵ (%f)
% �й���ϸ��Ϣ������� TEXTSCAN �ĵ���
formatSpec = '%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%[^\n\r]';

%% ���ı��ļ���
fileID = fopen(filename,'r');

%% ���ݸ�ʽ�ַ�����ȡ�����С�
% �õ��û������ɴ˴������õ��ļ��Ľṹ����������ļ����ִ����볢��ͨ�����빤���������ɴ��롣
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'EmptyValue' ,NaN,'HeaderLines', startRow(1)-1, 'ReturnOnError', false);
for block=2:length(startRow)
    frewind(fileID);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', delimiter, 'EmptyValue' ,NaN,'HeaderLines', startRow(block)-1, 'ReturnOnError', false);
    for col=1:length(dataArray)
        dataArray{col} = [dataArray{col};dataArrayBlock{col}];
    end
end

%% �ر��ı��ļ���
fclose(fileID);

%% ���޷���������ݽ��еĺ���
% �ڵ��������δӦ���޷���������ݵĹ�����˲�����������롣Ҫ�����������޷���������ݵĴ��룬�����ļ���ѡ���޷������Ԫ����Ȼ���������ɽű���

%% ����������������б�������
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


