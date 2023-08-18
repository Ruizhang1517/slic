clc;
clear all;
close all;
%用Superpixels算法对图像进行分割
I=imread('12003.jpg');
 
%提取各顾色分量
B = double(I(:,:,3));
G = double(I(:,:,2));
R = double(I(:,:,1));
%种子点数量
num_seeds=100;
%最色与空间距离相关性
compactness=40;
%计算超像索
labels=SLIC(num_seeds,compactness,R,G,B);
%边界线检期  RunMe为matlab运行的主函数

points=FindAroundLine(labels);
%将边界点设置为白色
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

