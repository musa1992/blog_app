class Comment < ApplicationRecord
  belongs_to :post
  validates :body, :email, :name, presence: true
end
