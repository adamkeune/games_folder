class Connect_4

  def initialize(player1, player2)
  	@player1 = {"name" => player1, "token" => "X"}
  	@player2 = {"name" => player2, "token" => "O"}
    @current_player = @player1
  	@board = [
      ["-", "-", "-", "-", "-", "-"],
      ["-", "-", "-", "-", "-", "-"],
      ["-", "-", "-", "-", "-", "-"],
      ["-", "-", "-", "-", "-", "-"],
      ["-", "-", "-", "-", "-", "-"],
      ["-", "-", "-", "-", "-", "-"],
      ["-", "-", "-", "-", "-", "-"]
    ]
    @game_on = false
  end

  def current_player
    return @current_player["name"]
  end

  def check_winner
    columns = [[], [], [], [], [], []]
    forward_diagonals = [[@board[0][0], @board[1][1], @board[2][2], @board[3][3], @board[4][4], @board[5][5]],
      [@board[0][1], @board[1][2], @board[2][3], @board[3][4], @board[4][5]],
      [@board[0][2], @board[1][3], @board[2][4], @board[3][5]],
      [@board[1][0], @board[2][1], @board[3][2], @board[4][3], @board[5][4], @board[6][5]],
      [@board[2][0], @board[3][1], @board[4][2], @board[5][3], @board[6][4]],
      [@board[3][0], @board[4][1], @board[5][2], @board[6][3]]
    ]
    reverse_diagonals = [[@board[0][3], @board[1][2], @board[2][1], @board[3][0]],
      [@board[0][4], @board[1][3], @board[2][2], @board[3][1], @board[4][0]],
      [@board[0][5], @board[1][4], @board[2][3], @board[3][2], @board[4][1], @board[5][0]],
      [@board[1][5], @board[2][4], @board[3][3], @board[4][2], @board[5][1], @board[6][0]],
      [@board[2][5], @board[3][4], @board[4][3], @board[5][2], @board[6][1]],
      [@board[3][5], @board[4][4], @board[5][3], @board[6][2]]
    ]
    
    @board.each do |row|
      if row.join =~ /XXXX/ || row.join =~ /OOOO/
        puts "#{current_player} wins!"
        @game_on = false
      end
    end

    i = 0
    while i < @board.length
      j = 0
      while j < @board[i].length
        columns[j] << @board[i][j]
        j = j +1
      end
      i = i + 1
    end

    columns.each do |column|
       if column.join =~ /XXXX/ || column.join =~ /OOOO/
        puts "#{current_player} wins!"
        @game_on = false
      end
    end

    forward_diagonals.each do |diag|
      if diag.join =~ /XXXX/ || diag.join =~ /OOOO/
        puts "#{current_player} wins!"
        @game_on = false
      end
    end

    reverse_diagonals.each do |diag|
      if diag.join =~ /XXXX/ || diag.join =~ /OOOO/
        puts "#{current_player} wins!"
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
      puts "#{current_player}, please select a column, 1 through 6"
  
      choice = gets.chomp

      if choice.downcase == "exit"
        break 
      else
        if choice.to_i > 0 && choice.to_i < 7
          if @board[0][choice.to_i - 1] != "-"
            puts "That column is full!"
          else
            bottom = @board.length - 1
            while bottom > 0 && @board[bottom][choice.to_i - 1] != "-"
              bottom = bottom - 1
            end
            @board[bottom][choice.to_i - 1] = @current_player["token"]
            check_winner
            show_board
            toggle_player
          end
        else
          puts "Out of range"
        end
      end
    end
  end

end