class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user, optional: true
  belongs_to :category, optional: true
  # コメント
  has_many :comments, dependent: :destroy

  validates  :title, presence: true
  validates  :price, presence: true
  validates  :text, presence: true
  validates  :image, presence: true
end
