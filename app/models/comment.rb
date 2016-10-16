class Comment < ActiveRecord::Base
  belongs_to :post
  validates :body, length: { in: 5..50 }
end
