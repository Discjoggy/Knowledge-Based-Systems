% Apriori
% Findet in der uebergebenen Datenbasis anhand des minimalen Support-Wertes saemtliche haeufige Item-Mengen.
%
% AUTHOR: 
%  Tobias Sibera
%
% INPUT:
%        T: Datenbasis
%  minSupp: Minimaler Support-Wert (in Prozent)
%
% OUTPUT:
%        L: Menge aller haeufigen Item-Mengen
%        S: Zugehoerige Support-Werte der haeufigien Item-Mengen
%
function [L, S] = Apriori(T, minSupp)
    [M, N] = size(T); % Transaktions- / Itemanzahl
    realMinSupp = M * minSupp; % Temporär berechneter MinSupp
    E = eye(N);
    S = [];
    L = [];
    LOld = [];
    
    % Einelementige Item-Mengen bestimmen
    for (i = 1:N)
        a = Anzahl(T, E(i,:));
        if (a >= realMinSupp)
            S = [S; (a / M)];
            t = zeros(1,N);
            t(1,i) = 1;
            LOld = [LOld; t];
        end;
    end;
    L = LOld;
    
    % N-Elementige Item-Mengen bestimmen
    for (k = 2:N)        
        C = AprioriGen(LOld);
        LOld = [];
        
        for (i = 1:size(C, 1))
            a = Anzahl(T, C(i,:));
            if (a >= realMinSupp)
                S = [S; (a / M)];
                C(i,:);
                LOld = [LOld; C(i,:)];
            end;
        end;
        
        L = [LOld; L];
    end;
    
