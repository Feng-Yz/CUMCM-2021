clear all;
table = load('ԭʼָ������.txt');
table = table(2:403, 2:11);
table_standard = zscore(table);
P = cov(table_standard);
[M,D] = eig(P);
d = diag(D);
S_eig = sort(d,'descend');
m = fliplr(M);
i = 0;
j = 0;
% ��Ҫ�������Ӵ�С�ҵ��Ӻ͵�һ�γ���93%���������ֵ����
while i/sum(S_eig) < 0.93
    j = j + 1;
    i = i + S_eig(j);
end
[pc,latent,explained] = pcacov(P);
num = 5;
pc = pc.*(sign(sum(pc)));
dataframe = P * pc(:,[1:num]);
total_score = dataframe * explained(1:num)/100;
% �������ɷֵ÷ֲ����ս�������
[descend_score , number] = sort(total_score,'descend');
descend_score = descend_score';
number = number';
