input = [
  [1, 0, 0, 1, 0],
  [1, 0, 1, 0, 0],
  [0, 0, 1, 0, 1],
  [1, 0, 1, 0, 1],
  [1, 0, 1, 1, 0]
]

ROW_SIZE = input[0].size
COL_SIZE = input.size

DIR = [[0, 1], [0, -1], [1, 0], [-1, 0]]

def count_figures(matrix)
  visited = Array.new(ROW_SIZE) { Array.new(COL_SIZE) {false}}

  figure_lenght = 0

  figure = []

  result = []

  
  matrix.each_with_index do |row, x|
    row.each_with_index do |element, y|
      if matrix[x][y] == 1 && !visited[x][y]
        figure_lenght += 1
        figure_lenght += dfs(matrix, x, y, visited)

        result << figure_lenght
        figure_lenght = 0
      end

       
    end
  end
  
  result.sort
end

def valid? (matrix, row, col, visited)
  (row >= 0) && (row < ROW_SIZE) && (col >= 0) && (col < COL_SIZE) && (matrix[row][col] == 1 && !visited[row][col]);
end

def dfs (matrix, row, col, visited, tail = 0)
  rowNbr = [0, 0, 1, -1]
  colNbr = [1, -1, 0, 0]

  visited[row][col] = true;

  4.times do | i |
    if valid?(matrix, row + rowNbr[i], col + colNbr[i], visited)
      tail += 1
      dfs(matrix, row + rowNbr[i], col + colNbr[i], visited, tail)
      
    end

  end

  tail
end




p count_figures(input)
