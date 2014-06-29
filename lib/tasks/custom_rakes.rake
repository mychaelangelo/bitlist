desc "Delete items that have expired"

task delete_expired_todos: :environment do
  # for each user, count number of expired items and increment that number
  User.all.each do |u|
    # for each user's todo items, if it's expired then increment 'missed' count and delete item
    u.todos.each do |t|
      if t.expired?
        u.missed += 1
        u.save
        t.destroy
      end
    end
  end

end
