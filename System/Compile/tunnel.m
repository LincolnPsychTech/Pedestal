function tunnel(node)
for n = node.Children'
    switch n.Tag
        case 'R'
            rtrun(n)
        otherwise
            tunnel(n)
    end
end

end