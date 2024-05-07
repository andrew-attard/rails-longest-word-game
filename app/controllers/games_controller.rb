class GamesController < ApplicationController
  def new
    # Generate a random set of 10 letters, store it in an instance variable,
    # and pass it to the view
    alphabet = ('A'..'Z').to_a
    @letters = []
    10.times do
      @letters << alphabet.sample
    end
  end

  # Note that in order to use the letters in the method below, I needed to send
  # it back from the view through a the hidden_field_tag
  def score
    # Create an array with each letter in the randomly generated letters
    @letters = params[:letters].chars
    # Create an array with each letter in the user's guess
    @guess_letters = params[user_guess].chars
    # For each letter in the user's guess, check if the count of letters in the
    # randomly generated letters is greater than or equal to their count in the
    # guess_letters array
    @all_included = guess_letters do |letter|
      # Checks that the count of a specific letter does not exceed its count in
      # the provided randomly generated letters
      guess_letters(letter) <= @letters.count(letter)
      # If the count of letters in the guess ever exceeds that in the generated
      # letters, then it means that either the letter was not available or it
      # exceeded the total available
    end

    raise
    # Below was unnecessary, instead just compared the count of each letter in
    # the 2 arrays

    # l_tally_hash { A=> 2, B=> 1, C=> 3}
    # ug_tally_hash { A=>1 B=> 2, C=> 2}

    # for each[KEY]
    # l_tally_hash[:KEY] == ug_tally_hash[:KEY]
    # The value of Key in letters tally hash matching Letter X from user Guess
    # is less than or equal to the value in tally hash from letters hash

    # Given an array of letters (the generated letters)
    # And an array of letters (the user's guess split into an array)
    # Check that both array.tally are equal to eachother, or that the value of
    # their matching keys are equal to eachother
  end
end
