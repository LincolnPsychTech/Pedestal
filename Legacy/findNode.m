function i = findNode(app, flow, node)

i = {};
if iscell(flow)
    for n = 1:length(flow)
        if isstruct(flow{n}) && isfield(flow{n}, "Contents")
            s = findNode(app,flow{n}.Contents,node);
            i{n} = s
        else
            if ~isempty(flow{n})
                if isfield(flow{n}, "Node")
                    i{n} = flow{n}.Node == node
                else
                    i{n} = false
                end
            else
                i{n} = false
            end
        end
    end
    
    i2 = find([i]);
    for n = 1:length(i2)
        findNode(app, flow{i2(n)}, node)
    end
end