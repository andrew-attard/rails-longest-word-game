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
    # Take the letters created in the view (sent as a string - why?), build an
    # array, loop over them, and check if each is included in the user guess
    @letters = params[:letters].split(' ')
    @all_included = @letters.all? do |letter|
      params[:user_guess].include?(letter)
    end
    # @count_not_exceeded =
    # Given an array of letters (the generated letters)
    # And an array of letters (the user's guess split into an array)
    # Check that both array.tally are equal to eachother, or that the value of
    # their matching keys are equal to eachother
    @letters.tally
  end
end
