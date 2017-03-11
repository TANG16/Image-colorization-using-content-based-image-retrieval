function nb = neighbor(im, pos)
% ���������ı�׼��               %
% im = ͼ�� pos = ������λ������ %
[x, y] = size(im);
[xt, yt] = size(im);
N = length(pos(1,:));
% std_c = zeros(N,1); % ��׼��
nb = zeros(25,N);
neighbor = zeros(25,1);
for r = 1:N 
    neighbor = 0;
    % �ĸ����ϵĵ㣬����ȡΪ5*5
    if pos(2,r) <= 2 && pos(1,r) <= 2
        neighbor = reshape(im(1:5, 1:5), 25, 1);
    elseif pos(2,r) <= 2 && pos(1,r) >= x-1
        neighbor = reshape(im(x-4:x, 1:5), 25, 1);
    elseif pos(2,r) >= y-1 && pos(1,r) >= x-1
        neighbor = reshape(im(x-4:x, y-4:y), 25, 1);
    elseif pos(2,r) >= y-1 && pos(1,r) <= 2
        neighbor = reshape(im(1:5, y-4:y), 25, 1);
    % ��Ϊ2pixel�ı��ϣ�����ȡΪ5*5
    elseif pos(1,r)<=2
        neighbor = reshape(im(1:5, pos(2,r)-2:pos(2,r)+2), 25, 1);
    elseif pos(1,r)>=x-1
        neighbor = reshape(im(x-4:x, pos(2,r)-2:pos(2,r)+2), 25, 1); 
    elseif pos(2,r)<=2
        neighbor = reshape(im(pos(1,r)-2:pos(1,r)+2, 1:5), 25, 1);
    elseif pos(2,r)>=y-1
        neighbor = reshape(im(pos(1,r)-2:pos(1,r)+2, y-4:y), 25, 1);
    else % �Ǳ�Ե�㣬����Ϊ5*5
        neighbor = reshape(im(pos(1,r)-2:pos(1,r)+2, pos(2,r)-2: pos(2,r)+2), 25, 1);
    end
    nb(:,r) = neighbor;
end