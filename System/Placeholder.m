Pedestal
% ex = Procedure;
% de = Design;
% rt = Routine;
% em = Element;
% f = Factors;

i = strcmp({pr.Tag}, 'For');
parent = [pr(i).Children];

i = strcmp({nodes.Tag}, 'For');
parent = [nodes(i).Children];