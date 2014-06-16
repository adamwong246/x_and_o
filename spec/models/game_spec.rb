require 'spec_helper'

describe Game do
  describe "win_cat_or_else" do

    it "should know a win" do
      game = Game.new(board: 'xxxoxoxox')
      game.win_cat_or_else.should eq({win: :x})
    end

    it "should know a stalemate" do
      game = Game.new(board: 'xxoooxxox')
      game.win_cat_or_else.should eq( :cat )
    end

    it "should know to continue" do
      game = Game.new(board: 'x        ')
      game.win_cat_or_else.should eq({continue: :o})
    end

    it "should know to continue" do
      game = Game.new(board: 'xo       ')
      game.win_cat_or_else.should eq({continue: :x})
    end

  end
end
