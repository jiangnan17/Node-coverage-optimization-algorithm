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

%��������ͷ�ļ���
% case1 = (16:1:35);
% case2 = (17:1:34);
% case3 = (18:1:33);
% case4 = (19:1:32);
% case5 = (20:1:31);
% case6 = (21:1:30);
% case7 = (22:1:29);
% case8 = (23:1:28);
% case9 = (24:1:27);
% case10 = (25:1:26);
for i=1:L
    for k=1:W%ע����������е���˼  ���ǿ���x��Ĳ��ǵ�һ��
        if (i>10&&i<=20)&&(k>15&&k<=35)%��������ε�
            continue;
        end
        
        %���ķ�������������
%         if i==31 && (any(case1==k))==1
%             continue;
%         end
%         if (i==32||i==33)&& (any(case2==k))==1
%             continue;
%         end
%         if (i==34||i==35)&& (any(case3==k))==1
%             continue;
%         end
%         if (i==36||i==37)&& (any(case4==k))==1
%             continue;
%         end
%         if (i==38||i==39)&& (any(case5==k))==1
%             continue;
%         end
%         if (i==40||i==41)&& (any(case6==k))==1
%             continue;
%         end
%         if (i==42||i==43)&& (any(case7==k))==1
%             continue;
%         end
%         if (i==44||i==45)&&k== (any(case8==k))==1
%             continue;
%         end
%         if (i==46||i==47)&&k== (any(case9==k))==1
%             continue;
%         end
%         if (i==48||i==49)&&k==(any(case10==k))==1
%             continue;
%         end
          %������һ����Բ�Ҫ
%         if (i==50)
%             continue;
%         end
        p = 1;%����Ϊ1
        for j=1:N
            p = p*(1-Grid_cover_bool(i,k,j));%���ݹ�ʽ����
        end
        Grid_cover_unit(i,k) = 1-p;%���ϸ��Ǹ���
    end
end


%���㸲����
p_sum = 0;%�ۼ���������ĸ��Ǹ���
for i=1:L%��
    for j=1:W%��
%         if (i>10&&i<=20)&&(j>15&&j<=35)%��������ε�
%             continue;
%         end
        p_sum = p_sum + Grid_cover_unit(i,j);
    end
end

cover_rate = p_sum*(L*W/M)/((L*W)-200);%������

end