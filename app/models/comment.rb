class Comment < ApplicationRecord
  # ユーザー
  belongs_to :user
  # 投稿
  belongs_to :post

  mount_uploader :picture, PictureUploader

  validates :title, presence: true
  validates :rate, presence: true
  validates :content, presence: true
end
