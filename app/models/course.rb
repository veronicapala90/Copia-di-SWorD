class Course < ActiveRecord::Base

  attr_accessible :name, :content

  validates :name, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }

  validates :content, presence: true, length: { maximum: 300 };

  has_many :comments

end
