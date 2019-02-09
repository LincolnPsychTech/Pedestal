 function blockInfo = buildAdaptationBlock() 

blockInfo = {'Placeholder'};

% %% adapt
%     %Decide on stim types
%     stimTypes = {'Static Image', 'Frame Animation', 'Video Animation', 'Audio', 'Audio + Image'};
%     [stimType{block,1},~] = listdlg('PromptString','Stimulus type:', 'ListString', stimTypes,'SelectionMode','single');
%     if stimType{block,1} == 2
%         otherStimInfo = inputdlg('Specify frame rate');
%     end
%     
%     
%     if stimType{block,1} == 1 %static image
%         %possible variations in order
%         adaptOptions = {'Present the same image each time', 'Present images from a folder in specified order', 'Present images from a folder randomly'};
%         adaptFormat = listdlg('PromptString','Adapt stimulus options...', 'ListString', adaptOptions,'SelectionMode','single');
%         if adaptFormat == 1
%             %get adapt stimulus file location
%             choice = questdlg(['Please select the adapt stimulus for Block ' num2str(block)], 'File Locations', ...
%                 'Find file...', 'Cancel');
%             if ~isempty(choice)
%                 [FileName,pathName,FilterIndex] = uigetfile('*.*');
%                 adaptDir{1,block} = [pathName,FileName];
%             else
%                 error 'Please specify a directory'
%             end
%         elseif adaptFormat == 2 | adaptFormat == 3
%             %get adapt stimulus folder location
%             choice = questdlg(['Please select folder containing adapt stimuli for Block ' num2str(block)], 'File Locations', ...
%                 'Find file...', 'Cancel');
%             if ~isempty(choice)
%                 pathName = uigetdir();
%             else
%                 error 'Please specify a directory'
%             end
%             %specify file type of stimuli
%             imageTypes = {'.png', '.bmp', '.jpg', '.tif', '.avi'};
%             adaptExt = listdlg('PromptString','Specify file type', 'ListString', {'.png', '.bmp', '.jpg', '.tif', '.avi'},'SelectionMode','single');
%             %get every file of that filetype in that folder
%             adaptStimNames = struct2cell(dir([pathName '\*' imageTypes{adaptExt}]));
%             adaptStimNames = adaptStimNames(1,:);
%             if isempty(adaptStimNames)
%                 error 'No images found'
%             end
%             %define order of stimuli
%             if adaptFormat == 2
%                 order = inputdlg(adaptStimNames, 'Order...');
%             elseif adaptFormat == 3
%                 order = randperm(length(adaptStimNames));
%             end
%             adaptStimuli = [order, adaptStimNames'];
%             adaptStimuli = sortrows(adaptStimuli);
%             %put stimuli locations into variable to access later
%             for n = 1:length(adaptStimuli)
%                 adaptDir{n,block} = [pathName,'\',char(adaptStimuli(n,2))];
%             end
%         end
%         
%         
%     elseif stimType{block,1} == 2 %frame animation
%         %possible variations in order
%         adaptOptions = {'Present the same animation each time', 'Present a series of animations in a specified order', 'Present animations chosen at random from a list'};
%         adaptFormat = listdlg('PromptString','Adapt stimulus options...', 'ListString', adaptOptions,'SelectionMode','single');
%         if adaptFormat == 2 | adaptFormat == 3
%             noAnimsAdapt = inputdlg('How many different animations are there?');
%             noAnimsAdapt = str2num(noAnimsAdapt{:});
%         else
%             noAnimsAdapt = 1;
%         end
%         
%         for anim = 1:noAnimsAdapt %for each animation
%             %get folder location for frames
%             choice = questdlg(['Please select folder containing adapt stimuli for Block ' num2str(block) ' animation ' num2str(anim)], 'File Locations', ...
%                 'Find file...', 'Cancel');
%             if ~isempty(choice)
%                 pathName = uigetdir();
%             else
%                 error 'Please specify a directory'
%             end
%             animNames(anim) = inputdlg('Specify name for this animation');
%             warndlg('Your frames will present in alphabetical order by file name.')
%             %define file type of frames
%             imageTypes = {'.png', '.bmp', '.jpg', '.tif', '.avi'};
%             adaptExt = listdlg('PromptString','Specify file type', 'ListString', imageTypes,'SelectionMode','single');
%             %get all files of that type in that folder
%             adaptStimNames = struct2cell(dir([pathName '\*' imageTypes{adaptExt}]));
%             adaptStimNames = adaptStimNames(1,:);
%             %put stimuli locations into variable to access later
%             for n = 1:length(adaptStimNames)
%                 adaptDir{anim,block}{n} = [pathName, '\', adaptStimNames{n}];
%             end
%         end
%         if adaptFormat == 1
%             order = 1:noAnimsAdapt';
%         elseif adaptFormat == 2
%             order = inputdlg(animNames, 'Order...');
%         elseif adaptFormat == 3
%             order = randperm(noAnimsAdapt)';
%             order = num2cell(order);
%         end
%         adaptStimuli = [order, adaptDir(:,block)];
%         adaptStimuli = sortrows(adaptStimuli,1);
%         adaptDir(:,block) = adaptStimuli(:,2);
%         
%     elseif stimType{block,1} == 3 %video animation
%     elseif stimType{block,1} == 4 %audio
%         
%     elseif stimType{block,1} == 5 %audio + image
%         %possible variations in order
%         adaptOptions = {'Present the same image each time', 'Present images from a folder in specified order', 'Present images from a folder randomly'};
%         adaptFormat = listdlg('PromptString','Adapt stimulus options...', 'ListString', adaptOptions,'SelectionMode','single');
%         if adaptFormat == 1
%             %get adapt stimulus file location
%             choice = questdlg(['Please select the adapt stimulus for Block ' num2str(block)], 'File Locations', ...
%                 'Find file...', 'Cancel');
%             if ~isempty(choice)
%                 [FileName,pathName,FilterIndex] = uigetfile('*.*');
%                 adaptDir{1,block} = [pathName,FileName];
%             else
%                 error 'Please specify a directory'
%             end
%         elseif adaptFormat == 2 | adaptFormat == 3
%             %get adapt stimulus folder location
%             choice = questdlg(['Please select folder containing adapt stimuli for Block ' num2str(block)], 'File Locations', ...
%                 'Find file...', 'Cancel');
%             if ~isempty(choice)
%                 pathName = uigetdir();
%             else
%                 error 'Please specify a directory'
%             end
%             %specify file type of stimuli
%             imageTypes = {'.png', '.bmp', '.jpg', '.tif', '.avi'};
%             adaptExt = listdlg('PromptString','Specify file type', 'ListString', {'.png', '.bmp', '.jpg', '.tif', '.avi'},'SelectionMode','single');
%             %get every file of that filetype in that folder
%             adaptStimNames = struct2cell(dir([pathName '\*' imageTypes{adaptExt}]));
%             adaptStimNames = adaptStimNames(1,:);
%             if isempty(adaptStimNames)
%                 error 'No images found'
%             end
%             %define order of stimuli
%             if adaptFormat == 2
%                 order = inputdlg(adaptStimNames, 'Order...');
%             elseif adaptFormat == 3
%                 order = randperm(length(adaptStimNames));
%             end
%             adaptStimuli = [order, adaptStimNames'];
%             adaptStimuli = sortrows(adaptStimuli);
%             %put stimuli locations into variable to access later
%             for n = 1:length(adaptStimuli)
%                 adaptDir{n,block}{1} = [pathName,'\',char(adaptStimuli(n,2))];
%             end
%         end
%     end
%     
%     %% Test
%     %Decide on stim types
%     stimTypes = {'Static Image', 'Frame Animation', 'Video Animation', 'Audio', 'Audio + Image'};
%     [stimType{block,2},~] = listdlg('PromptString','Stimulus type:', 'ListString', stimTypes,'SelectionMode','single');
%     if stimType{block,2} == 2
%         otherStimInfo = inputdlg('Specify frame rate');
%     end
%     
%     
%     if stimType{block,2} == 1 %static image
%         %possible variations in order
%         testOptions = {'Present the same image each time', 'Present images from a folder in specified order', 'Present images from a folder randomly'};
%         testFormat = listdlg('PromptString','test stimulus options...', 'ListString', testOptions,'SelectionMode','single');
%         if testFormat == 1
%             %get test stimulus file location
%             choice = questdlg(['Please select the test stimulus for Block ' num2str(block)], 'File Locations', ...
%                 'Find file...', 'Cancel');
%             if ~isempty(choice)
%                 [FileName,pathName,FilterIndex] = uigetfile('*.*');
%                 testDir{1,block} = [pathName,FileName];
%             else
%                 error 'Please specify a directory'
%             end
%         elseif testFormat == 2 | testFormat == 3
%             %get test stimulus folder location
%             choice = questdlg(['Please select folder containing test stimuli for Block ' num2str(block)], 'File Locations', ...
%                 'Find file...', 'Cancel');
%             if ~isempty(choice)
%                 pathName = uigetdir();
%             else
%                 error 'Please specify a directory'
%             end
%             %specify file type of stimuli
%             imageTypes = {'.png', '.bmp', '.jpg', '.tif', '.avi'};
%             testExt = listdlg('PromptString','Specify file type', 'ListString', {'.png', '.bmp', '.jpg', '.tif', '.avi'},'SelectionMode','single');
%             %get every file of that filetype in that folder
%             testStimNames = struct2cell(dir([pathName '\*' imageTypes{testExt}]));
%             testStimNames = testStimNames(1,:);
%             if isempty(testStimNames)
%                 error 'No images found'
%             end
%             %define order of stimuli
%             if testFormat == 2
%                 order = inputdlg(testStimNames, 'Order...');
%             elseif testFormat == 3
%                 order = randperm(length(testStimNames));
%             end
%             testStimuli = [order, testStimNames'];
%             testStimuli = sortrows(testStimuli);
%             %put stimuli locations into variable to access later
%             for n = 1:length(testStimuli)
%                 testDir{n,block} = [pathName,'\',char(testStimuli(n,2))];
%             end
%         end
%         
%         
%     elseif stimType{block,2} == 2 %frame animation
%         %possible variations in order
%         testOptions = {'Present the same animation each time', 'Present a series of animations in a specified order', 'Present animations chosen at random from a list'};
%         testFormat = listdlg('PromptString','test stimulus options...', 'ListString', testOptions,'SelectionMode','single');
%         if testFormat == 2 | testFormat == 3
%             noAnimsTest = inputdlg('How many different animations are there?');
%             noAnimsTest = str2num(noAnimsAdapt{:});
%         else
%             noAnimsTest = 1;
%         end
%         
%         for anim = 1:noAnimsTest %for each animation
%             %get folder location for frames
%             choice = questdlg(['Please select folder containing test stimuli for Block ' num2str(block) ' animation ' num2str(anim)], 'File Locations', ...
%                 'Find file...', 'Cancel');
%             if ~isempty(choice)
%                 pathName = uigetdir();
%             else
%                 error 'Please specify a directory'
%             end
%             cont = warndlg('Your frames will present in alphabetical order by file name.');
%             
%             %define file type of frames
%             imageTypes = {'.png', '.bmp', '.jpg', '.tif', '.avi'};
%             testExt = listdlg('PromptString','Specify file type', 'ListString', imageTypes,'SelectionMode','single');
%             %get all files of that type in that folder
%             testStimNames = struct2cell(dir([pathName '\*' imageTypes{testExt}]));
%             testStimNames = testStimNames(1,:);
%             %put stimuli locations into variable to access later
%             for n = 1:length(testStimNames)
%                 testDir{anim,block}{n} = [pathName, '\', testStimNames{n}];
%             end
%         end
%     end
%     
%     BlockInfo = struct('AdaptStimulus', {adaptDir}, 'TestStimulus', {testDir}, 'StimulusValues', {stimValues}, 'StimulusType', {stimType}, 'OtherStimulusInfo', {otherStimInfo});