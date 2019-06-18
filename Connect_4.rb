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

    # Test code to fill diagonals, not functional yet
    forward_diagonals = [ [], [], [], [], [], [] ]
    reverse_diagonals = [ [], [], [], [], [], [] ]

    @board.each do |row|
      row.each do 
        i = 0
        while i < @board.length
          j = 0
          while j < @board[i].length
            if i == j
              forward_diagonals[0] << @board[i][j]
            elsif i == j - 1
              forward_diagonals[1] << @board[i][j]
            elsif i == j - 2
              forward_diagonals[2] << @board[i][j]
            elsif i == j + 1
              forward_diagonals[3] << @board[i][j]
            elsif i == j + 2
              forward_diagonals[4] << @board[i][j]
            elsif i == j + 3
              forward_diagonals[5] << @board[i][j]
            end

            if i + j == 3
              reverse_diagonals[0] << @board[i][j]
            elsif i + j == 4
              reverse_diagonals[1] << @board[i][j]
            elsif i + j == 5
              reverse_diagonals[2] << @board[i][j]
            elsif i + j == 6
              reverse_diagonals[3] << @board[i][j]
            elsif i + j == 7
              reverse_diagonals[4] << @board[i][j]
            elsif i + j = 8
              reverse_diagonals[5] << @board[i][j]
            end
            j = j + 1
          end
          i = i + 1
        end
      end
    end
    
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

