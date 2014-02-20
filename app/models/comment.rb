class Comment < ActiveRecord::Base

  attr_accessible :title, :content

  belongs_to :course

  belongs_to :user

  # course_id must be present while creating a new post...
  validates :course_id, presence: true

  # content must be present and not longer than 400 chars
  validates :content, presence: true, length: {maximum: 400}

  # title must be present and not longer than 400 chars
  validates :title, presence: true, length: {maximum: 400}

end
