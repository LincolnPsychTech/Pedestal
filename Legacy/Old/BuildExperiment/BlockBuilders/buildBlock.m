function [blockType, blockInfo] = buildBlock()
blockTypes = {'Adaptation', 'Custom', 'Super Custom'};
blockTypeIndex = listdlg('PromptString',['What kind of block is this?'], 'ListString', blockTypes, 'SelectionMode', 'single');
blockType = blockTypes{blockTypeIndex};

if strcmp(blockType, 'Adaptation')
    blockInfo = buildAdaptationBlock();
end

if strcmp(blockType, 'Custom')
    blockInfo = buildCustomBlock();
end

if strcmp(blockType, 'Super Custom')
    blockInfo = buildSuperCustomBlock();
end
%NTS add other block types