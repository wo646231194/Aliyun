function [VarName1,all1,VarName3] = importConfig(filename, startRow, endRow)
%IMPORTFILE ���ı��ļ��е���ֵ������Ϊ��ʸ�����롣
%   [VARNAME1,ALL1,VARNAME3] = IMPORTFILE(FILENAME) ��ȡ�ı��ļ� FILENAME
%   ��Ĭ��ѡ����Χ�����ݡ�
%
%   [VARNAME1,ALL1,VARNAME3] = IMPORTFILE(FILENAME, STARTROW, ENDROW)
%   ��ȡ�ı��ļ� FILENAME �� STARTROW �е� ENDROW ���е����ݡ�
%
% Example:
%   [VarName1,all1,VarName3] = importConfig('config1.csv',1, 6000);
%
%    ������� TEXTSCAN��

% �� MATLAB �Զ������� 2016/04/18 11:08:33

%% ��ʼ��������
delimiter = ',';
if nargin<=2
    startRow = 1;
    endRow = inf;
end

%% ÿ���ı��еĸ�ʽ�ַ���:
%   ��1: ˫����ֵ (%f)
%	��2: �ı� (%s)
%   ��3: �ı� (%s)
% �й���ϸ��Ϣ������� TEXTSCAN �ĵ���
formatSpec = '%f%s%s%[^\n\r]';

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
all1 = dataArray{:, 2};
VarName3 = dataArray{:, 3};


