class Comment < ApplicationRecord
  # ユーザー
  belongs_to :user
  # 投稿
  belongs_to :post

  validates :rate, presence: true
  validates :content, presence: true
end
