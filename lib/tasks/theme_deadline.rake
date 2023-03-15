namespace :theme_deadline do
  desc '発行後72時間が経過した未達成テーマがあれば削除する'
  task removing_expired_themes: :environment do
    ThemeBoard.unachieved_boards.each do |board|
      board.destroy if board.created_at.since(3.days) < Time.now
    end
  end
end
