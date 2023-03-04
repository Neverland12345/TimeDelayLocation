%导入数据
function data=find_data(filename)
    d=importdata(filename);
    data=d.data;
end
