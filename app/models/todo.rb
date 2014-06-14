class Todo < ActiveRecord::Base
  validates :description, presence: true

  # a Todo item must belong to one user
  belongs_to :user
end
