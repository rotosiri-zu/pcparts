class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  validates  :title, presence: true
  validates  :genre, presence: true
  validates  :price, presence: true
  validates  :text, presence: true
  validates  :image, presence: true
end
