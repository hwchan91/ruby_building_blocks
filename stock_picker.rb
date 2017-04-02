def stock_picker(arr)
  i=0 ; j=-1; max_diff = 0
  eval_arr = arr

  while eval_arr.rindex(eval_arr.max) != 0 and eval_arr != []
  # make sure sequence is not in descending order or has not reached the end, ie. empty array
    if i = 0 or eval_arr.min < best[0]
      # make sure the remaining array has a value smaller than the current min; but does not check the first loop
      eval_arr = arr[(j+1),(eval_arr.rindex(eval_arr.max)+1)]
      # cuts the array when it reaches its max value
      diff = eval_arr[-1] - eval_arr.min
      # the greatest diff in eval_arr possible
      i = eval_arr.rindex(eval_arr.min) + j + 1 #index of min in arr
      j = eval_arr.rindex(eval_arr.max) + j + 1 #index of max in arr
      if diff >= max_diff
        max_diff = diff
        best = [i, j]
      end
      eval_arr = arr[(j+1)..-1]
      # move on to evaluate the rest of arr
    else
       eval_arr = []
    end
  end

  max_diff == 0? "No profit": "#{best}"
end

test = [10,49,3,25,43,8,2,5,42,31]
stock_picker(test)
