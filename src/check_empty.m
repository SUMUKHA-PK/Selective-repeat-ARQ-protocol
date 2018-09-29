function value = check_empty(buffer,n)
  value = 0;
  %size_of_buffer = size(buffer);
  for i = 1:n
      if buffer(i).data == -1
          value = 1;
          break;
      end
  end
end