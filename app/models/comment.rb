class Comment < ActiveRecord::Base
  belongs_to :post
  PROTECTION_FORM_LINKS_REGEX = /\A(https|http|ftp|ftps)*:*+[\/\/]*+[\w+\-]+\.[a-z]+[\/\w+\/]*+\z/i
  PROTECTION_FORM_FIRST_POST_REGEX = /\A[^`]*(First post+[^`]*)\z/i
  validates :body, length: { minimum: 2 }, format: { without: PROTECTION_FORM_FIRST_POST_REGEX,
                                                     without: PROTECTION_FORM_LINKS_REGEX}
end
