def bubble_sort_by(arr)
  changed = true
  while changed == true
    changed = false
    # resets the changed marker
    i = 0
    while i < (arr.length)-1
      # prevents exchanging the last object in the array with nil
      compare = yield(arr[i],arr [i+1])
      if compare > 0
        cache = arr[i]
        arr[i] = arr[i+1]
        arr[i+1] = cache
        changed = true
        # switches the two value if the first is greater than the second, and indicate change happened
      end
      i += 1
    end
  end
  arr.inspect
end

puts bubble_sort_by(["hi","hello","hey"]){|left,right| left.length - right.length}
