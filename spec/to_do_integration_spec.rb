require('capybara/rspec')
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
#
# describe("to-do list path", {:type => :feature}) do
#   it('adds user entry to their to-do list and displays the entire list') do
#     visit('/')
#     fill_in('description', :with => 'Call your mother')
#     click_button('Add Task')
#     click_link('Back')
#     fill_in('description', :with => 'Brush yo teef')
#     click_button('Add Task')
#     click_link('Back')
#     expect(page).to have_content('Call your mother')
#     expect(page).to have_content('Brush yo teef')
#   end
# end

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
     test_task = Task.new({:description => 'buy milk', :list_id => test_list.id()})
     test_task.save()
     visit("/lists/#{test_list.id()}")
     click_button('Add Task')
     expect(page).to have_content('buy milk')
   end
 end
