clear all;,close all; % すべてのグローバル変数/ウィンドを消去
X=load('iris4d.txt'); % iris4d.txt の読み込み
[d,n]=size(X); % X の次�? d とサンプル数 n を取�?
[V,D]=eig(cov(X')); %共�?��行�?の固有�?�Dと固有�?クトルVを取�?
A=diag(D); %固有�?�の対角要�?の縦ベクトルをAに格�?
[value,I]=sort(A,'descend'); %Aを降�?��ソートした縦ベクトルAと対応するイン�?��クスIを取�?
B=[V(:,I(1,:)),V(:,I(2,:))]; %上�?2本の固有�?クトルの行�?Bを作�?
C=mean(X,2); %サンプル平�?��Cに格�?
D=[]; %空の行�?D作�?
%aの値�?1からn変化させて繰り返す
for a=1:n
D=[D,B'*(X(:,a)-C)] %Dに追�?
end
figure(1),clf,hold on,plot(D(1,1:50),D(2,1:50),'ro'); %Dの1から50列目を赤点でプロ�?��
plot(D(1,51:100),D(2,51:100),'go'); %Dの50から100列目を緑点でプロ�?��
plot(D(1,101:150),D(2,101:150),'bo'); %Dの101から150列目を青点でプロ�?��
axis square
r=[1 2 3 4] %行�?r作�?
E=[] %空の行�?E作�?
%kの値�?1から4変化させて繰り返す
for k=r
o=0; %oに0を代入して初期�?
%i�?1からkまで変化させて繰り返す
for i=1:k
o+=value(i,:); %oにi番目に大きい固有�?�の値を足�?
end
E=[E o]; %Eにoの値を追�?する
end
p=0; %pに0を代入して初期�?
%jの値�?1からdまで変化させて繰り返す
for j=1:d
p+=value(j,:); %pにj番目に大きい固有�?�の値を足�?
end
E=E/p; %E/pをEに格�?
figure(2),clf,hold on,plot(r,E,'g-'); %rとEの値を�?ロ�?��して直線でグラフを描画
axis square