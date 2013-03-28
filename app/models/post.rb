class Post < ActiveRecord::Base
  attr_accessible :description, :link, :image

  has_many :comments
  belongs_to :user

  has_attached_file :image,
  	styles: {
  		thumb: '100x100>',
  		small: '150x150>',
  		medium: '200x200>'
  	},
    storage: :s3,
    s3_credentials: {
      access_key_id: 'AKIAJNUSQQMYYELN5VZQ',
      secret_access_key: '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',
      bucket: 'hackeryou'
    }

  validates :description, presence: true
  validates :link, presence: true,
  				   format: /^http:\/\/.+?/
  validates :user, presence: true
  				   #http://facebook.com

  validates_attachment_presence :image

end
