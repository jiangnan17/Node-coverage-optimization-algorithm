%%�õ�������
function cover_rate = get_Grid_cover_unit_and_rate(sensor_mat1)
global M;
global N;
global Grid_cen_x_and_y;
global r;
global L;
global W;
global r1;

Grid_cover_unit = zeros(L,W);%1*M�����ڱ���2500����������ϸ���
Grid_cover_bool = zeros(L,W,N);%ÿ���������ļ��ĸ���  ֻ����0����
%������ʱ�������ϰ����Ӱ�죬������ֻ�ǹ��� �ؼ������Ϸֲ�����
for i=1:L
    for k=1:W
        for j=1:N
            if j==1||j==2%�Թ̶��������������ڵ���д���
                if ((Grid_cen_x_and_y(i,k,1)-sensor_mat1(1,j))^2 + (Grid_cen_x_and_y(i,k,2)-sensor_mat1(2,j))^2)...
                        <=r1^2
                    Grid_cover_bool(i,k,j) = 1;%����(i,k)�������ĵ���Ա���j���������ڵ㸲��
                end
            else%���ƶ��Ĵ������ڵ�
                if ((Grid_cen_x_and_y(i,k,1)-sensor_mat1(1,j))^2 + (Grid_cen_x_and_y(i,k,2)-sensor_mat1(2,j))^2)...
                        <=r^2
                    Grid_cover_bool(i,k,j) = 1;%����(i,k)�������ĵ���Ա���j���������ڵ㸲��
                end
            end
        end
    end
end

%%�������Ϸֲ�����

%������ͷ�ļ���  �������������
%��Ӧ�еĹ���
case_colu1 = (16:1:35);
case_colu2 = (17:1:34);
case_colu3 = (18:1:33);
case_colu4 = (19:1:32);
case_colu5 = (20:1:31);
case_colu6 = (21:1:30);

%��Ӧ�еĹ���
case_row1 = (11:1:13);
case_row2 = (14:1:19);
case_row3 = (20:1:25);
case_row4 = (26:1:31);
case_row5 = (32:1:37);
case_row6 = (38:1:40);

for i=1:L
    for k=1:W  
        %���ķ�����������
        if (any(case_row1 == i)) == 1 && (any(case_colu1==k))==1
            continue;
        end
        if (any(case_row2 == i)) == 1 && (any(case_colu2==k))==1
            continue;
        end
        if (any(case_row3 == i)) == 1 && (any(case_colu3==k))==1
            continue;
        end
        if (any(case_row4 == i)) == 1 && (any(case_colu4==k))==1
            continue;
        end
        if (any(case_row5 == i)) == 1 && (any(case_colu5==k))==1
            continue;
        end
        if (any(case_row6 == i)) == 1 && (any(case_colu6==k))==1
            continue;
        end
        p = 1;%����Ϊ1
        for j=1:N
            p = p*(1-Grid_cover_bool(i,k,j));%���ݹ�ʽ����
        end
        Grid_cover_unit(i,k) = 1-p;%���ϸ��Ǹ���
    end
end


%���㸲����
p_sum = 0;%�ۼ���������ĸ��Ǹ���
for i=1:L
    for j=1:W
%         if (any(case_row1 == i)) == 1 && (any(case_colu1==j))==1
%             continue;
%         end
%         if (any(case_row2 == i)) == 1 && (any(case_colu2==j))==1
%             continue;
%         end
%         if (any(case_row3 == i)) == 1 && (any(case_colu3==j))==1
%             continue;
%         end
%         if (any(case_row4 == i)) == 1 && (any(case_colu4==j))==1
%             continue;
%         end
%         if (any(case_row5 == i)) == 1 && (any(case_colu5==j))==1
%             continue;
%         end
%         if (any(case_row6 == i)) == 1 && (any(case_colu6==j))==1
%             continue;
%         end
        p_sum = p_sum + Grid_cover_unit(i,j);
    end
end

cover_rate = p_sum*(L*W/M)/((L*W)-450);%������

end