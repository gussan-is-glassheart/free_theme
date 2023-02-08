class ThemeBoardsController < ApplicationController
  def index
    @theme_boards = ThemeBoard.all
  end

  def new
    theme_board = ThemeBoard.new
  end

  def show
    @theme_board = ThemeBoard.find(params[:id])
  end

  def create
    theme_board = current_user.theme_boards.new(theme_board_params)
    theme_board.save!
    redirect_to theme_board_path(theme_board), success: t('.success')
  end

  def update
  end

  def destroy
    theme_board = ThemeBoard.find(params[:id])
    theme_board.destroy!
    redirect_to theme_boards_path, success: t('.success')
  end

  private

  def theme_board_params
    params.require(:theme_board).permit(:themeable_id, :themeable_type)
  end
end
