function runAdaptationExperiment(blockClass,adaptDir,testDir,stimValues,stimType,otherStimInfo)

%Get information about monitor setup
monPos = get(0, 'MonitorPositions');
for n = 1:length(monPos(:,1))
    monitors{n} = num2str(n);
end
%Generate cool graphic
% coolGraphic = int8(zeros((monPos(end,2)+monPos(end,4)),(monPos(end,1)+monPos(end,3))));
% for n = 1:length(monPos(:,1))
%     coolGraphic(monPos(n,2):(monPos(n,2)+monPos(n,4)),monPos(n,1):(monPos(n,1)+monPos(n,3))) = 200;
% end
% image(coolGraphic)

%Open window
temp = Screen('Resolution', 2);
% display.screenNum = 2;
% display.dist = 300;
% display.width = 50;
% display.bkColor = [128,128,128];
% display.resolution = [temp.width, temp.height];
windowNo = listdlg('PromptString','Select window...', 'ListString', monitors, 'SelectionMode','single');
display = Screen('OpenWindow', windowNo);


totalBlocks = length(blockClass(:,1));


for block = 1:totalBlocks
    stimValuesBlock = stimValues{block};
    adaptDur = str2num(stimValuesBlock{1});
    topupDur = str2num(stimValuesBlock{2});
    testDur  = str2num(stimValuesBlock{3});
    ISI      = str2num(stimValuesBlock{4});
    noTrials = str2num(stimValuesBlock{5});
    
    iterateTrialAdapt = 1;
    iterateTrialTest = 1;
    %% Adapt Stimulus
    if stimType{block,1} == 1
        staticImagePres(adaptDir{1,iterateTrialAdapt}, adaptDur, display) %needs updating to fit multiple stim
    elseif stimType{block,1} == 2
        frameAnimPres(adaptDir(iterateTrialAdapt), adaptDur, display, otherStimInfo)
    elseif stimType{block,1} == 3
    elseif stimType{block,1} == 4
        audioPres(adaptDir{1,iterateTrialAdapt},adaptDur)
    elseif stimType{block,1} == 5
        audioImagePres(adaptDir{1,iterateTrialAdapt},adaptDur, display)
    end
    
    iterateTrialAdapt = iterateTrialAdapt+1;
    if iterateTrialAdapt >= length(adaptDir)
        iterateTrialAdapt = 1;
    end
    
    %% ISI
    pause(ISI/1000)
    
    for trial = 1:noTrials(block)       
        %% Test Stimulus
        if stimType{block,1} == 1
            staticImagePres(testDir{2,iterateTrialTest}, testDur, display)
        elseif stimType{block,1} == 2
            frameAnimPres(testDir(iterateTrialTest), testDur, display, otherStimInfo)
        elseif stimType{block,1} == 4
            audioPres(testDir{1,iterateTrialTest}, testDur)
        elseif stimType{block,1} == 5
            audioImagePres(testDir{1,iterateTrialTest}, testDur, display)
        end
        
        iterateTrialTest = iterateTrialTest+1;
        if iterateTrialTest >= length(testDir)
            iterateTrialTest = 1;
        end
                %% Top Up Stimulus
        if stimType{block,1} == 1
            staticImagePres(adaptDir{1,iterateTrialAdapt}, topupDur, display) %needs updating to fit multiple stim
        elseif stimType{block,1} == 2
            frameAnimPres(adaptDir(iterateTrialAdapt), topupDur, display, otherStimInfo)
        elseif stimType{block,1} == 3
        elseif stimType{block,1} == 4
            audioPres(adaptDir{1,iterateTrialAdapt},topupDur)
        elseif stimType{block,1} == 5
            audioImagePres(adaptDir{1,iterateTrialAdapt},topupDur, display)
        end
        
        iterateTrialAdapt = iterateTrialAdapt+1;
        if iterateTrialAdapt >= length(adaptDir)
            iterateTrialAdapt = 1;
        end
        
    end
end