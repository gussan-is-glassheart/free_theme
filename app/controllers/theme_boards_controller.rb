class ThemeBoardsController < ApplicationController
  skip_before_action :require_login, only: %i[show]
  before_action :set_category, only: %i[index new completed]
  before_action :set_theme_board, only: %i[show update destroy]
  before_action :unauthorised_user, only: %i[update destroy]
  before_action :acceptable_if_complete, only: %i[show]

  def index
    @theme_boards = if (category_id = params[:category_id])
                      theme_ids = with_category(category_id)
                      current_user.theme_boards.includes(:user).where(themeable_id: theme_ids, complete: false).order(created_at: :desc).page(params[:page])
                    else
                      current_user.theme_boards.includes(:user).where(complete: false).order(created_at: :desc).page(params[:page])
                    end
  end

  def show
    @theme = @theme_board.themeable
  end

  def new; end

  def create
    theme_board = ThemeBoard.set_photo_theme(params[:category_id], current_user.id)
    redirect_to theme_board, success: t('.success')
  end

  def update
    valid_params?(params[:theme_board]) and return
    if @theme_board.image_judgement(theme_board_params[:content], theme_board_params[:embedded])
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
    @theme_boards = if (category_id = params[:category_id])
                      theme_ids = with_category(category_id)
                      current_user.theme_boards.includes(:user).where(themeable_id: theme_ids, complete: true).order(created_at: :desc).page(params[:page])
                    else
                      current_user.theme_boards.includes(:user).where(complete: true).order(created_at: :desc).page(params[:page])
                    end
  end

  def download
    @achievement = ThemeBoard.find(params[:id]).photo_achievement
    url = what_environment(@achievement)
    send_data url.read, disposition: 'attachment', type: @achievement.content.content_type, filename: @achievement.content_identifier
  end

  private

  def with_category(category_id)
    Category.find(category_id).photo_themes.includes(:category).pluck(:id)
  end

  def theme_board_params
    params.require(:theme_board).permit(:content, :embedded)
  end

  def set_theme_board
    @theme_board = ThemeBoard.find(params[:id])
  end

  def set_category
    @categories = Category.all
  end

  def unauthorised_user
    redirect_to theme_boards_path, error: t('defaults.invalid_access') unless current_user.id == @theme_board.user_id
  end

  def valid_params?(theme)
    if theme.nil?
      redirect_to @theme_board, error: t('.content_empty')
    elsif !theme[:content].content_type.in?('image/jpeg image/png image/gif')
      redirect_to @theme_board, error: t('.invalid_image_type')
    end
  end

  def what_environment(file)
    if Rails.env.production?
      URI.parse(file.content_url)
    else
      File.open(file.content.path)
    end
  end

  def acceptable_if_complete
    if @theme_board.complete == false
      if logged_in? == false
        redirect_to theme_boards_path, error: t('defaults.invalid_access')
      else
        unauthorised_user
      end
    end
  end
end
