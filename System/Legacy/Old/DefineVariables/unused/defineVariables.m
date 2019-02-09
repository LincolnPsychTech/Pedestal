function Var = defineVariables()



 
% % %% Repeated Measures
% % noRepVariables = inputdlg('Number of repeated measures factors...'); %number of variables
% % noRepVariables = str2num(noRepVariables{:});
% % 
% % %if they put 0 make it a single condition experiment
% % if noRepVariables == 0 | isempty(noRepVariables) | ~exist('noRepVariables')
% %     noRepVariables = 1;
% % else
% %     
% %     %Name factors and specify no. of levels
% %     for variable = 1:noRepVariables
% %         varTemp = inputdlg({'Factor name...', 'Number of levels'}, ['Var ' num2str(variable)]);
% %         varRepNames{variable} = varTemp{1};
% %         varRepLevels(variable) = str2num(varTemp{2});
% %         varRepType{variable} = 'Repeated Measures';
% %     end
% % end
% % 
% % %Name levels
% % for variable = 1:noRepVariables
% %     for n = 1:varRepLevels(variable)
% %         condPlaceholder{n} = ['Level ' num2str(n)];
% %     end
% %     choice = questdlg(['Define levels of ' varRepNames(variable)], 'Define levels', ...
% %         'Continue', 'Cancel');
% %     if choice == 'Continue'
% %         conditionsRep{variable} = inputdlg(condPlaceholder, 'Define conditions...');
% %     else
% %     end
% % end
% 
% %% Independent Measures
% noIndVariables = inputdlg('Number of independent measures factors...'); %number of variables
% noIndVariables = str2num(noIndVariables{:});
% 
% %if they put 0 make it a single condition experiment
% if noIndVariables == 0 | isempty(noIndVariables) | ~exist('noIndVariables')
%     noIndVariables = 1;
% else
%     
%     %Name factors and specify no. of levels
%     for variable = 1:noIndVariables
%         varTemp = inputdlg({'Factor name...', 'Number of levels'}, ['Var ' num2str(variable)]);
%         varIndNames{variable} = varTemp{1};
%         varIndLevels(variable) = str2num(varTemp{2});
%         varIndType{variable} = 'Independent Measures';
%     end
% end
% 
% %Name levels
% for variable = 1:noIndVariables
%     for n = 1:varIndLevels(variable)
%         condPlaceholder{n} = ['Level ' num2str(n)];
%     end
%     choice = questdlg(['Define levels of ' varIndNames(variable)], 'Define levels', ...
%         'Continue', 'Cancel');
%     if choice == 'Continue'
%         conditionsInd{variable} = inputdlg(condPlaceholder, 'Define conditions...');
%     else
%     end
% end
% 
% %% Save it all
% Var = struct('FactorName', [varRepNames,varIndNames], 'Conditions', [conditionsRep,conditionsInd], 'FactorType', [varRepType,varIndType]);