dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(str,dictionary)
  result = Hash.new(0)
  str = str.downcase.split

  str.each do |word|
    dictionary.each do |check|
      if word.include? check
        result[check] += 1
      end
    end
  end

  result

end

substring("below",dictionary)
