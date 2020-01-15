function pedclear(ax)
if exist('ax', 'var')
    delete(ax.Children)
else
    try
        delete(get(groot).CurrentFigure.CurrentAxes.Children)
    catch
        error("No active window found.");
    end
end
drawnow