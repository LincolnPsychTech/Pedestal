function loadExperiment()

[fileName, fileLocation] = uigetfile();
load([fileLocation, fileName])

if expType == 'Adapt'
    runAdaptationExperiment(blockClass, adaptDir, testDir, stimValues, stimType, otherStimInfo);
end