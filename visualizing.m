clear all;,close all; % ���ׂẴO���[�o���ϐ�/�E�B���h������
X=load('iris4d.txt'); % iris4d.txt �̓ǂݍ���
[d,n]=size(X); % X �̎��� d �ƃT���v���� n ���擾
[V,D]=eig(cov(X')); %�����U�s��̌ŗL�lD�ƌŗL�x�N�g��V���擾
A=diag(D); %�ŗL�l�̑Ίp�v�f�̏c�x�N�g����A�Ɋi�[
[value,I]=sort(A,'descend'); %A���~���Ƀ\�[�g�����c�x�N�g��A�ƑΉ�����C���f�b�N�XI���擾
B=[V(:,I(1,:)),V(:,I(2,:))]; %���2�{�̌ŗL�x�N�g���̍s��B���쐬
C=mean(X,2); %�T���v�����ς�C�Ɋi�[
D=[]; %��̍s��D�쐬
%a�̒l��1����n�ω������ČJ��Ԃ�
for a=1:n
D=[D,B'*(X(:,a)-C)] %D�ɒǉ�
end
figure(1),clf,hold on,plot(D(1,1:50),D(2,1:50),'ro'); %D��1����50��ڂ�ԓ_�Ńv���b�g
plot(D(1,51:100),D(2,51:100),'go'); %D��50����100��ڂ�Γ_�Ńv���b�g
plot(D(1,101:150),D(2,101:150),'bo'); %D��101����150��ڂ�_�Ńv���b�g
axis square
r=[1 2 3 4] %�s��r�쐬
E=[] %��̍s��E�쐬
%k�̒l��1����4�ω������ČJ��Ԃ�
for k=r
o=0; %o��0�������ď�����
%i��1����k�܂ŕω������ČJ��Ԃ�
for i=1:k
o+=value(i,:); %o��i�Ԗڂɑ傫���ŗL�l�̒l�𑫂�
end
E=[E o]; %E��o�̒l��ǉ�����
end
p=0; %p��0�������ď�����
%j�̒l��1����d�܂ŕω������ČJ��Ԃ�
for j=1:d
p+=value(j,:); %p��j�Ԗڂɑ傫���ŗL�l�̒l�𑫂�
end
E=E/p; %E/p��E�Ɋi�[
figure(2),clf,hold on,plot(r,E,'g-'); %r��E�̒l���v���b�g���Ē����ŃO���t��`��
axis square