class Hangman

  def initialize
    @arr_words = ["ruby", "rails", "insert", "update", "class"]	
  end

  def initial_data
    @attempts = 2
    @arr_characters = []
  end

  def win?
    !@word.include?("_")				
  end

  def lose?
    @attempts == 0		
  end

  def encrypt_word
    @rand_word = @arr_words.sample
    @word = @rand_word.split("").map { |a| "_"}
  end

  def opening_character(char)
    @word.each_index { |x| @word[x] = char if @rand_word[x] == char }
  end

  def instruction
    puts "Welcome to the game: 'Hangman'"
    puts "----------------------------------------"
    puts "Encrypt word:"
  end

  def play
    initial_data
    instruction
    p encrypt_word
    while !(win? || lose?) 
      print "Enter character: "
      character = gets.strip
      if @arr_characters.include? character
				puts "You entered this character"
      else
        @arr_characters.push(character)
        if @rand_word.include? character
          p opening_character(character)
        else
          @attempts -= 1
          puts "Remaining #{@attempts} attempts"
        end
      end
    end
    puts "You win" if win?
    puts "You lose" if lose?
    iteration
  end

  def iteration
    print "Want to play again? (yes | no): "
    answer = gets.strip
    play if answer == "yes"
  end
end