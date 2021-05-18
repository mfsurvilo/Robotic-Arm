% Path recorder

[r,c] = size(List)
for i= 1:r
    go = List(i,:)
    %pause(10/1000)
    Talk(2,go)
end