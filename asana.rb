require 'asana'
require 'awesome_print'
require 'pry'

Asana.configure do |client|
  client.api_key = '1vXk5ifL.3g1TWAlKnVYyfoaqRf879zU'
end

me = Asana::User.me
my_id = me.id
workspace = Asana::Workspace.find(5336764099141)
projects = workspace.projects
my_tasks = workspace.tasks(my_id)
puts "Asana tasks"
my_tasks.each do |task|
  puts task.name
  binding.pry
end

