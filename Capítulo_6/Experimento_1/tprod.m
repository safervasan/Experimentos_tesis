
function C = tprod(A,B)

% Esta función determina el t-producto de dos tensores de tercer orden

% Entradas: tensor A de tamaño m x n x p
%           tensor B de tamaño n x r x p

% Salidas: tensor C de tamaño m x r x p

    [m1,~,p]=size(A);
    n2=size(B,2);
    At=fft(A,[],3);
    Bt=fft(B,[],3);
    Ct=zeros(m1,n2,p);
    for i=1:p
        Ct(:,:,i)=At(:,:,i)*Bt(:,:,i);
    end
    C=ifft(Ct,[],3);
    
end