namespace :temporary_account do
  desc "お試し機能で作成した仮のアカウントがあれば削除"
  task periodic_deletion: :environment do
    User.temporary_accounts.each do |user|
      user.destroy
    end
  end
end
