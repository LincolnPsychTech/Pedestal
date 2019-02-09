function indVar = indVariables()
noVariables = inputdlg('Number of independent measures factors...'); %number of variables
noVariables = str2num(noVariables{:});

%if they put 0 make it a single condition experiment
if noVariables == 0 | isempty(noVariables) | ~exist('noVariables')
    noVariables = 1;
else
    
    %Name factors and specify no. of levels
    for variable = 1:noVariables
        varTemp = inputdlg({'Factor name...', 'Number of levels'}, ['Var ' num2str(variable)]);
        varNames{variable} = varTemp{1};
        varLevels(variable) = str2num(varTemp{2});
        varType{variable} = 'Independent Measures';
    end
end

%Name levels
for variable = 1:noVariables
    for n = 1:varLevels(variable)
        condPlaceholder{n} = ['Level ' num2str(n)];
    end
    choice = questdlg(['Define levels of ' varNames(variable)], 'Define levels', ...
        'Continue', 'Cancel');
    if choice == 'Continue'
        conditions{variable} = inputdlg(condPlaceholder, 'Define conditions...');
    else
    end
end

%Package output
indVar = struct('FactorName', varNames, 'Levels', conditions);