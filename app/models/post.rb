class Post < ActiveRecord::Base

  validates_presence_of :title, :body

  validates :title, :length => { in: 5..30 }

  validates :body, length: { minimum: 200 }

  def self.latest_five
    order(id: :desc).limit(5)
  end

  has_many :comments

  mount_uploader :image, ImageUploader

end
