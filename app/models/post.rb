class Post < ActiveRecord::Base
  attr_accessible :description, :link

  has_many :comments
  belongs_to :user

  validates :description, presence: true
  validates :link, presence: true,
  				   format: /^http:\/\/.+?/
  validates :user, presence: true
  				   #http://facebook.com
end
