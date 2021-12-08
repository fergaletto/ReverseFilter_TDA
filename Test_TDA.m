% Created 18/06/2021
% Fernando J. Galetto


close all
clear all

% Filter to reverse
f= @(in) imfilter(in,fspecial('disk',5));

% number of iteration
max_iter = 1000;

% load image
imgname = 'emma_small.png';
I = im2double(imread(imgname));
I=imresize(I, 0.7);
I= max(min(I, 1),0);
[H, W, C] = size(I);

 
   
PSNR = zeros(max_iter,1);  

% Input image. 
y=f(I);

% set learning rate    
alpha = 1;
        
% Initialize x, 
x= y;

% Apply TDA method
for n=1 : max_iter
    fx = f(x);
    h = y - fx;
    g = f(x+h) - fx;  
    x = x + alpha .* g;         
    PSNR(n) = psnr(x, I); 
end

% Display results
figure(1)
imshow([I, y, x])

% Plot PSNR vs Iterations
figure(2)
plot(PSNR, 'linewidth', 1)
xlim([0, max_iter])
xlabel('Iterations', 'Interpreter', 'latex',  'FontSize', 12);
ylabel( 'PSNR [dB]', 'Interpreter', 'latex', 'FontSize', 12); 
grid on
