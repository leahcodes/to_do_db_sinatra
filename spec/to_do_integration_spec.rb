require('capybara/rspec')
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

 describe("to_do list user story", {:type => :feature}) do
   it('will allow user to create a list') do
     visit('/')
     fill_in('name', :with => 'Errands')
     click_button('Add List')
     expect(page).to have_content('Errands')
   end
 end

 describe("the details for a single list", {:type => :feature}) do
   it('will allow the user to add a task to a list') do
     list = List.new({:name => "Grocery List", :id => nil})
     list.save()
     task = Task.new({:description => "buy milk", :list_id => 1, :time => "2015-08-18"})
     task.save()
     visit('/')
     click_link(list.name())
     expect(page).to have_content('tasks')
   end
 end
