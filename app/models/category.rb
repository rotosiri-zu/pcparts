class Category < ApplicationRecord
  has_ancestry
  has_many :posts, dependent: :destroy
end
