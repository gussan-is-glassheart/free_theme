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
    @theme_board = ThemeBoard.find(params[:id])
    valid_params?(params[:theme_board]) and return
    if @theme_board.image_judgement(theme_board_params[:content])
      redirect_to @theme_board, success: t('.success')
    else
      redirect_to @theme_board, error: t('.fail_to_judge')
    end
  end

  def destroy
    theme_board = ThemeBoard.find(params[:id])
    theme_board.destroy!
    redirect_to theme_boards_path, success: t('.success')
  end

  private

  def theme_board_params
    params.require(:theme_board).permit(:content)
  end

  def valid_params?(theme)
    if theme.nil?
      redirect_to @theme_board, error: t('.content_empty')
    elsif !theme[:content].content_type.in?(%q{image/jpeg image/png image/gif})
      redirect_to @theme_board, error: t('.invalid_image_type')
    elsif theme[:content].size > 5.megabytes
      redirect_to @theme_board, error: t('.invalid_image_size')
    end
  end

end
