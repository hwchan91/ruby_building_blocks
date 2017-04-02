module Enumerable
  def my_each
    if block_given?
      arr = self.to_a
      i = 0
      while i < arr.length
        yield(arr[i])
        i += 1
      end
      self
    else
      self.to_enum
    end
  end
end

module Enumerable
  def my_each_with_index
    if block_given?
      arr = self.to_a
      i = 0
      while i < arr.length
        yield(arr[i], i)
        i += 1
      end
      self
    else
      self.to_enum
    end
  end
end

module Enumerable
  def my_select
    if block_given?
      selected_arr = []
      self.my_each {|i| selected_arr.push(i) if yield(i) == true}
      selected_arr
    else
      self.to_enum
    end
  end
end

module Enumerable
  def my_all?
    true_for_all = true
    if block_given?
      self.my_each {|i| true_for_all = false if !(yield(i)}
    else
      self.my_each {|i| true_for_all = false if !i}
    end
    true_for_all
  end
end

module Enumerable
  def my_any?
    match_for_any = false
    if block_given?
      self.my_each {|i| match_for_any = true if yield(i)}
    else
      self.my_each {|i| match_for_any = true if i}
    end
    match_for_any
  end
end

module Enumerable
  def my_none?
   !(self.my_any?)
  end
end

module Enumerable
  def my_count(*input)
    count = 0
    if block_given?
        self.my_each {|i| count += 1 if yield(i)}
    else
      if input.length == 0
        self.my_each {|i| count +=1}
      else
        self.my_each {|i| count +=1 if i == input}
      end
    end
    count
  end
end

module Enumerable
  def my_map # for block
    new_arr = []
    if block_given?
      self.my_each {|i| new_arr << yield(i)}
      new_arr
    else
      self.to_enum
    end
  end
end

module Enumerable
  def my_map # for proc
    new_arr = []
    if block_given?
      self.my_each {|i| new_arr << yield(i)}
      new_arr
    else
      self.to_enum
    end
  end
end

module Enumerable
  def my_inject(a = nil, b = nil)
    arr = self.to_a
    if block_given?
      memo = (a == nil ? arr[0] : a) #if no arg, set initial value to first element
      i = 0
      arr.my_each do
        memo = yield(memo, arr[i+1]) if (i < arr.length - 1) #prevent iterating the last item
        i += 1
      end
      memo # return result
      if b != nil # if there is block AND 2 args, run the 2nd arg (ie. symbol) after completing the block
        arr.my_inject(memo , b)
      end
    else #no block
      if a == nil && b == nil #no arg and block
        "LocalJumpError: no block given"
      elsif b == nil #one arg
          if a.is_a? (Symbol)# if 1 arg, check input is symbol
            memo = arr[0] #set initial value to first element
            i = 0
            arr.my_each do
              memo = memo.send(a, arr[i+1]) if (i < arr.length - 1) #prevent iterating the last item
              i += 1
            end
            memo #result
          else
            "TypeError: #{a} is not a symbol (nor a string)"
          end
      else # two args
        if b.is_a? (Symbol) #check 2nd arg is symbol
          memo = a
          i = 0
          arr.my_each do
            memo = memo.send(b, arr[i]) if (i < arr.length) #since there is inital value, the first/last element needs to be evaluated
            i += 1
          end
          memo
        else
          "Error: #{b} is not a symbol (nor a string)"
        end
      end
    end
  end
end

def multiply_els(arr)
  arr.my_inject(:*)
end
