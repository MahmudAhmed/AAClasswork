# require_relative "../skeleton/lib/00_tree_node.rb"
# require "byebug"
# class KnightPathFinder
  

#   #takes in a pos, and returns true/false if move is valid. (fits into our board)
#   def self.valid_move?(pos) #[8,8] => false #[1,7]=> true
#     return false if pos[0] > 7 || pos[1] > 7 ||  pos[0] < 0 || pos[1] < 0
#     true 
#   end

#   def self.valid_move(pos) #[8,8] => false #[1,7]=> true
#       funcs = [[-2,-1], [-2,1], [2,-1], [2,1], [-1,-2], [1,-2], [-1,2], [1,2]]
#       moves = funcs.map { |func| [(pos[0] + func[0]), (pos[1] + func[1])] } 
#       moves.select! { |pos| KnightPathFinder.valid_move?(pos) }
#       # moves.map! { |node| PolyTreeNodem.new(node) }
#       moves
#   end
  
#   attr_reader :root_node
#   attr_accessor :considered_positions

#   def initialize(pos)
#     @root_node = PolyTreeNode.new(pos)
#     @considered_positions = []
#     self.build_move_tree
#   end

#   def new_move_positions(pos)
#     moves = KnightPathFinder.valid_move(pos)
#     # debugger
#     new_moves = moves.reject { |pos| self.considered_positions.include?(pos) }
#     self.considered_positions += new_moves 
#   end


  
#   def build_move_tree
#     queue = [self.root_node.value]
    
#     queue += new_move_positions(root_node.value)

#     queue.each { |pos| queue += new_move_positions(pos) }

#     queue


#   end

  
  

# end


# board = KnightPathFinder.new([0,0])
# p board.build_move_tree
# # pos = PolyTreeNode.new([])
# # p board.build_move_tree([0,0]).sort


require_relative "../skeleton/lib/00_tree_node.rb"
require "byebug"
class KnightPathFinder
  

  #takes in a pos, and returns true/false if move is valid. (fits into our board)
  def self.valid_move?(pos) #[8,8] => false #[1,7]=> true
    return false if pos[0] > 7 || pos[1] > 7 ||  pos[0] < 0 || pos[1] < 0
    true 
  end

  def self.valid_move(pos) #[8,8] => false #[1,7]=> true
      funcs = [[-2,-1], [-2,1], [2,-1], [2,1], [-1,-2], [1,-2], [-1,2], [1,2]]
      moves = funcs.map { |func| [(pos[0] + func[0]), (pos[1] + func[1])] } 
      moves.select! { |pos| KnightPathFinder.valid_move?(pos) }
      # moves.map! { |node| PolyTreeNodem.new(node) }
      moves
  end
  
  attr_reader :root_node
  attr_accessor :considered_positions

  def initialize(pos)
    @root_node = PolyTreeNode.new(pos)
    @considered_positions = []
    self.build_move_tree
  end

  def new_move_positions(pos)
    moves = KnightPathFinder.valid_move(pos)
    # debugger
    new_moves = moves.reject { |pos| self.considered_positions.include?(pos) }
    self.considered_positions += new_moves 
  end


  
  def build_move_tree
    queue = [self.root_node.value]
    
    queue += new_move_positions(root_node.value)

    queue.each { |pos| queue += new_move_positions(pos) }

    queue


  end

  
  

end


board = KnightPathFinder.new([0,0])
p board.build_move_tree
# pos = PolyTreeNode.new([])
# p board.build_move_tree([0,0]).sort


