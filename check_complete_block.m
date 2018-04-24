function value = check_complete_block(sender,temp,t,m)
  counter = 0;
  for i = t:temp
    if sender(i).success == 1
       counter = counter+1;
    end
  end
  if counter==m
    value = 1;
  else
    value = 0;
  end
end
