
% Read the image
A=imread('input.jpg');

% Convert the image into grayscale if it is rgb
if ndims(A) == 3
    A = rgb2gray(A);
end

% Invert the image 
A_inverted=255-A;

% Apply Average Filter
h_average=fspecial('average',15);
A_mask=imfilter(A_inverted,h_average);

% Output Image
O=zeros(size(A));
[c_y, c_x,~] = size(O);

% Color Correction
for j = 1:c_x
        for i = 1:c_y
            p=double(A(i,j));
            q=double(A_mask(i,j));
            O(i,j,:)=int8(255*((p/255)^(2^((128-q)/128))));
        end
end

% Convert the double output image to uint8
O=uint8(O);

% Plot the images
subplot(1,3,1), imshow(A), title('Original Image');
subplot(1,3,2), imshow(A_mask), title('Mask');
subplot(1,3,3), imshow(O), title('Output Image');