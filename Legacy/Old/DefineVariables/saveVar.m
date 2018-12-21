function saveVar(Var)

saveQuest = questdlg('Would you like to save these variables?');
if strcmp(saveQuest,'Yes')
    saveName = inputdlg('Name file, then choose file Location...');
    saveLocation = uigetdir();
    save([saveLocation,'\',saveName{:}], 'Var')
else
end