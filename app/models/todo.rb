class Todo < ActiveRecord::Base
  validates :description, presence: true

  # a Todo item must belong to one user
  belongs_to :user

  # sort Todos by due date (i.e. closest due date at top!)
  default_scope { order('due ASC') }

  # Called whenever a new Active Record object is instantiated (via 'new' or retrieval)
  after_initialize :init

  # Because initialize is called when 'new' Todo is called
  # and when todo record retrieved, need to avoid overwriting due date
  # so use conditional assignment (assigns variable only if it's new_record or, nil)
  def init
    if self.new_record? && self.due.nil?
      self.due ||= (Time.now + 7.days)
    end
  end

end
