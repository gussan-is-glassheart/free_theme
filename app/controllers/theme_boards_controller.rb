class ThemeBoardsController < ApplicationController
  def index
    @theme_boards = ThemeBoard.all.includes(:user).order(created_at: :desc)
  end

  def new
    theme_board = ThemeBoard.new
    @categories = Category.all
  end

  def show
    @theme_board = ThemeBoard.find(params[:id])
    @theme = @theme_board.themeable
  end

  def create
    theme_board = ThemeBoard.set_photo_theme(params[:category_id], current_user.id)
    redirect_to theme_board, success: t('.success')
  end

  def update
  end

  def destroy
    theme_board = ThemeBoard.find(params[:id])
    theme_board.destroy!
    redirect_to theme_boards_path, success: t('.success')
  end

end
