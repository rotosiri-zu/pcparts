class Rakuten < ApplicationRecord
  belongs_to :users, optional: true
  has_many :comments, dependent: :destroy
end
