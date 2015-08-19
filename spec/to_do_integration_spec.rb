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
     test_list = List.new({:name => 'Errands', :id => nil})
     test_list.save()
     test_task = Task.new({:description => 'buy milk', :list_id => test_list.id(), :time => "2015-08-18"})
     test_task.save()
     visit("/lists/#{test_list.id()}")
     click_button('Add Task')
     expect(page).to have_content('buy milk')
   end
 end
