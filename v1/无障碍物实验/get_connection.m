%%�ж��Ƿ���ͨ
function is_connec = get_connection(sensor_mat)
global N;
global r;
%%������ͨ��
adjacencyMatrix=zeros(N,N);%���崫���������ڽӾ���
for i=1:1:N
    for j=(i+1):1:N
        if (sensor_mat(1,i)-sensor_mat(1,j))^2 +...
                (sensor_mat(2,i)-sensor_mat(2,j))^2<=(2*r)^2;%������֮����Ը�֪
            adjacencyMatrix(i,j)=1;%����ͼ
            adjacencyMatrix(j,i)=1;
        end
    end
end 
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