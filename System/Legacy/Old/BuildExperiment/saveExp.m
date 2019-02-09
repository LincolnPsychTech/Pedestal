function saveExp(Exp, Var)

saveQuest = questdlg('Would you like to save your experiment?');
if saveQuest == 'Yes'
    saveName = inputdlg('Name file, then choose file Location...');
    saveLocation = uigetdir();
    save([saveLocation,'\',saveName{:}], 'Exp', 'Var');
end