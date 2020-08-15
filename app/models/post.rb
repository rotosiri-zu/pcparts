class Post < ApplicationRecord
  has_many :images, dependent: :destroy
end
