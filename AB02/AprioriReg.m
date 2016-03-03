% AprioriReg
% Findet in der uebergebenen Datenbasis sowie der haeufigen Transaktionen anhand des minimalen Confidence-Wertes saemtliche Assoziationsregeln.
%
% AUTHOR: 
%  Tobias Sibera
%
% INPUT:
%        T: Datenbasis
%        Z: Item-Menge
%  minConf: Minimaler Confidence-Wert (in Prozent)
%
% OUTPUT:
%        D: Menge aller gefundenen Assoziationsregeln
%    Confs: Zugehoerige Confidence-Werte der Assoziationsregeln
%
function [D, Confs] = AprioriReg(T, Z, minConf)  
    [M, N] = size(T);
    E = eye(N);
    D = [];
    DOld = [];
    Confs = [];
    az = Anzahl(T, Z);
        
    % Einelementige Item-Mengen bestimmen
    for (i = 1:N)
        X = Z - E(i,:);
        if (find(X < 0))
            continue;
        end;
        ay = minConf * Anzahl(T, X);
        if (az >= ay)
            t = zeros(1,N);
            t(1,i) = 1;
            DOld = [DOld; t];
            Confs = [Confs; ay];
        end;
    end;
    D = DOld;
    
    % N-Elementige Item-Mengen bestimmen
    for (k = 2:N)          
        C = AprioriGen(DOld);
        DOld = [];
        
        for (i = 1:size(C, 1))
            X = Z - C(i,:);
            if (find(X < 0))
                continue;
            end;
            ay = minConf * Anzahl(T, X);
            if (az >= ay)
                DOld = [DOld; C(i,:)];
                Confs = [Confs; ay];
            end;
        end;
        
        D = [D; DOld];
    end;
    
