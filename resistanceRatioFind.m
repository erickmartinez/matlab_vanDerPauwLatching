function [Q] = resistanceRatioFind(V1,V2,V3,V4,AorB)
% Finds the resistance ratio needed for the vanDerPauw calculation 
%
% Parameters
% ----------
% V1: double
%   if 'A', V21,34 else V43,12 (Volts)
% V2: double
%   if 'A', V12,34 else V34,12 (Volts)
% V3: double
%   if 'A', V32,41 else V14,23 (Volts)
% V4: double
%   if 'A', V23,41 else V41,23 (Volts)
% AorB: string
%   A for QA, B for QB
% Returns
% -------
% Q: double
%   The value for QA or QB

    if strcmp(AorB,'A')
%         V1 = V21,34
%         V2 = V12,34
%         V3 = V32,41
%         V4 = V23,41
        Q = (V1-V2)/(V3-V4);
    elseif strcmp(AorB,'B')
%         V1 = V43,12
%         V2 = V34,12
%         V3 = V14,23
%         V4 = V41,23
        Q = (V1-V2)/(V3-V4);
    end
end