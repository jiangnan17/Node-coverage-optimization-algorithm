%%�õ�������
function cover_rate = get_Grid_cover_unit_and_rate(sensor_mat1)
global M;
global N;
global Grid_cen_x_and_y;
global r;
global L;
global W;

Grid_cover_unit = zeros(1,M);%1*M�����ڱ���2500����������ϸ���
Grid_cover_bool = zeros(M,N);%ÿ���������ļ��ĸ���  ֻ����0����
for i=1:M
    for j=1:N
        if ((Grid_cen_x_and_y(1,i)-sensor_mat1(1,j))^2 + (Grid_cen_x_and_y(2,i)-sensor_mat1(2,j))^2)...
                <=r^2
            Grid_cover_bool(i,j) = 1;%�����i�������ĵ���Ա���j���������ڵ㸲��
        end
    end
end

%%�������Ϸֲ�����
for i=1:M
    p = 1;%����Ϊ1
    for j=1:N
        p = p*(1-Grid_cover_bool(i,j));%���ݹ�ʽ����
    end
    Grid_cover_unit(1,i) = 1-p;%���ϸ��Ǹ���
end

%���㸲����
p_sum = 0;%�ۼ���������ĸ��Ǹ���
for i=1:M
    p_sum = p_sum + Grid_cover_unit(1,i);
end;
cover_rate = p_sum*(L*W/M)/(L*W);%������
end