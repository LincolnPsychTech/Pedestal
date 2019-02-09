function runExperiment(Exp, Var)
%Choose condition
condition = listdlg('PromptString','Select condition...', 'ListString', {Exp(:).ConditionText}, 'SelectionMode','single');

%Get information about monitor setup
monPos = get(0, 'MonitorPositions');
for n = 1:length(monPos(:,1))
    monitors{n} = num2str(n);
end
temp = Screen('Resolution', 2);
windowNo = listdlg('PromptString','Select window...', 'ListString', monitors, 'SelectionMode','single');
%Open window
display = Screen('OpenWindow', windowNo);

for block = 1:length(Exp(condition).Experiment)
    %Record conditions this block is in
    Data.IMCondition = Exp(condition).ConditionText;
    Data.RMCondition = Exp(condition).Experiment(block).BlockCondition;
    
    %Run block
    if strcmp(Exp(condition).Experiment(block).BlockType, 'Adaptation')
        Data.Data{block} = runAdaptationBlock(Exp(condition).Experiment(block).BlockInfo);
    end
    
    if strcmp(Exp(condition).Experiment(block).BlockType, 'Custom')
        Data.Data{block} = runCustomBlock(Exp(condition).Experiment(block).BlockInfo);
    end
    
    if strcmp(Exp(condition).Experiment(block).BlockType, 'Super Custom')
        Data.Data{block} = runSuperCustomBlock(Exp(condition).Experiment(block).BlockInfo);
    end
end