function [imF] = PseudoColorization(imS,imT)

%imS=imread('201.jpg');  %source image
%imT=imread('202.jpg');  %grayscale image

colorTransform = makecform('srgb2lab');% RGB space to LAB space
labS = applycform(imS, colorTransform);

L_ImageS = labS(:, :, 1);  % extract the L image.L stands for luminance of source image
A_ImageS = labS(:, :, 2);  % extract the A image.
B_ImageS = labS(:, :, 3);  % extract the B image.

[sx sy] = size(L_ImageS); 
[tx ty] = size(imT); 

L_S_c = cast(L_ImageS,'double');

imF=zeros(tx,ty,3); 
imF(:,:,1)=imT; % load grayscale image into the Luminance part of the final
%image 

disp('Please wait..................');
% find closet pixel in L with grayscale pixel, give A and B pixel to final
% image
for i = 1 : tx
    for j = 1 : ty
        Lum = ones(sx,sy)*imF(i,j,1);
        temp = Lum - L_S_c;
        temp=abs(temp);
        [M I]=min(temp(:));
        [K, L] = ind2sub(size(temp),I);  
        imF(i, j, 2) = A_ImageS(K,L);
        imF(i, j, 3) = B_ImageS(K,L);
    end
end
imF=cast(imF,'uint8');
colorTransform = makecform('lab2srgb');  % LAB space to RGB space
imF = applycform(imF, colorTransform);
%imshow(imF); % the colored grayscale image



end

