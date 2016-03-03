% AnfangGleich
% Prueft die letzten beiden Items zweier Item-Mengen auf ungleichheit.
%
% AUTHOR: 
%  Tobias Sibera
%
% INPUT:
%  z1: Erste zu vergleichende Item-Menge
%  z2: Zweite zu vergleichende Item-Menge
%
% OUTPUT:
%   a: Enthaelt 1, solange sich beide Item-Mengen nur in den letzten beiden Items unterscheiden, andernfalls 0
%
function a = AnfangGleich(z1, z2)
    k = sum(z1);
    if (k == 0)
        a = 1;
        return;
    end;
    
    s = min( find(z1, 1, 'last'), find(z2, 1, 'last') ) - 1;
    if ( sum( ( z1(1:s) & z2(1:s) ) ) == (k-1) )
        a = 1;
    else
        a = 0;
    end;
    
