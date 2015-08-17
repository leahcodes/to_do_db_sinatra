# require('capybara/rspec')
# require('./app')
# Capybara.app = Sinatra::Application
# set(:show_exceptions, false)
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
