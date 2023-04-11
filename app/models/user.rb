class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :theme_boards, dependent: :destroy

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :reset_password_token, uniqueness: true, allow_nil: true

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true, length: { maximum: 255 }

  enum role: { general: 0, admin: 1 }

  scope :temporary_accounts, -> { where(temporary: true) }

  # お試しユーザーの作成
  def self.trial_user_create
    User.create(
      name: "demo_user",
      email: "demo_#{SecureRandom.uuid}@example.com",
      password: "password",
      password_confirmation: "password",
      temporary: true
    )
  end
end
