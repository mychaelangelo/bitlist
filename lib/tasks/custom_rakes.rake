desc "Delete items that are older than 7 days"
task delete_todos: :environment do 
  # finds all records that were ceated at a point earlier than 7 days ago i.e. items older than 7 days
  Todo.where("created_at <= ?", Time.now - 7.days.ago).destroy_all
end