class Comment < ActiveRecord::Base
  belongs_to :post

  PROTECTION_FORM_LINKS_REGEX = /\A(https|http|ftp|ftps)*:*+[\/\/]*+[\w+\-]+\.[a-z]+[\/\w+\/]*+\z/i
  PROTECTION_FORM_FIRST_POST_REGEX = /\A[^`]*(First post+[^`]*)\z/i

  validates_presence_of :body

  validates :body, length: { minimum: 2 }

  validates :body, format: { without: PROTECTION_FORM_LINKS_REGEX }
  validates :body, format: { without: PROTECTION_FORM_FIRST_POST_REGEX }
end
