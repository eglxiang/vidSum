h = 480;
w = 854;
n = 148;
corr_ave = zeros((n-1),1);
list = dir();
for k=1:(n-1)
    corr_sum = 0;
    for i=1:(n-k)
        imgA = im2double(rgb2gray(imread(list(i+2).name)));
        imgAvec = reshape(imgA,[h*w,1]); % vectorize
        imgAvec = imgAvec / norm(imgAvec); % unit norm
        imgB = im2double(rgb2gray(imread(list(i+k+2).name)));
        imgBvec = reshape(imgB,[h*w,1]); % vectorize
        imgBvec = imgBvec / norm(imgBvec); % unit norm
        corr_sum = corr_sum + imgAvec'*imgBvec;
    end
    corr_ave(k) = corr_sum / (n-k);
end