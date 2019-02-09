function saveData(Data)
saveQuest = questdlg('Would you like to save your data?');
    if saveQuest == 'Yes'
        saveName = inputdlg('Name file, then choose file Location...'); %maybe put in default text as being a contructed string denoting IM condition and experiment name? %or just by default put it in a certain place in a file structure?
        saveLocation = uigetdir();
        save([saveLocation,'\',saveName{:}], 'Data');
    end