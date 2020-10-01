# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # top row
  [3,4,5], # middle row
  [6,7,8], # bottom row
  [0,3,6], # left column
  [1,4,7], # middle column
  [2,5,8], # right column
  [0,4,8], # left diagonal
  [2,4,6] # right diagonal
]

def won?(board) 
  WIN_COMBINATIONS.each do |combo|
    win_index1 = combo[0]
    win_index2 = combo[1]
    win_index3 = combo[2]
    
    if board[win_index1] == "X" && board[win_index2] == "X" && board[win_index3] == "X"
      return combo
    elsif board[win_index1] == "O" && board[win_index2] == "O" && board[win_index3] == "O"
      return combo
    end
  end
  false
end

def full?(board)
  board.each do |placement|
    if placement == "" || placement == " " || placement == nil
      return false
    end
  end
  return TRUE
end

def draw?(board)
  if won?(board)
    return false
  end
  
  if !full?(board)
    return false
  end
  return true
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  end
  false
end