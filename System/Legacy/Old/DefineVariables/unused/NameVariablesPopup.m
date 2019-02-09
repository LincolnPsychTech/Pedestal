function 
% Create UIFigure
app.UIFigure = uifigure;
app.UIFigure.Position = [100 100 640 480];
app.UIFigure.Name = 'Name Variables';

for variable = 1:noVariables
    % Create EditFieldLabel
    eval(['app.EditField' num2str(variable) 'Label = uilabel(app.UIFigure);']);
    eval(['app.EditField' num2str(variable) 'Label.HorizontalAlignment = ''right'';']);
    eval(['app.EditField' num2str(variable) 'Label.Position = [233 ' num2str(340-40*(variable-1)) ' 56 15];']);
    eval(['app.EditField' num2str(variable) 'Label.Text = ''Variable' num2str(variable) ''';']);
    
    % Create EditField
    eval(['app.EditField' num2str(variable) ' = uieditfield(app.UIFigure, ''text'');']);
    eval(['app.EditField' num2str(variable) '.Position = [304 ' num2str(340-40*(variable-1)) ' 100 22];']);
end