class Game < ActiveRecord::Base
  attr_accessible :board, :o_user_id, :x_user_id
end
