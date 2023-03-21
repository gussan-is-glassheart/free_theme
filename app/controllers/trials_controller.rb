class TrialsController < ApplicationController
  skip_before_action :require_login

  def show
    @content
  end

  def update
    valid_params?(params[:theme_board]) and return
    if trial_image_judgement(theme_board_params[:content])
      user = User.trial_user_create
      @content = ThemeBoard.trial_theme_board_create(user, theme_board_params[:content])
      flash.now[:success] = t('theme_boards.update.success')
      render :show, status: :unprocessable_entity
    else
      redirect_to trial_path, error: t('theme_boards.update.fail_to_judge')
    end
  end

  private

  def theme_board_params
    params.require(:theme_board).permit(:content)
  end

  def valid_params?(theme)
    if theme.nil?
      redirect_to trial_path, error: t('theme_boards.update.content_empty')
    elsif !theme[:content].content_type.in?(%q{image/jpeg image/png image/gif})
      redirect_to trial_path, error: t('theme_boards.update.invalid_image_type')
    elsif theme[:content].size > 4.megabytes
      redirect_to trial_path, error: t('theme_boards.update.invalid_image_size')
    end
  end

  def trial_image_judgement(image)
    items = PhotoTheme.find(5).theme_items.pluck(:subject)
    labels = Vision.get_image_data(image.path)
    if items.to_set.subset?(labels.to_set)
      true
    else
      false
    end
  end
end
