function [ out_data ] = groupByTime( data ,type)
% 分割数据,type:all,type:store
if(strcmp(type,'all'))
out_data{1} = selectDateA(data,20141010,20141023);
out_data{2} = selectDateA(data,20141024,20141106);
out_data{3} = selectDateA(data,20141107,20141120);%双十一
out_data{4} = selectDateA(data,20141121,20141204);
out_data{5} = selectDateA(data,20141205,20141218);
out_data{6} = selectDateA(data,20141219,20150101);
out_data{7} = selectDateA(data,20150102,20150115);
out_data{8} = selectDateA(data,20150116,20150129);
out_data{9} = selectDateA(data,20150130,20150212);
out_data{10} = selectDateA(data,20150213,20150226);
out_data{11} = selectDateA(data,20150227,20150312);
out_data{12} = selectDateA(data,20150313,20150326);
out_data{13} = selectDateA(data,20150327,20150409);
out_data{14} = selectDateA(data,20150410,20150423);
out_data{15} = selectDateA(data,20150424,20150507);
out_data{16}= selectDateA(data,20150508,20150521);
out_data{17} = selectDateA(data,20150522,20150604);
out_data{18} = selectDateA(data,20150605,20150618);
out_data{19} = selectDateA(data,20150619,20150702);
out_data{20} = selectDateA(data,20150703,20150716);
out_data{21} = selectDateA(data,20150717,20150730);
out_data{22} = selectDateA(data,20150731,20150813);
out_data{23} = selectDateA(data,20150814,20150827);
out_data{24} = selectDateA(data,20150828,20150910);
out_data{25} = selectDateA(data,20150911,20150924);
out_data{26} = selectDateA(data,20150925,20151008);
out_data{27} = selectDateA(data,20151009,20151022);
out_data{28} = selectDateA(data,20151023,20151105);
out_data{29} = selectDateA(data,20151106,20151119);%双十一
out_data{30} = selectDateA(data,20151120,20151203);
out_data{31} = selectDateA(data,20151204,20151217);
out_data{32} = selectDateA(data,20151214,20151227);
elseif(strcmp(type,'store'))
out_data{1} = selectDateB(data,20141010,20141023);
out_data{2} = selectDateB(data,20141024,20141106);
out_data{3} = selectDateB(data,20141107,20141120);%双十一
out_data{4} = selectDateB(data,20141121,20141204);
out_data{5} = selectDateB(data,20141205,20141218);
out_data{6} = selectDateB(data,20141219,20150101);
out_data{7} = selectDateB(data,20150102,20150115);
out_data{8} = selectDateB(data,20150116,20150129);
out_data{9} = selectDateB(data,20150130,20150212);
out_data{10} = selectDateB(data,20150213,20150226);
out_data{11} = selectDateB(data,20150227,20150312);
out_data{12} = selectDateB(data,20150313,20150326);
out_data{13} = selectDateB(data,20150327,20150409);
out_data{14} = selectDateB(data,20150410,20150423);
out_data{15} = selectDateB(data,20150424,20150507);
out_data{16}= selectDateB(data,20150508,20150521);
out_data{17} = selectDateB(data,20150522,20150604);
out_data{18} = selectDateB(data,20150605,20150618);
out_data{19} = selectDateB(data,20150619,20150702);
out_data{20} = selectDateB(data,20150703,20150716);
out_data{21} = selectDateB(data,20150717,20150730);
out_data{22} = selectDateB(data,20150731,20150813);
out_data{23} = selectDateB(data,20150814,20150827);
out_data{24} = selectDateB(data,20150828,20150910);
out_data{25} = selectDateB(data,20150911,20150924);
out_data{26} = selectDateB(data,20150925,20151008);
out_data{27} = selectDateB(data,20151009,20151022);
out_data{28} = selectDateB(data,20151023,20151105);
out_data{29} = selectDateB(data,20151106,20151119);%双十一
out_data{30} = selectDateB(data,20151120,20151203);
out_data{31} = selectDateB(data,20151204,20151217);
out_data{32} = selectDateB(data,20151214,20151227);
end
end

