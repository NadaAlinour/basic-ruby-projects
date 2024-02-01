def substrings(text, dictionary)
  # find the substrings and the counts of each substring present in the word provided
  # return result as a hash
  # substrings are case insensitive
  result = {}
  text.downcase!
  dictionary.each do |word|
    matches = text.scan(word).length
    result[word] = matches unless matches == 0
  end
  result
end



dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

substrings_hash = substrings('below', dictionary)
# p substrings_hash

substrings_hash = substrings("Howdy partner, sit down! How's it going?", dictionary)
p substrings_hash