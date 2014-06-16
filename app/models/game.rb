class Game < ActiveRecord::Base
  attr_accessible :board, :o_user_id, :x_user_id, :x_player

  has_one :x_player, :foreign_key => 'x_user_id', :class_name => "User"
  has_one :o_player, :foreign_key => 'o_user_id', :class_name => "User"
end
