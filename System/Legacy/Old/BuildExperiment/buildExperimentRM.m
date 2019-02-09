function Exp = buildExperimentRM(Var)
%% Specify number of blocks
totalBlocks = inputdlg('How many blocks would you like?');
totalBlocks = str2num(totalBlocks{:});

%Make sure that's enough blocks
if isnumeric(totalBlocks) && length(totalBlocks) == 1
else
    error('Please provide a single integer as the total number of blocks.')
end
for variable = 1:length(Var)
    varLevels(variable) = length(Var(variable).Levels);
end
minBlocks = prod(varLevels);
while totalBlocks < minBlocks
    totalBlocks = inputdlg(['That is not enough blocks for your design. You will need at least ' num2str(minBlocks) 'blocks:']);
    totalBlocks = str2num(totalBlocks{:});
end

%% Block builder
%This is the equivalent of selecting a block in the UI
blockNoDlg = strread(num2str(1:totalBlocks),'%s');
blockNo = listdlg('PromptString','Which block?', 'ListString', blockNoDlg, 'SelectionMode', 'single');
%Build block
[blockType{blockNo}, blockInfo{blockNo}] = buildBlock();

%Assign block to a condition
%this is the equivalent of the pillar interface
for factor = 1:length(Var) %NTS: Use factor in data output
    blockConditionTemp{factor} = listdlg('PromptString',['Which level of ' Var(factor).FactorName ' is this block in?'], 'ListString', Var(factor).Levels, 'SelectionMode', 'single');
    blockCondition{blockNo} = blockConditionTemp;
end
Exp = struct('BlockType', blockType, 'BlockCondition', blockCondition,'BlockInfo', blockInfo);