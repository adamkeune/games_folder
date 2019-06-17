class Tictactoe

  def initialize(player1, player2)
  	@player1 = {"name" => player1, "token" => "X"}
  	@player2 = {"name" => player2, "token" => "O"}
    @current_player = @player1
  	@board = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]
    @game_on = false
  end

  def current_player
    return @current_player["name"]
  end

  def check_winner
    columns = [[], [], []]
    diagonals = [
    	[@board[0][0], @board[1][1], @board[2][2]],
    	[@board[0][2], @board[1][1], @board[2][0]]
    ]

    i = 0
    while i < @board.length
      j = 0
      while j < @board[i].length
        columns[j] << @board[i][j]
        j = j +1
      end
      i = i + 1
    end

    @board.each do |row|
      if row.join =~ /XXX/ || row.join =~ /OOO/
      	puts "#{current_player} wins!"
      	show_board
      	@game_on = false
      end
    end

    columns.each do |col|
      if col.join =~ /XXX/ || col.join =~ /OOO/
      	puts "#{current_player} wins!"
      	show_board
      	@game_on = false
      end
    end

    diagonals.each do |diag|
      if diag.join =~ /XXX/ || diag.join =~ /OOO/
      	puts "#{current_player} wins!"
      	show_board
      	@game_on = false
      end
    end
  end

  def show_board
    i = 0
    while i < @board.length
      puts @board[i].join(" ")
      i = i + 1
    end
  end

  def toggle_player
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  def play_game
    @game_on = true
    while @game_on == true
      show_board
      puts "#{current_player}, please select an open space"
      response = gets.chomp
      square = response.to_i
      if response.downcase == "exit"
      	@game_on = false
      elsif @board.flatten[square - 1] == "X" || @board.flatten[square - 1] == "O"
      	puts "That space is taken"
      else
      	if square > 0 && square < 4
      	  @board[0][square - 1] = @current_player["token"]
      	  check_winner
      	  toggle_player
      	elsif square > 3 && square < 7
      	  @board[1][square - 4] = @current_player["token"]
      	  check_winner
      	  toggle_player
      	elsif square > 6 && square < 10
      	  @board[2][square - 7] = @current_player["token"]
      	  check_winner
      	  toggle_player
      	else
      	  puts "Stay on the game board!"
      	end
      end
    end
  end
end