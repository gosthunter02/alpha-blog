class Article < ActiveRecord::Base
  belongs_to :user
  # Makes sure the title and description are not empty upon creation
  # Adds length limitors to each field
  validates :title, presence: true, length: { minimum: 3, maximum: 50 } 
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  validates :user_id, presence: true
end