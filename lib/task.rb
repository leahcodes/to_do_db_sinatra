class Task
  attr_reader(:description, :list_id, :time)

  define_method (:initialize) do |attributes|
    @description = attributes.fetch(:description)
    @time = attributes.fetch(:time)
    @list_id = attributes.fetch(:list_id)
  end

  define_method(:save) do
    DB.exec("INSERT INTO tasks (description, list_id, time) VALUES ('#{@description}', #{@list_id}, '#{@time}')")
  end

  define_method(:==) do |another_task|
    self.description().==(another_task.description()).&(self.list_id().==(another_task.list_id()))
  end

  define_singleton_method(:all) do
    returned_tasks = DB.exec("SELECT * FROM tasks;")
    tasks = []
    returned_tasks.each() do |task|
      description = task.fetch("description")
      list_id = task.fetch("list_id").to_i()
      time = task.fetch("time")
      tasks.push(Task.new({:description => description, :list_id => list_id, :time => time}))
    end
    tasks
  end
end
