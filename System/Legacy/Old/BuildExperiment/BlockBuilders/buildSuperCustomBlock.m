function blockInfo = buildSuperCustomBlock()

loadChoice = questdlg('Do you want to code your block now or upload one you made earlier?', 'Import...', 'Design', 'Load', 'Design');
if strcmp(loadChoice, 'Design')
    saveName = inputdlg('Name file, then choose file Location...');
    saveDir = uigetdir();
    copyfile([cd, '\BuildExperiment\BlockBuilders\', 'Example_Super_Custom_Block.m'], [saveDir, '\', saveName{:} '.m'])
    open([saveDir, '\', saveName{:} '.m'])
end

if strcmp(loadChoice, 'Load')
    [blockInfo{1}, blockInfo{2}] = uigetfile(); %just upload your own code
    blockInfo = [blockInfo{2}, blockInfo{1}];
end