class Todo < ActiveRecord::Base
  # checks that todo is created with a description and a due days integer
  validates :description, presence: true
  validates :duedays, presence: true

  # a Todo item must belong to one user
  belongs_to :user

  # sort Todos by due date (i.e. closest due date at top!)
  default_scope { order('due ASC') }

  # # Called whenever a new Active Record object is instantiated (via 'new' or retrieval)
  # after_initialize :init
  # # Because initialize is called when 'new' Todo is called
  # # and when todo record retrieved, need to avoid overwriting due date
  # # so use conditional assignment (assigns variable only if it's new_record or, nil)
  # # i.e. the due date will only be set upon new creation of todo
  # def init
  #   self.duedays = 0
  #   if self.new_record? && self.due.nil?
  #     self.due ||= (Time.now + self.duedays.days)
  #   end
  # end



end
