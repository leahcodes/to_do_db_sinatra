require("sinatra")
require("sinatra/reloader")
require("./lib/task")
require("./lib/list")
also_reload('lib/**/*.rb')
require("pg")

DB = PG.connect({:dbname => "to_do_test"})

get('/') do
  @lists = List.all()
  erb(:index)
end

post('/lists') do
  @lists = List.all()
  name = params.fetch("name")
  list = List.new({:name => name, :id => nil})
  list.save()
  redirect '/'
end

get('/lists/:id') do
  @list = List.find(params.fetch("id").to_i())
  @list_id = @list.id().to_i()
  erb(:list)
end

post('/tasks') do
  description = params.fetch("description")
  time = params.fetch("time")
  list_id = params.fetch("list_id").to_i()
  new_task = Task.new({:description => description, :list_id => list_id, :time => time})
  new_task.save()
  @list = List.find(params.fetch("list_id").to_i())
  erb(:list)
end

get("/lists/:id/edit") do
  @list = List.find(params.fetch("id").to_i())
  erb(:list_edit)
end

patch("/lists/:id") do
  name = params.fetch("name")
  @list = List.find(params.fetch("id").to_i())
  @list.update({:name => name})
  erb(:list)
end
