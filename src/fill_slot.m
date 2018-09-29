function fill_slot(buffer,data,t,n)
% z = size(buffer);
 for i=1:n
    if buffer(i).data == -1
        buffer(i).data = data;
        buffer(i).index = t;
        break;
    end
 end
end
