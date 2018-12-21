function expCondition = buildExperimentIM(Var)
experimentNo = 1;
expCondition = [];
%Get total number of conditions
for variable = 1:length(Var)
    varLevels(variable) = length(Var(variable).Levels);
end
totalConditions = prod(varLevels);

%Assign experiments to conditions
%this is the equivalent of the pillar interface
while length(expCondition) < totalConditions
for factor = 1:length(Var) %NTS: Use lvl in data output
    expCondition(experimentNo,factor) = listdlg('PromptString',['Which level of ' Var(factor).FactorName ' is experiment ' num2str(experimentNo) ' in?'], 'ListString', Var(factor).Levels, 'SelectionMode', 'single');
end
experimentNo = experimentNo + 1;
end