imageFileTypes = {'.png', '.jpg', '.jpeg', '.bmp'};
adaptDir = uigetdir('', 'Select folder containing adapt stimuli/b Adapt stimuli must be in one of the following file formats: .png, .jpg, .bmp');

adaptFiles = {};
for i = 1:length(imageFileTypes)
    temp = dir([adaptDir, '\*', imageFileTypes{i}]);
    adaptFiles = [adaptFiles, temp.name];
end