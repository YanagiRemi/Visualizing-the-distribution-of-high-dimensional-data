clear all;,close all; % すべてのグローバル変数/ウィンドを消去
X=load('iris4d.txt'); % iris4d.txt の読み込み
[d,n]=size(X); % X の次元 d とサンプル数 n を取得
[V,D]=eig(cov(X')); %共分散行列の固有値Dと固有ベクトルVを取得
A=diag(D); %固有値の対角要素の縦ベクトルをAに格納
[value,I]=sort(A,'descend'); %Aを降順にソートした縦ベクトルAと対応するインデックスIを取得
B=[V(:,I(1,:)),V(:,I(2,:))]; %上位2本の固有ベクトルの行列Bを作成
C=mean(X,2); %サンプル平均をCに格納
D=[]; %空の行列D作成
%aの値を1からn変化させて繰り返す
for a=1:n
D=[D,B'*(X(:,a)-C)] %Dに追加
end
figure(1),clf,hold on,plot(D(1,1:50),D(2,1:50),'ro'); %Dの1から50列目を赤点でプロット
plot(D(1,51:100),D(2,51:100),'go'); %Dの50から100列目を緑点でプロット
plot(D(1,101:150),D(2,101:150),'bo'); %Dの101から150列目を青点でプロット
axis square
r=[1 2 3 4] %行列r作成
E=[] %空の行列E作成
%kの値を1から4変化させて繰り返す
for k=r
o=0; %oに0を代入して初期化
%iを1からkまで変化させて繰り返す
for i=1:k
o+=value(i,:); %oにi番目に大きい固有値の値を足す
end
E=[E o]; %Eにoの値を追加する
end
p=0; %pに0を代入して初期化
%jの値を1からdまで変化させて繰り返す
for j=1:d
p+=value(j,:); %pにj番目に大きい固有値の値を足す
end
E=E/p; %E/pをEに格納
figure(2),clf,hold on,plot(r,E,'g-'); %rとEの値をプロットして直線でグラフを描画
axis square