class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true
  belongs_to :blog

  def formatted_created_at_date
    self.created_at.strftime("Posted %m/%d/%Y at %I:%M%p")
  end
end
