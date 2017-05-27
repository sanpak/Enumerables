require 'byebug'

# EASY

# Define a method that returns the sum of all the elements in its argument (an
# array of numbers).
def array_sum(arr)
  return 0 if arr.empty?
  arr.reduce(:+)
end

# Define a method that returns a boolean indicating whether substring is a
# substring of each string in the long_strings array.
# Hint: you may want a sub_tring? helper method
def in_all_strings?(long_strings, substring)
  long_strings.each do |string|
    return false unless string.include?(substring)
  end

  return true
end

# Define a method that accepts a string of lower case words (no punctuation) and
# returns an array of letters that occur more than once, sorted alphabetically.
def non_unique_letters(string)
  string.chars.reduce([]) do |array,letter|
    if string.count(letter) > 1 && array.include?(letter) == false && letter != " "
      array << letter
    else
      array
    end
  end
end

# Define a method that returns an array of the longest two words (in order) in
# the method's argument. Ignore punctuation!
def longest_two_words(string)
  string.split.sort_by { |word| word.length }[-2..-1]
end

# MEDIUM

# Define a method that takes a string of lower-case letters and returns an array
# of all the letters that do not occur in the method's argument.
def missing_letters(string)
  a_to_z_array = ("a".."z").to_a
  a_to_z_array - string.chars

end

# Define a method that accepts two years and returns an array of the years
# within that range (inclusive) that have no repeated digits. Hint: helper
# method?
def no_repeat_years(first_yr, last_yr)
  array = []
  (first_yr..last_yr).each do |year|
    array << year if not_repeat_year?(year)
  end
  array
end

def not_repeat_year?(year)
  year.to_s.chars.each do |digit|
    return false if year.to_s.count(digit) > 1
  end
  return true
end

# HARD

# Define a method that, given an array of songs at the top of the charts,
# returns the songs that only stayed on the chart for a week at a time. Each
# element corresponds to a song at the top of the charts for one particular
# week. Songs CAN reappear on the chart, but if they don't appear in consecutive
# weeks, they're "one-week wonders." Suggested strategy: find the songs that
# appear multiple times in a row and remove them. You may wish to write a helper
# method no_repeats?
def one_week_wonders(songs)
  array = []
  songs.each do |song|
    array << song if no_repeats?(song, songs) && array.include?(song) == false
  end
  array
end

def no_repeats?(song_name, songs)
  (0...songs.length).each do |idx|
    return false if song_name == songs[idx] && song_name == songs[idx + 1]
  end
    return true
end

# Define a method that, given a string of words, returns the word that has the
# letter "c" closest to the end of it. If there's a tie, return the earlier
# word. Ignore punctuation. If there's no "c", return an empty string. You may
# wish to write the helper methods c_distance and remove_punctuation.

def for_cs_sake(string)
  string = string.gsub(/[[:punct:]]/, '')
  string = string.split
  string = string.reject { |word| c_distance(word) == nil }
  string.sort_by { |word| c_distance(word) }[0]

  #too long
  # closest = ""
  # split_string = string.split
  # c_distance = 0
  #
  # (0...split_string.length).each do |idx|
  #   next if c_distance(split_string[idx]) == nil
  #   if c_distance(split_string[idx]) > c_distance
  #     c_distance = c_distance(split_string[idx])
  #     closest = split_string[idx]
  #   end
  # end
  # closest
end

def c_distance(word)
  c_position = word.index("c")
end

# Define a method that, given an array of numbers, returns a nested array of
# two-element arrays that each contain the start and end indices of whenever a
# number appears multiple times in a row. repeated_number_ranges([1, 1, 2]) =>
# [[0, 1]] repeated_number_ranges([1, 2, 3, 3, 4, 4, 4]) => [[2, 3], [4, 6]]

def repeated_number_ranges(arr)
end
