%% 简介 %%%%%%%%%%%%%%%%%%
% 微处理器与系统设计2___综合设计2
% 验证肤色检测算法原理
% 武汉大学电子信息学院 卓工班
% 本科2016级      郭洋
% email: whu_guoyang@whu.edu.cn
%
%%%%%%%%%%%%%%%%%%%%%%%%

%% 初始化
clc
clear all

%% 主函数，运行结果
face_detection(imread('./original_picture/original_person.jpg'));

%% 肤色检测算法函数
% 读入图片信息
function result = face_detection(color_img)
% 将图片转换成矩阵并读取大小信息
[M,N,~] = size(color_img);
% RGB信息读取
R=color_img( :, :, 1);
G=color_img( :, :, 2);
B=color_img( :, :, 3);
flame_logical = [] ;
% 检测循环
for i=1:M
    for j =1:N
        if ((R(i,j) > 95 && G(i,j)>40 && B(i,j) > 20 &&...
                (max(B(i,j), max(G(i,j), R(i,j))) - min(B(i,j), min(G(i,j), R(i,j))) > 15) &&...
                abs(R(i,j) - G(i,j)) > 15 &&  R(i,j)> G(i,j) && G(i,j) > B(i,j)) ||...
                (R(i,j) > 200 && G(i,j) > 210 && B(i,j) > 170 && abs(R(i,j) - G(i,j)) <= 15 &&...
                R(i,j) > B(i,j) &&  G(i,j) > B(i,j)))
                flame_logical(i,j) = 1;
        else
                flame_logical(i,j) = 0;
        end
    end
end
% 检测结果存储
result = [];
result(:,:,1) = uint8(double(R).*flame_logical);
result(:,:,2) = uint8(double(G).*flame_logical);
result(:,:,3) = uint8(double(B).*flame_logical);
% 检测结果翻转强化
result_change = [];
result_change(:,:,1) = uint8(double(R).*(~flame_logical));
result_change(:,:,2) = uint8(double(G).*(~flame_logical));
result_change(:,:,3) = uint8(double(B).*(~flame_logical));

% 肤色检测结果保存
imwrite((uint8(result)), './result/result.jpg');
imwrite((uint8(result_change)), './result/intensifing_result.jpg');
% 显示结果
figure('NumberTitle', 'off', 'Name', '肤色检测');
subplot(1,3,1);
imshow(color_img);
title('原始图片','FontSize',16);
subplot(1,3,2);
imshow(result);
title('处理后的图片','FontSize',16);
subplot(1,3,3);
imshow(result_change);
title('处理后翻转强化图片','FontSize',16);

end