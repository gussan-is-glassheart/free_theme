class ThemeBoardsController < ApplicationController
  before_action :set_theme_board, only: %i[show update destroy]
  before_action :unauthorised_user, only: %i[show update destroy]

  def index
    @theme_boards = current_user.theme_boards.includes(:user).where(complete: false).order(created_at: :desc)
  end

  def new
    theme_board = ThemeBoard.new
    @categories = Category.all
  end

  def show
    @theme = @theme_board.themeable
  end

  def create
    theme_board = ThemeBoard.set_photo_theme(params[:category_id], current_user.id)
    redirect_to theme_board, success: t('.success')
  end

  def update
    valid_params?(params[:theme_board]) and return
    if @theme_board.image_judgement(theme_board_params[:content])
      redirect_to @theme_board, success: t('.success')
    else
      redirect_to @theme_board, error: t('.fail_to_judge')
    end
  end

  def destroy
    @theme_board.destroy!
    redirect_to theme_boards_path, success: t('.success')
  end

  def completed
    @theme_boards = current_user.theme_boards.includes(:user).where(complete: true).order(created_at: :desc)
  end

  def download
    @achievement = ThemeBoard.find(params[:id]).photo_achievement
    filepath = @achievement.content.current_path
    stat = File::stat(filepath)
    send_file(filepath, :filename => @achievement.content_identifier, :length => stat.size)
  end

  private

  def theme_board_params
    params.require(:theme_board).permit(:content)
  end

  def set_theme_board
    @theme_board = ThemeBoard.find(params[:id])
  end

  def unauthorised_user
    redirect_to theme_boards_path, error: t('defaults.invalid_access') unless current_user.id == @theme_board.user_id
  end

  def valid_params?(theme)
    if theme.nil?
      redirect_to @theme_board, error: t('.content_empty')
    elsif !theme[:content].content_type.in?(%q{image/jpeg image/png image/gif})
      redirect_to @theme_board, error: t('.invalid_image_type')
    elsif theme[:content].size > 4.megabytes
      redirect_to @theme_board, error: t('.invalid_image_size')
    end
  end

end
