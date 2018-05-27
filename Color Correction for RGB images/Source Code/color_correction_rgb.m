
% Read the image
A=imread('input.jpg');

% Seperate the Channels
R=A(:,:,1);
G=A(:,:,2);
B=A(:,:,3);

% Calculate Intensity Component
I=(R+G+B)/3;

% Invert the image
I_inverted=255-I;

% Apply Average Filter to obtain the Mask Image
h_average=fspecial('average',15);
M=imfilter(I_inverted,h_average);

% Color Correction for R channel
R_new=zeros(size(R));
[c_y, c_x,~] = size(R);
for j = 1:c_x
        for i = 1:c_y
            p=double(R(i,j));
            q=double(M(i,j));
            R_new(i,j,:)=int8(255*((p/255)^(2^((128-q)/128))));
        end
end

% Color Correction for G channel
G_new=zeros(size(G));
[c_y, c_x,~] = size(G);
for j = 1:c_x
        for i = 1:c_y
            p=double(G(i,j));
            q=double(M(i,j));
            G_new(i,j,:)=int8(255*((p/255)^(2^((128-q)/128))));
        end
end

% Color Correction for B channel
B_new=zeros(size(B));
[c_y, c_x,~] = size(B);
for j = 1:c_x
        for i = 1:c_y
            p=double(B(i,j));
            q=double(M(i,j));
            B_new(i,j,:)=int8(255*((p/255)^(2^((128-q)/128))));
        end
end

% Output Image
O=zeros(size(A));
O(:,:,1)=R_new;
O(:,:,2)=G_new;
O(:,:,3)=B_new;

% Convert the double output image to uint8
O=uint8(O);

% Plot the images
subplot(1,3,1), imshow(A), title('Original Image');
subplot(1,3,2), imshow(M), title('Mask');
subplot(1,3,3), imshow(O), title('Output Image');