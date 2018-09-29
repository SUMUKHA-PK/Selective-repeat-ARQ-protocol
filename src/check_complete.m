function value = check_complete(sender,n)
  counter = 0;
  for i = 1:n
    if sender(i).success == 1
      counter = counter+1;
    end
  end
  if counter == n
    value = 1;
  else
    value = 0;
  end
end
