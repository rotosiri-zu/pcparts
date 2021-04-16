class Comment < ApplicationRecord
  # ユーザー
  belongs_to :user
  # 投稿
  belongs_to :post
  # 楽天API
  belongs_to :rakuten
  
  validates :title, presence: true
  validates :rate, presence: true
  validates :content, presence: true
end
