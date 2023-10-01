org_im = imread('rose.jpg');
%adding noise by gaussian inbuilt function
meanNoise = 0;
varianceNoise = 0.15;
noise_im = imnoise(org_im, 'gaussian', meanNoise, varianceNoise);
%showing original image
subplot(1, 2, 1);
imshow(org_im);
title('Original Image');
%showing noised image
subplot(1, 2, 2);
imshow(noise_im);
title('Noised Image');

sigma_arr = 0.3:0.3:6; %taking diifferent values of sigma from 0.3 to 6 taking step length 0.3
psnr_arr = zeros(size(sigma_arr)); %initializing an array to store PSNR values

for i = 1:length(sigma_arr)
    sigma = sigma_arr(i);
    %applying Gaussian smoothing to filter the current noised image
    cleaned_im = imgaussfilt(noise_im, sigma);
    %showing the cleaned image
    subplot(5, 4, i); %for 20 images; 5 rows and 4 columns
    imshow(cleaned_im);
    title(['sigma = ' num2str(sigma)]); %for showing corresponding sigma at each image
    %calculating PSNR
    psnr_arr(i) = psnr(cleaned_im, noise_im);
end

Table = table(sigma_arr', psnr_arr', 'VariableNames', {'Sigma', 'PSNR'}); %making table for sigma and PSNR
disp(Table);  %for displaying the table
plot(sigma_arr, psnr_arr, '-o');  %for ploting the points with circled marking and joining them with the lines
xlabel('Sigma');
ylabel('PSNR');
title('Sigma vs PSNR');
grid on;



%for question 4 we do a model with help of linear regression::::::::
%finding mean and std deviation of sigma and psnr values
mean_sigma = mean(sigma_arr);
mean_PSNR = mean(psnr_arr);
std_deviation_sigma = std(sigma_arr);
std_deviation_PSNR = std(psnr_arr);
%calculating the Pearson correlation coefficient
correlation_coefficient = corrcoef(sigma_arr, psnr_arr);
%we know the correlation coefficient is in the (1,2) or (2,1) element of the matrix
r = correlation_coefficient(1, 2);
%coefficients of regression
b = (r * std_deviation_PSNR) / std_deviation_sigma;
a = mean_PSNR - b * mean_sigma;

%taking a set of x values containing sigma values randomly for predictions
x_values = [0.31,0.56,0.92,1.23,1.48,1.79,2.48,2.97,3.45,3.89,4.24,4.69,4.87,5.05,5.56,5.82];

%calculating the predicted psnr values with our model
predicted_PSNR = a + b * x_values;
%displaying the predicted psnr values
disp('Predicted psnr values:');
disp(predicted_PSNR);
