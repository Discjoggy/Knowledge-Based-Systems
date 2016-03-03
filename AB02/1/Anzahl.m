% Anzahl
% Gibt die Anzahl der Vorkommen in der Datenbasis T enthaltenen Item-Mengen z an.
%
% AUTHOR: 
%  Tobias Sibera
%
% INPUT:
%  T: Datenbasis
%  z: Zu zaehlende Item-Menge
%
% OUTPUT:
%  a: Anzahl der Vorkommen von z
%
function a = Anzahl(T, z)
    a = sum( (T * z') == sum(z) );
    
