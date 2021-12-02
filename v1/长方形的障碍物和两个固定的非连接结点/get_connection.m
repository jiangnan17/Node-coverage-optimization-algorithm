%%�ж��Ƿ���ͨ
function is_connec = get_connection(sensor_mat)
global N;
global r;
global r1;

%ɾ���ϴε��ڽӾ����ļ�
delete('adjacencyMatrix_dis.mat');
delete('adjacencyMatrix.mat');

%%������ͨ��
adjacencyMatrix=zeros(N,N);%���崫���������ڽӾ���
adjacencyMatrix_dis=zeros(N,N);%���崫���������ڽӾ���
for i=1:1:N
    for j=(i+1):1:N   %��Ϊ�ж��ְ뾶  ��ͨ�ý��д���
        dis_squ = (sensor_mat(1,i)-sensor_mat(1,j))^2 +...
        (sensor_mat(2,i)-sensor_mat(2,j))^2;
                    %�Ѿ������
        if i==1 && j==2%����7.5��
            if dis_squ <= (2*r1)^2;%������֮����Ը�֪
                adjacencyMatrix(i,j)=1;%����ͼ
                adjacencyMatrix(j,i)=1;
                %�������
                adjacencyMatrix_dis(i,j)=dis_squ^0.5;%����ͼ
                adjacencyMatrix_dis(j,i)=dis_squ^0.5;
            end
        elseif i==1 && j~=2%��7.5��Ҳ��5��
            if  dis_squ <= (r + r1)^2;%������֮����Ը�֪
                adjacencyMatrix(i,j)=1;%����ͼ
                adjacencyMatrix(j,i)=1;
                
                 %�������
                adjacencyMatrix_dis(i,j)=dis_squ^0.5;%����ͼ
                adjacencyMatrix_dis(j,i)=dis_squ^0.5;
            end
        elseif i==2 && j>2%�и�7.5 ʣ�µĶ���5
            if dis_squ<=(r + r1)^2;%������֮����Ը�֪
                adjacencyMatrix(i,j)=1;%����ͼ
                adjacencyMatrix(j,i)=1;
                
                %�������
                adjacencyMatrix_dis(i,j)=dis_squ^0.5;%����ͼ
                adjacencyMatrix_dis(j,i)=dis_squ^0.5;
            end
        else%��ȫ��5��
            if dis_squ <= (2*r)^2;%������֮����Ը�֪
                adjacencyMatrix(i,j)=1;%����ͼ
                adjacencyMatrix(j,i)=1;
                
                %�������
                adjacencyMatrix_dis(i,j)=dis_squ^0.5;%����ͼ
                adjacencyMatrix_dis(j,i)=dis_squ^0.5;
            end
        end
    end
end 

%�������һ�ε�����ͼ�ڽӾ���
save adjacencyMatrix_dis.mat adjacencyMatrix_dis;
save adjacencyMatrix.mat adjacencyMatrix;
S=zeros(N,N);
for m=1:1:N-1
    S=S+adjacencyMatrix^m;  %ȫ���ӵ�S
end;

%S=M+M^2+M^3+...+M^(N-1)��
%����N��M������������
%��S����Ԫ��Ϊ�㣬����ͨ��
%S�����㣬����ͨ��
%�������ڽӾ���ͼ����ͨ���ж�׼�򡷲鵽��
is_connec = 0;%��ʼ��Ϊ����ͨ
if all(all(S))==1 %�ж�S�����ǲ���ȫΪ����Ԫ��
    is_connec = 1;%ȫΪ��0  ����ͨ
end
end