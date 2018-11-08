class Game

  def initialize
    # create an instance of a tic tac toe game

    @players = ['','']
    # player indices are {0: 'player 1', 1: 'player 2'}
    @current_player = rand(2)

    @winner = -1 # -1: no current winner
    
    @board = Array.new(9){0} 
    # board piece indices are {0: ' ', 1: 'X', 10: 'O'}
    @in_a_rows = [
      [0,4,8], # lr diagonal
      [2,4,6], # rl diagonal
      [0,1,2], # row 1
      [3,4,5], # row 2
      [6,7,8], # row 3
      [0,3,6], # col 1
      [1,4,7], # col 2
      [2,5,8]  # col 3
    ]
    @sums_in_a_row = Array.new(8) { [0,0] }
    
    @turn_count = 0
    @current_move = ''
    @current_row 
    @current_col
  end

  def setup_game
    puts "Welcome to Tic Tac Toe!"
    puts "What is your name?"
    @players[0] = gets.chomp()  
    puts "What is the other player's name? Press enter if you would like to play me."
    @players[1] = gets.chomp()
    if @players[1] == ''
      @players[1] = 'joshuacook.me'
    end
    puts
    puts
    puts "***************************************#{'*'*@players[0].length}***#{'*'*@players[1].length}**"
    puts "*                                      #{' '*@players[0].length}   #{' '*@players[1].length} *"
    puts "* Presenting ......................... #{@players[0]} v #{@players[1]} *"
    puts "*                                      #{' '*@players[0].length}   #{' '*@players[1].length} *"
    puts "***************************************#{'*'*@players[0].length}***#{'*'*@players[1].length}**"
    puts
    puts "Press Enter to continue."
    gets
  end

  def instructions

    puts <<-HOWTO
    How to Play:
    When prompted, enter your move as \"row column\".
    For Example, to play here:

          1   2   3  
        +---+---+---+
      1 |   |   |   |
        +---+---+---+
      2 |   |   | x |
        +---+---+---+
      3 |   |   |   |
        +---+---+---+
    
    Enter: 2 3
    Press Enter to continue.
    HOWTO
    gets
  end

  def print_XO(val)
    if val == 0
      return ' '
    elsif val == 1
      return 'X'
    else 
      return 'O'
    end
  end

  def print_board
    puts <<-BOARD
          1   2   3  
        +---+---+---+
      1 | #{print_XO(@board[3*0+0])} | #{print_XO(@board[3*0+1])} | #{print_XO(@board[3*0+2])} |
        +---+---+---+
      2 | #{print_XO(@board[3*1+0])} | #{print_XO(@board[3*1+1])} | #{print_XO(@board[3*1+2])} |
        +---+---+---+
      3 | #{print_XO(@board[3*2+0])} | #{print_XO(@board[3*2+1])} | #{print_XO(@board[3*2+2])} |
        +---+---+---+
    BOARD
  end

  def is_move_valid?
    if @current_move =~ /[123] [123]/
      move = @current_move.split(' ')
      @current_row, @current_col = move[0].to_i, move[1].to_i
      if @board[(@current_row-1)*3+(@current_col-1)] == 0
        true
      else
        false 
      end
    else
      false
    end
  end

  def turn
    puts
    puts
    if @players[@current_player] == 'joshuacook.me'
      tictactoe_ai_select_move
    else
      player_select_move
    end
    sum_in_a_row
    @turn_count += 1
  end

  def sum_in_a_row   
    @in_a_rows.each_with_index do |in_a, index|
      in_a_row_sum = @board[in_a[0]] + @board[in_a[1]] + @board[in_a[2]]
      @sums_in_a_row[index][0] = in_a_row_sum
      if in_a_row_sum == 20 or in_a_row_sum == 2
        in_a.each do |place|
          if @board[place] == 0
            @sums_in_a_row[index][1] = place
          end
        end
      end            
    end
  end

  def has_game_been_won?     
    @sums_in_a_row.each do |sum|
      if sum == 3
        return 0
      elsif sum == 30
        return 1
      end
    end  
    return -1      
  end

  def play
    setup_game
    instructions 
    while (@winner == -1 and @turn_count < 9)
      print_board
      turn
      @winner = has_game_been_won?
    end

    print_board
    if @winner == -1
      puts "Cat's game."
    else
      puts "Congratulations #{@players[@winner]}. You have won!!"
    end
  end

  def tictactoe_ai_select_move
    puts "I will now make a move."

    sleep 1.0

    # first move
    if @turn_count == 0
      @board[4] = 10
      @current_player = 0
      return
    end

    # second move
    if @turn_count == 1
      if @board[0] == 1
        @board[8] = 10
      elsif @board[2] == 1
        @board[6] = 10
      elsif @board[8] == 1
        @board[0] = 10
      elsif @board[6] == 1
        @board[2] = 10
      end
      @current_player = 0
      return
    end

    # Win
    @sums_in_a_row.each do |sum|
      if sum[0] == 20
        @board[sum[1]] = 10
        @current_player = 0
        return
      end
    end

    # Block
    @sums_in_a_row.each do |sum|
      if sum[0] == 2
        @board[sum[1]] = 10
        @current_player = 0
        return
      end
    end
    
    # Fork
    # Block Fork
      # can opponent use block to create a fork
    
    # empty corner
    @board.each_with_index do |val, index|
      if val == 0
        @board[index] = 10
        @current_player = 0
        return
      end
    end

  
    puts "I choose ."
  end

  def find_empty
  end

  def player_select_move
    puts "Your move #{@players[@current_player]}"
    while true
      puts "Please enter your move as 'row column': "
      @current_move = gets.chomp()
      if is_move_valid?()
        @board[(@current_row-1)*3+(@current_col-1)] = 10**@current_player
        @current_player = 1 - Math.log10(10**@current_player)
        break           
      end
      puts "Error: Invalid move." 
    end
  end

end

uno = Game.new
uno.play
