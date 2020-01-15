function stim = pedimageplay(ax, stim)
%% Draw image
stim.Obj = image(ax, ...
    'XData', [stim.Pos(1), stim.Pos(1) + stim.Pos(3)], ... % Position horizontal
    'YData', [stim.Pos(2), stim.Pos(2) + stim.Pos(4)], ... % Position vertical
    'CData', flipud(stim.Img), ... % Flip upside down as y axes are backwards
    'AlphaData', flipud(stim.Alpha) ... % Apply transparency
    );