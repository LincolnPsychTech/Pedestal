function Exp = buildExperiment(Var)
%Assign experiments to conditions of IM factors
expCondition = buildExperimentIM(Var.Ind);

%Build each experiment
for experimentNo = 1:length(expCondition)
    conditionName{experimentNo} = [];
    for fac = 1:length(Var.Ind)
        conditionName{experimentNo} = [conditionName{experimentNo} Var.Ind(fac).Levels{expCondition(experimentNo,fac)} ' '];
    end
    choice = questdlg(['Build experiment ' ], 'Build experiment', ...
        'Continue', 'Cancel');
    if choice == 'Continue'
        experiment{experimentNo} = buildExperimentRM(Var.Rep);
    else
    end
end
    
Exp = struct('ConditionIndex', {expCondition}, 'ConditionText', conditionName, 'Experiment', experiment);
