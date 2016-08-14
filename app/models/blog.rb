class Blog < ActiveRecord::Base
  extend FriendlyId
  friendly_id :url, use: :slugged

  belongs_to :user
  has_many :posts, dependent: :destroy

end
