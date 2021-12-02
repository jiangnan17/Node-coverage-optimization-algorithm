%%��Բ
function draw_circle(x_pos,y_pos,iter)
global N;
global L;
global W;
global r;
global r1;%��İ뾶
global Grid_cen_x;
global Grid_cen_y;
global ger;
angle=0:pi/100:2*pi;%�Ƕ�
for k=1:N
    plot(x_pos(k),y_pos(k),'.','MarkerSize',10);%��Բ��  %�Ȼ�Բ�� �ٻ�Բ  ��Ȼ����һ��  ��֪զ���
    %�ұ�
    if rem(k,4)==1
        text(x_pos(k)+0.5,y_pos(k),'N','FontSize',15);%���б��
        text(x_pos(k)+2,y_pos(k)-0.5,num2str(k),'FontSize',10);%���б��
    elseif rem(k,4)==2%�ұ�
        text(x_pos(k)-2.5,y_pos(k),'N','FontSize',15);%���б��
        text(x_pos(k)-1,y_pos(k)-0.5,num2str(k),'FontSize',10);%���б��
    elseif rem(k,4)==3
        %�ϱ�
        text(x_pos(k)- 0.5,y_pos(k)+ 1.5,'N','FontSize',15);%���б��
        text(x_pos(k)+1,y_pos(k)+0.5,num2str(k),'FontSize',10);%���б��
    else%�±�
        text(x_pos(k)-0.5,y_pos(k)-1.5,'N','FontSize',15);%���б��
        text(x_pos(k)+1,y_pos(k)-2,num2str(k),'FontSize',10);%���б��
    end
    hold on;%�������  ��Ȼ��һ��Բ��
    if k==1||k==2
        plot(r1*cos(angle)+x_pos(k),r1*sin(angle)+y_pos(k),'r','LineWidth',2);
    else
        plot(r*cos(angle)+x_pos(k),r*sin(angle)+y_pos(k));%��Բ
    end
    axis([0,50,0,50]);%����������С�����ֵ  
    set(gca,'xtick',(0:1:50));%����x���경��Ϊ1
    set(gca,'ytick',(0:1:50));%����y���경��Ϊ1   ���и����� ����������̫������
    axis square;%ʹ���ݱ���Ϊ1  ����Բ����Բ  ��Ȼ����Բ
    grid on;%����
    hold on;%��ͼһֱ��������
end
% ���������ĵ��ͼ������
% for i=1:L/1
%     for j=1:W/1
%         plot(Grid_cen_x(i),Grid_cen_y(j),'.','MarkerFaceColor','r');
%         hold on;%��ͼһֱ��������
%     end
% end

%��Ҳ��һ�ֻ������εķ���
% line([20,30],[30,30],'linewidth',4,'color','r');
% line([30,30],[30,20],'linewidth',4,'color','r');
% line([20,30],[20,20],'linewidth',4,'color','r');
% line([20,20],[20,30],'linewidth',4,'color','r');

%������
% rectangle('Position',[15,10,20,10],...%���½�����ͱ߳�
% 'LineWidth',2,'LineStyle','-');
% x1=[15 15 35 35];%����ֱ�Ϊ  ��20,30)  (30,30)..
% y1=[10 20 20 10];
% fill(x1,y1,'b')%����������䣬����ûʵ��  ���õ�applyhatch���� 

% ������
% line([15,35],[10,10],'linewidth',4,'color','r');
% line([35,30],[10,40],'linewidth',4,'color','r');
% line([30,20],[40,40],'linewidth',4,'color','r');
% line([20,15],[40,10],'linewidth',4,'color','r');
x1 = [15,35,35,30,30,20,20,15];
y1 = [10,10,10,40,40,40,40,10];
line(x1,y1,'LineWidth',1,'LineStyle','-','color','k');
fill(x1,y1,'b');
hold on;

%��������
% x = [25,15,35,25];%��ȥ��һ���ߣ����Ե��ĸ���
% y = [50,30,30,50];
% line(x,y,'LineWidth',2,'LineStyle','-');
%fill(x,y,'b')%��ɫ���


if iter-1 == ger
    load adjacencyMatrix_dis.mat;
    load adjacencyMatrix.mat;
%     disp('Ȩ��');
%     disp(adjacencyMatrix_dis);
%     disp('�Ƿ���ڱ�');
%     disp(adjacencyMatrix);
%     pause(10);
    [weight_sum, span_tree] = kruskal(adjacencyMatrix, adjacencyMatrix_dis);
    [row,colu] = size(span_tree);%�õ�span_tree�ĺ�������
%     disp('row');
%     disp(row);
%     disp('colu');
%     disp(colu);
%     disp('span_tree');
%     disp(span_tree);
    %ע��line��д��
    for i=1:row
        line([x_pos(1,span_tree(i,1)),x_pos(1,span_tree(i,2))],[y_pos(1,span_tree(i,1)),y_pos(1,span_tree(i,2))]...
           ,'LineWidth',2);
    end
    disp('��С����������ȨֵΪ');
    disp(weight_sum);
end
hold on;
end