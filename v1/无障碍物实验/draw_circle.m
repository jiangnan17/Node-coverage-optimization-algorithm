%%��Բ
function draw_circle(x_pos,y_pos)
global N;
global L;
global W;
global r;
global Grid_cen_x;
global Grid_cen_y;
angle=0:pi/100:2*pi;%�Ƕ�
for k=1:N
    plot(x_pos(k),y_pos(k),'.');%��Բ��  %�Ȼ�Բ�� �ٻ�Բ  ��Ȼ����һ��  ��֪զ���
    plot(r*cos(angle)+x_pos(k),r*sin(angle)+y_pos(k));%��Բ
    axis([0,50,0,50]);%����������С�����ֵ
    set(gca,'xtick',(0:1:50));%����x���경��Ϊ1
    set(gca,'ytick',(0:1:50));%����y���경��Ϊ11
    axis square;%ʹ���ݱ���Ϊ1  ����Բ����Բ  ��Ȼ����Բ
    grid on;%����
    hold on;%��ͼһֱ��������
end
%���������ĵ��ͼ������
% for i=1:L/1
%     for j=1:W/1
%         plot(Grid_cen_x(i),Grid_cen_y(j),'.','MarkerFaceColor','r');
%         hold on;%��ͼһֱ��������
%     end
% end
end