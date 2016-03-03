% Rules
% Einstiegspunkt fuer die Routine des Apriori-Algorithmus.
%
% AUTHOR: 
%  Tobias Sibera
%
% INPUT:
%        T: Datenbasis 
%   minSup: Minimaler Support-Wert (in Prozent)
%  minConf: Minimaler Confidence-Wert (in Prozent) 
%
% OUTPUT:
%        R: Menge aller Assoziationsregeln
%        L: Menge aller haeufigen Item-Mengen
%        S: Zugehoerige Support-Werte der haeufigien Item-Mengen
%        C: Zugehoerige Confidence-Werte der Assoziationsregeln
%
function [R, L, S, C] = Rules(T, minSup, minConf)
    [L, S] = Apriori(T, minSup);
    R = [];
    
    for (i = 1:size(L, 1))        
        Z = L(i,:);    
        [D, C] = AprioriReg(T, Z, minConf);
        
        for (i = 1:size(D, 1))
            W = Z - D(i,:); % Wenn-Teile aus Dann-Teilen
            R = [R; W, 9, D(i,:)];
        end;
        
    end;
    
