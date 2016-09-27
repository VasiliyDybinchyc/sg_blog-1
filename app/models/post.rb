class Post < ActiveRecord::Base

  validates_presence_of :title, :body

  validates :title, :length => { in: 5..30 }

  validates :body, length: { minimum: 200 }

end
