% AprioriGen
% Generiert k-elementige Kandidaten des Apriori-Algorithmus.
%
% AUTHOR: 
%  Tobias Sibera
%
% INPUT:
%  Z: Item-Menge 
%
% OUTPUT:
%  C: Menge von k-elementigen Kandidaten
%
function C = AprioriGen(Z)
    N = size(Z, 1); % Anzahl Transaktionen
    k = sum(Z, 2);  % k ermitteln 
    C = [];   
    for (i = 1:N-1)
        z1 = Z(i,:);
        for (j = i+1:N)
            z2 = Z(j,:);
            if (AnfangGleich(z1, z2))
                C = [C; (z1 | z2)];
            end;
        end;
    end;
    
