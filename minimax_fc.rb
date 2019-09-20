# this is the board flattened and filled with some values to easier assess the Artificial Inteligence.
origBoard = ["O",1 ,"X","X",4 ,"X", 6 ,"O","O"]

# human
 human_player = "O"
# ai
 ai_player = "X"

# keep track of function calls
 fc = 0

# finding the ultimate play on the game that favors the computer
 best_spot = minimax(origBoard, ai_player)

# loging the results
puts "index: #{best_spot.index}"
puts "function calls: #{fc}"


# the main minimax function
def self.minimax(newBoard, player)
  
    # keep track of function calls
    fc++

    # available spots returned into new array
    avail_spots = emptyIndexies(newBoard)   # def emptyIndexies(board)
                                            # board.select {|space| space != "X" && space != "O"}    
                                            # end

    # checks for the terminal states such as win, lose, and tie and returning a value accordingly
    if winning(newBoard, human_player)
          return {score:-10}
    elsif winning(newBoard, ai_player)
          return {score:10}     
    elsif avail_spots.length == 0
          return {score:0}
    end
 
    # an array to collect all the objects
    moves = []

    # loop through available spots     
    avail_spots.each do |free_spot| 
        move{} 
        move.index = newBoard[avail_spots[free_spot]]
        newBoard[avail_spots[free_spot]] = player

          #if collect the score resulted from calling minimax on the opponent of the current player
            if player == ai_player
                result = minimax(newBoard, human_player)
                move.score = result.score
            else
                result = minimax(newBoard, ai_player)
                move.score = result.score
            end

          #reset the spot to empty
          newBoard[avail_spots[free_spot]] = move.index

          #push the object to the array
          moves.push(move)
    end


   # if it is the computer's turn loop over the moves and choose the move with the highest score
   best_move = 0
    if player == ai_player
        best_score = -10000
        moves.each do |move|
            if move.score > best_score
              best_move = move
            end
        end
    else
      best_score = 10000
      moves.each do |move|
            if move.score < best_score
                best_move = move
            end
      end
    end
    
    return moves[best_move]

end



# returns the available spots on the board in a new array
def emptyIndexies(board)
  board.select {|space| space != "X" && space != "O"}    
end

# winning combinations using the board indexies, for instace the first win could be 3 x's in a row
def winning(board, player)
  if (
        (board[0] == player && board[1] == player && board[2] == player) ||
        (board[3] == player && board[4] == player && board[5] == player) ||
        (board[6] == player && board[7] == player && board[8] == player) ||
        (board[0] == player && board[3] == player && board[6] == player) ||
        (board[1] == player && board[4] == player && board[7] == player) ||
        (board[2] == player && board[5] == player && board[8] == player) ||
        (board[0] == player && board[4] == player && board[8] == player) ||
        (board[2] == player && board[4] == player && board[6] == player)
     ) 
        return true;
  else
        return false;
  end
end

