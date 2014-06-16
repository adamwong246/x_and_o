class Game < ActiveRecord::Base
  attr_accessible :board, :o_user_id, :x_user_id, :x_player

  has_one :x_player, :foreign_key => 'x_user_id', :class_name => "User"
  has_one :o_player, :foreign_key => 'o_user_id', :class_name => "User"

  def win_cat_or_else
    array = board.split("").each_with_index.map{|x, i|
      [i/3][i%3] = x
    }

    [:x, :o].each do |p|
      if ([array[0][0], array[0][1], array[0][2], p.to_s].uniq.length == 1) ||
         ([array[1][0], array[1][1], array[1][2], p.to_s].uniq.length == 1) ||
         ([array[2][0], array[2][1], array[2][2], p.to_s].uniq.length == 1) ||
         ([array[1][0], array[1][0], array[2][0], p.to_s].uniq.length == 1) ||
         ([array[1][1], array[1][1], array[2][1], p.to_s].uniq.length == 1) ||
         ([array[1][2], array[1][2], array[2][2], p.to_s].uniq.length == 1) ||
         ([array[0][0], array[1][1], array[2][2], p.to_s].uniq.length == 1) ||
         ([array[0][2], array[1][1], array[2][0], p.to_s].uniq.length == 1) 

         return {win: p}
      end
    end

    if board.delete(' ').length >= 9
      return :cat
    else
      if board.count("x") > board.count("o")
        return {continue: :o}
      else
        return {continue: :x}
      end
    end

    raise 'wtf?'

  end

end
