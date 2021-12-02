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

%��İ취 �ֱ�д����
%�������ݵĴ���  ͨ����ȡ
fiftynum = (1:1:50);
caseone_row1 = [fiftynum(1:1:15),fiftynum(36:1:50)];
caseone_row2 = [fiftynum(1:1:14),fiftynum(37:1:50)];
caseone_row3 = [fiftynum(1:1:13),fiftynum(38:1:50)];
caseone_row4 = [fiftynum(1:1:12),fiftynum(39:1:50)];
caseone_row5 = [fiftynum(1:1:11),fiftynum(40:1:50)];
caseone_row6 = [fiftynum(1:1:10),fiftynum(41:1:50)];
caseone_row7 = [fiftynum(1:1:9),fiftynum(42:1:50)];
caseone_row8 = [fiftynum(1:1:8),fiftynum(43:1:50)];
caseone_row9 = [fiftynum(1:1:7),fiftynum(44:1:50)];
caseone_row10 = [fiftynum(1:1:6),fiftynum(45:1:50)];
caseone_row11 = [fiftynum(1:1:5),fiftynum(46:1:50)];
caseone_row12 = [fiftynum(1:1:4),fiftynum(47:1:50)];
caseone_row13 = [fiftynum(1:1:3),fiftynum(48:1:50)];
caseone_row14 = [fiftynum(1:1:2),fiftynum(49:1:50)];
caseone_row15 = [fiftynum(1:1:1),fiftynum(50:1:50)];



caseone_row36 = [fiftynum(1:1:1),fiftynum(50:1:50)];
caseone_row37 = [fiftynum(1:1:2),fiftynum(49:1:50)];
caseone_row38 = [fiftynum(1:1:3),fiftynum(48:1:50)];
caseone_row39 = [fiftynum(1:1:4),fiftynum(47:1:50)];
caseone_row40 = [fiftynum(1:1:5),fiftynum(46:1:50)];
caseone_row41 = [fiftynum(1:1:6),fiftynum(45:1:50)];
caseone_row42 = [fiftynum(1:1:7),fiftynum(44:1:50)];
caseone_row43 = [fiftynum(1:1:8),fiftynum(43:1:50)];
caseone_row44 = [fiftynum(1:1:9),fiftynum(42:1:50)];
caseone_row45 = [fiftynum(1:1:10),fiftynum(41:1:50)];
caseone_row46 = [fiftynum(1:1:11),fiftynum(40:1:50)];
caseone_row47 = [fiftynum(1:1:12),fiftynum(39:1:50)];
caseone_row48 = [fiftynum(1:1:13),fiftynum(38:1:50)];
caseone_row49 = [fiftynum(1:1:14),fiftynum(37:1:50)];
caseone_row50 = [fiftynum(1:1:15),fiftynum(36:1:50)];


for i=1:L
    for k=1:W  
        %���ķ��������ĸ�������
        if i == 1 && (any(caseone_row1==k))==1
            continue;
        end
        if i == 2 && (any(caseone_row2==k))==1
            continue;
        end
        
        if i == 3 && (any(caseone_row3==k))==1
            continue;
        end
        if i == 4 && (any(caseone_row4==k))==1
            continue;
        end
        if i == 5 && (any(caseone_row5==k))==1
            continue;
        end
        if i == 6 && (any(caseone_row6==k))==1
            continue;
        end
        if i == 7 && (any(caseone_row7==k))==1
            continue;
        end
        if i == 8 && (any(caseone_row8==k))==1
            continue;
        end
        if i == 9 && (any(caseone_row9==k))==1
            continue;
        end
        if i == 10 && (any(caseone_row10==k))==1
            continue;
        end
        if i == 11 && (any(caseone_row11==k))==1
            continue;
        end
        if i == 12 && (any(caseone_row12==k))==1
            continue;
        end
        if i == 13 && (any(caseone_row13==k))==1
            continue;
        end
        if i == 14 && (any(caseone_row14==k))==1
            continue;
        end
        if i == 15 && (any(caseone_row15==k))==1
            continue;
        end
        

        if i == 36 && (any(caseone_row36==k))==1
            continue;
        end
        if i == 37 && (any(caseone_row37==k))==1
            continue;
        end
        if i == 38 && (any(caseone_row38==k))==1
            continue;
        end
        if i == 39 && (any(caseone_row39==k))==1
            continue;
        end
        if i == 40 && (any(caseone_row40==k))==1
            continue;
        end
        if i == 41 && (any(caseone_row41==k))==1
            continue;
        end
        if i == 42 && (any(caseone_row42==k))==1
            continue;
        end
        if i == 43 && (any(caseone_row43==k))==1
            continue;
        end
        if i == 44 && (any(caseone_row44==k))==1
            continue;
        end
        if i == 45 && (any(caseone_row45==k))==1
            continue;
        end
        if i == 46 && (any(caseone_row46==k))==1
            continue;
        end
        
        if i == 47 && (any(caseone_row47==k))==1
            continue;
        end
        if i == 48 && (any(caseone_row48==k))==1
            continue;
        end
        if i == 49 && (any(caseone_row49==k))==1
            continue;
        end
        
        if i == 50 && (any(caseone_row50==k))==1
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

cover_rate = p_sum*(L*W/M)/((L*W)-480);%������

end