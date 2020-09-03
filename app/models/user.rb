class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         #パスワードの正確性を検証,ユーザ登録や編集、削除,パスワードのリセット,ログイン情報を保存,emailのフォーマットなどのバリデーション
  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :introduction, length: { maximum: 50 }
  has_many :books, dependent: :destroy
  attachment :profile_image #プロフィール画像を投稿できるようにする

end
