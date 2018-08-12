class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true
  validates :body, length: { in: 250..400 }, allow_nil: true
end
