class Comment < ActiveRecord::Base
  belongs_to :post
  validates :body, length: { in: 5..200 }
end
