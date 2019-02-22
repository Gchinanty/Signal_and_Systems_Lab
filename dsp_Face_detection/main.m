%% ��� %%%%%%%%%%%%%%%%%%
% ΢��������ϵͳ���2___�ۺ����2
% ��֤��ɫ����㷨ԭ��
% �人��ѧ������ϢѧԺ ׿����
% ����2016��      ����
% email: whu_guoyang@whu.edu.cn
%
%%%%%%%%%%%%%%%%%%%%%%%%

%% ��ʼ��
clc
clear all

%% �����������н��
face_detection(imread('./original_picture/original_person.jpg'));

%% ��ɫ����㷨����
% ����ͼƬ��Ϣ
function result = face_detection(color_img)
% ��ͼƬת���ɾ��󲢶�ȡ��С��Ϣ
[M,N,~] = size(color_img);
% RGB��Ϣ��ȡ
R=color_img( :, :, 1);
G=color_img( :, :, 2);
B=color_img( :, :, 3);
flame_logical = [] ;
% ���ѭ��
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
% ������洢
result = [];
result(:,:,1) = uint8(double(R).*flame_logical);
result(:,:,2) = uint8(double(G).*flame_logical);
result(:,:,3) = uint8(double(B).*flame_logical);
% �������תǿ��
result_change = [];
result_change(:,:,1) = uint8(double(R).*(~flame_logical));
result_change(:,:,2) = uint8(double(G).*(~flame_logical));
result_change(:,:,3) = uint8(double(B).*(~flame_logical));

% ��ɫ���������
imwrite((uint8(result)), './result/result.jpg');
imwrite((uint8(result_change)), './result/intensifing_result.jpg');
% ��ʾ���
figure('NumberTitle', 'off', 'Name', '��ɫ���');
subplot(1,3,1);
imshow(color_img);
title('ԭʼͼƬ','FontSize',16);
subplot(1,3,2);
imshow(result);
title('������ͼƬ','FontSize',16);
subplot(1,3,3);
imshow(result_change);
title('�����תǿ��ͼƬ','FontSize',16);

end