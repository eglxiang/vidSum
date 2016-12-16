h = 480;
w = 854;
n = 148;
N = n*(n-1)/2;
corr = zeros(N,1);
list = dir();
c = 0; %index count
for i=1:n
    imgA = im2double(rgb2gray(imread(list(i+2).name)));
    imgAvec = reshape(imgA,[h*w,1]); % vectorize
    imgAvec = imgAvec / norm(imgAvec); % unit norm
    for j=(i+1):n
        imgB = im2double(rgb2gray(imread(list(j+2).name)));
        imgBvec = reshape(imgB,[h*w,1]);
        imgBvec = imgBvec / norm(imgBvec);
        c = c+1;        
        corr(c) = imgAvec' * imgBvec;
    end
end