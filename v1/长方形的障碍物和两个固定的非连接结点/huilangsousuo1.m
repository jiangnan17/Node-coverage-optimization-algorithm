%%������

clc;
clear ;
close all;
%ɾ����Ӧ���ļ�
delete('huilang1.xlsx');
delete('huilang2.xlsx');
delete('wolf_pop_public.mat');
delete('best_wolf1.mat');
delete('best_wolf2.mat');

global N;
global M;
global L;
global W;
global r;
global r1;
global Grid_cen_x;
global Grid_cen_y;
global Grid_cen_x_and_y;
global ger;%ȫ�ֵ��ܵ�����
L = 50;%��
W = 50;%��
%����1ƽ����һ������
M = 2500;%��������
r = 5;%��֪�뾶Ϊ5
r1 = 7.5;%��Բ�ĸ�֪�뾶Ϊ7.5
N = 30;%r=5����25�� ʵ�ʼ�����23��  r=7.5������������1  2��
sizepop = 50;%��Ⱥ��ģ
dimension = 2;% �ռ�ά��
ger = 100;% ����������
pos_limit = [0, 50];            % ����λ�ò�������


pop_new = zeros(dimension,N,sizepop);%�µ���Ⱥ
%%Ԥ�����ڴ�
wolf_pop = zeros(dimension,N,sizepop);%��Ⱥ
wolf_pop_temp =  zeros(dimension,N,sizepop);%��ʱ��һ����Ⱥ

sensor_fix1 = zeros(2,1);%�̶��Ĵ��н��1  ��1��  ����Ϊ(20,20)
sensor_fix2 = zeros(2,1);%�̶��Ĵ��н��2  ��2��  ����Ϊ(45,20)
sensor_fix1(1,1) = 7.5;
sensor_fix1(2,1) = 25;
sensor_fix2(1,1) = 42.5;
sensor_fix2(2,1) = 25;

%���ɳ�ʼ����Ⱥ  �Ѿ�ת������ά��  ��Ⱥ����ά     2*N*sizepop
for i=1:sizepop
    x = L*rand(1,N);%������ɽڵ�ĺ�����
    y = W*rand(1,N);%������ɽڵ��������
    %λ�õĳ�ʼ��
    wolf_pop(1,:,i) = x;
    wolf_pop(2,:,i) = y;
    
    %���й̶�����
    
    wolf_pop(:,1,i) = sensor_fix1;
    wolf_pop(:,2,i) = sensor_fix2;
end


%��Ⱥÿ�������һЩ����   ���Ⲽ�����ϰ�������
for i=1:sizepop
    count = 0;%����ͳ���ж��ٸ��������ڵ����ڸ÷�Χ
    for j=1:N
        if (wolf_pop(1,j,i)>=10&&wolf_pop(1,j,i)<=40) && (wolf_pop(2,j,i)>=5&&wolf_pop(2,j,i)<=25)%˵�����ϰ���������
            %�����ϰ���� �ϰ�����Χ
            count = count + 1;
            if rem(count,6)==1 || rem(count,6)==5%�������� ��
                wolf_pop(2,j,i)  = 25;
            elseif rem(count,6)==2 || rem(count,6)==0%��
                wolf_pop(2,j,i) = 5;
            elseif rem(count,6)==3%�󲿷�
                wolf_pop(1,j,i) = 10;
            elseif rem(count,6) == 4%��
                wolf_pop(1,j,i) = 40;
            end
        end
    end
end
                
                
            
wolf_pop_public = wolf_pop;%�����ĳ�ʼ��Ⱥ

%������Ⱥ��wolf_pop_public.mat�ļ���
save wolf_pop_public.mat wolf_pop_public;
%%��ʼ�Ĳ����ͼ  �õ�һ��������ȥ��ʼ��ͼ

%��������������
X_mat = (0:1:50);%x����
Y_mat = (0:1:50);%y����
Grid_cen_x = zeros(1,L/10);%�������ĵ�x����
Grid_cen_y = zeros(1,W/10);%�������ĵ�y����
%ǰ���������֮�ͳ���2
for i=1:L/1
    Grid_cen_x(i) = (X_mat(i)+X_mat(i+1))/2;
    Grid_cen_y(i) = (Y_mat(i)+Y_mat(i+1))/2;
end

%%�Ѻ������궪��һ����ά������
%����ת����  ��һ�з�x�� �ڶ��з�y�ᣬͬһ�з�һ��������
%���ȴ濿��x����ĵ�һ�У�Ȼ�����ϴ�ڶ���
%������������
%������������һ��Ϊ��һ��
Grid_cen_x_and_y = zeros(L,W,2);%��2500���������ģ�����ÿ������������x,y
for i=1:L/1
    for j=1:W/1
        Grid_cen_x_and_y(i,j,1) = Grid_cen_x(j);%1����x
        Grid_cen_x_and_y(i,j,2) = Grid_cen_y(i);%��y����ŵ��ڶ���
    end
end


x_pos = wolf_pop(1,:,1);%��һ������   ���Ӽ��ǽ�  ��x����
y_pos = wolf_pop(2,:,1);%��һ������   ���Ӽ��ǽ�  ��y����

iter = 1;%��һ��  ��1��ʼ
%���л�ͼ
figure(1);
draw_circle(x_pos,y_pos,iter);
title('��ʼ������ͼ');

%���������ĵ������ŵ�������
%sensor_mat = zeros(2,N);%Ԥ�����ڴ�
sensor_mat = wolf_pop(:,:,1);%��һ���еĵ�һֻ��



%%�õ����ϸ���
cover_rate =  get_Grid_cover_unit_and_rate(sensor_mat);
disp('�����ʣ�');
disp(cover_rate);



%%������ͨ��  ������
% is_connec = get_connection(sensor_mat);
% if is_connec==1
%     disp('��ͨ');
% else
%     disp('����ͨ');
% end





%%��ʼ����Ⱥ��ʷֵΪ  ����С   infΪ�����
best_all_ger_fitness = -inf;                      % ��Ⱥ��ʷ�����Ӧ��  
best_indivi = zeros(2,N);                 % �����������

%%�������Ѿ���ͼ��
%%����Ϊ������ʼ��ʱ��50�����ӿ�ʼ��λ��
wolf_one_dis =  zeros(2,N);%��һֻ�Ǿ���ʳ��ľ���
wolf_two_dis = zeros(2,N);%�ڶ�ֻ�Ǿ���ʳ��
wolf_three_dis = zeros(2,N);%����ֻ�Ǿ���ʳ��
wolf_one = zeros(2,N);%��һֻ��
wlof_two = zeros(2,N);%�ڶ�ֻ��
wolf_three = zeros(2,N);%����ֻ��
wolf_fitness = zeros(sizepop,1);%���嵱ǰ��Ӧ��
wolf_fitness_temp = zeros(sizepop,1);%��ʱ���浱ǰ��Ӧ��
%% Ⱥ�����

record_ger = zeros(ger, 1);          % ��¼ÿ�ε�������õ���Ӧֵ 
record_pop_ave = zeros(ger,1);       % ��¼��Ⱥ��Ӧֵ��ƽ��ֵ



while iter <= ger

    %�������Ⱥ��ÿ���������Ӧֵ
    %factor = 2-2*(iter/ger);%�������
    %factor = 1-(iter/ger);%�������
    factor = 2-2*(1-(((ger-iter)/ger).^2)).^0.5;
    %factor = sin(((iter*pi)/ger)+pi/2)+1;
    r2 = rand(1);%�����
    A = factor*r2-factor;
    %C = 2 * r1;
    C1 = 2*rand(dimension,N);%�����
    C2 = 2*rand(dimension,N);
    C3 = 2*rand(dimension,N);
%     if abs(A)>1
%         disp('������Ⱥ������Χ��ȫ��');
%     else
%         disp('��Ⱥ����ΧȦ��С���ֲ�����');
%     end
    for k=1:sizepop
        sensor_mat(1,:) = wolf_pop(1,:,k);
        sensor_mat(2,:) = wolf_pop(2,:,k);
        wolf_fitness(k,1) = get_Grid_cover_unit_and_rate(sensor_mat) ; % ���嵱ǰ��Ӧ��
    end
    
    [fitness_order,order_index] = sort(wolf_fitness);%����Ӧֵ��������
    %����ֻ�Ǳ�����Ӧ������
    %�õ���һֻ��
    wolf_one = wolf_pop(:,:,order_index(sizepop,1));

    %�õ��ڶ�ֻ��
    
    wolf_two = wolf_pop(:,:,order_index(sizepop-1,1));
  
    
    %�õ�����ֻ��
    wolf_three = wolf_pop(:,:,order_index(sizepop-2,1));
    
   %������������Ⱥ
    for i=1:sizepop
        wolf_pop_temp(:,:,i) = wolf_pop(:,:,order_index(i,1));
    end
    wolf_pop = wolf_pop_temp;%�Ѿ���������Ⱥ
    pop_new = wolf_pop;


    %�Ȱ�5ֻ��õĸ�����һ��
    for j=1:5
        if rem(j,3)==1
            pop_new(:,:,j) = wolf_one;
        elseif rem(j,3)==2
            pop_new(:,:,j) = wolf_two;
        else
            pop_new(:,:,j) = wolf_three;
        end
    end
    
    [fitness_max_one,max_index_one] = max(wolf_fitness);
    record_ger(iter,1) = fitness_max_one;%����ô������ŵ���Ӧ��ֵ
    disp(iter);
%     disp(fitness_max_one);
    disp(wolf_fitness);
    if best_all_ger_fitness < fitness_max_one
        best_all_ger_fitness = fitness_max_one;
        best_indivi = wolf_pop(:,:,max_index_one);
    end
    
    sum_fitness = sum(wolf_fitness);
    record_pop_ave(iter,1) = sum_fitness/sizepop;%�������Ⱥ��ƽ����Ӧ��
    

 

    
   
    
    %ֻ��ǰsizepop-3��������и��� ��ֻ��õ�����Ȼ���浽��һ����Ⱥ
    for i=1:sizepop-3
        wolf_one_dis = (C1.*wolf_one - wolf_pop(:,:,i));
        wolf_two_dis = (C2.*wolf_two - wolf_pop(:,:,i));
        wolf_three_dis = (C3.*wolf_three - wolf_pop(:,:,i));
        
        X1 = wolf_one -  wolf_one_dis*A;
        X2 = wolf_two - wolf_two_dis*A;
        X3 = wolf_three - wolf_three_dis*A;
        for j=1:N
            %X1��Խλ����
            if X1(1,j)>pos_limit(1,2)
                X1(1,j) = wolf_one(1,j);
            end
            if X1(2,j)>pos_limit(1,2)
                X1(2,j) = wolf_one(2,j);
            end
            if X1(1,j)<pos_limit(1,1)
                X1(1,j) = wolf_one(1,j);
            end
            if X1(2,j)<pos_limit(1,1)
                X1(2,j) = wolf_one(2,j);
            end
            %x2λ�ø���
            if X2(1,j)>pos_limit(1,2)
                X2(1,j) = wolf_two(1,j);
            end
            if X2(2,j)>pos_limit(1,2)
                X2(2,j) = wolf_two(2,j);
            end
            if X2(1,j)<pos_limit(1,1)
                X2(1,j) = wolf_two(1,j);
            end
            if X2(2,j)<pos_limit(1,1)
                X2(2,j) = wolf_two(2,j);
            end
            %x3Խλ����
            if X3(1,j)>pos_limit(1,2)
                X3(1,j) = wolf_three(1,j);
            end
            if X3(2,j)>pos_limit(1,2)
                X3(2,j) = wolf_three(2,j);
            end
            if X3(1,j)<pos_limit(1,1)
                X3(1,j) = wolf_three(1,j);
            end
            if X3(2,j)<pos_limit(1,1)
                X3(2,j) = wolf_three(2,j);
            end
        end
        %�Ľ�  ͨ��λ��ռ��
    %         w1 = X1./(X1+X2+X3);
    %         w2 = X2./(X1+X2+X3);
    %         w3 = X3./(X1+X2+X3);
    %ͨ����Ӧֵռ��
    %         x1 = get_Grid_cover_unit_and_rate(X1);
    %         x2 = get_Grid_cover_unit_and_rate(X2);
    %         x3 = get_Grid_cover_unit_and_rate(X3);
    %         w1 = x1/(x1+x2+x3);
    %         w2 = x2/(x1+x2+x3);
    %         w3 = x3/(x1+x2+x3);
        
        p = randperm(N,1);
%         temp = (X1.*w1 + X2.*w2 + X3.*w3);
        temp = (X1+X2+X3)/3;
        for j=1:1
            %�ϰ��ﴦ��  ����Χ����  �Ҹ��ݱ��������з���  �� �¸�Ϊ2  ���Ҹ�Ϊ1
            if (temp(1,p(1,j))>=10&&temp(1,p(1,j))<=40) && (temp(2,p(1,j))>=5&&temp(2,p(1,j))<=25)%˵�����ϰ���������
            %Ҳ��Ҫ���ȵķ��� ���ȷ����ϰ������Χ 
                if rem(i,6)==1 || rem(i,6) == 5%��
                    temp(2,p(1,j)) = 25;
                elseif rem(i,6)==2 || rem(i,6) == 0%��
                    temp(2,p(1,j)) = 5;
                elseif rem(i,6)==3%��
                    temp(1,p(1,j)) = 10;
                elseif rem(i,6)==4%��
                    temp(1,p(1,j)) = 40;
                end
            end


            
            %�̶�����
            temp(:,1) = sensor_fix1;
            temp(:,2) = sensor_fix2;
            pop_new(:,p(1,j),i) = temp(:,p(1,j)); 
        end
        
        %�õ��µ���Ⱥ
%         %�Ըø������Խλ����
        for k=1:N
            if pop_new(1,k,i)> pos_limit(1,2)
                pop_new(1,k,i) = pos_limit(1,2);
            end
            if pop_new(2,k,i)>pos_limit(1,2)
                pop_new(2,k,i) = pos_limit(1,2);
            end
            if pop_new(1,k,i)< pos_limit(1,1)
                pop_new(1,k,i) = pos_limit(1,1);
            end
            if pop_new(1,k,i) < pos_limit(1,1)
                pop_new(1,k,i) = pos_limit(1,1);
            end
        end

    end

    pop_new(:,:,sizepop-2) = wolf_three;
    pop_new(:,:,sizepop-1) = wolf_two;
    pop_new(:,:,sizepop) = wolf_one;
    
    wolf_pop = pop_new;%������Ⱥ
    
    iter = iter+1;
end





figure(2);
plot(record_ger);
title('ÿ�������ŵ���Ӧֵ')

figure(3);
plot(record_pop_ave);
title('ÿ����Ⱥ��ƽ����Ӧֵ')


%�����mat�ļ�
save best_wolf1.mat best_indivi;

if get_connection(best_indivi)==1
    disp('��ͨ');
else
    disp('����ͨ');
end

figure(4);
draw_circle(best_indivi(1,:),best_indivi(2,:),iter);
title('�Ż���Ĳ���ͼ');
disp(['�����ʣ�',num2str(max(record_ger))]);


