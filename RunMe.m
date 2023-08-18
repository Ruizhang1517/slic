clc;
clear all;
close all;
%��Superpixels�㷨��ͼ����зָ�
I=imread('12003.jpg');
 
%��ȡ����ɫ����
B = double(I(:,:,3));
G = double(I(:,:,2));
R = double(I(:,:,1));
%���ӵ�����
num_seeds=100;
%��ɫ��ռ���������
compactness=40;
%���㳬����
labels=SLIC(num_seeds,compactness,R,G,B);
%�߽��߼���  RunMeΪmatlab���е�������

points=FindAroundLine(labels);
%���߽������Ϊ��ɫ
while ~isempty(points)
    p=points(1,:);
    R(p(1),p(2))=255;
    G(p(1),p(2))=255;    
    B(p(1),p(2))=255;    
    points(1,:)=[];
end
I(:,:,1)=R;
I(:,:,2)=G;
I(:,:,3)=B;
imshow(I)
% imwrite(I,'D:\Gray Files\10-52-Superpixel.tif','tif');

