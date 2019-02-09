choiceA = questdlg('What would you like to do?','Choice...','Build Experiment','Run Experiment','Analyse Data','Build Experiment');

if strcmp(choiceA, 'Run Experiment')
    load(uigetfile())
else
    %% Define variables
    loadChoice = questdlg('Do you want to load previous design or create from scratch?', 'Design...', 'Load design', 'Create new design', 'Create new design');
    if strcmp(loadChoice, 'Create new design')
        Var = struct('Rep', {repVariables()}, 'Ind', {indVariables()});
        saveVar(Var)
    else
        load(uigetfile())
    end
    
    %% Build Experiment
    if strcmp(choiceA, 'Build Experiment')
        Exp = buildExperiment(Var);
        saveExp(Exp, Var)
    end
end
if strcmp(choiceA, 'Run Experiment')
    %% Run Experiment
    Data = runExperiment(Exp, Var);
    saveData(Data)
end
%% Analyse Data
if strcmp(choiceA, 'Analyse Data')
    inputData(Var)
    analyseData(Var)
end
