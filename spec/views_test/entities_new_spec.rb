# RSpec.configure do |config|
#   config.include FactoryBot::Syntax::Methods
# end
# RSpec.feature 'Entities', type: :feature do
#   scenario 'User creates a new entity' do
#     user = create(:user)

#     group = create(:group, name: 'Test Group')

#     visit user_session_path
#     fill_in 'Email', with: user.email
#     fill_in 'Password', with: user.password
#     click_button 'Log in'

#     visit new_entity_path
#     fill_in 'entity_name', with: 'Test Transaction'
#     fill_in 'entity_amount', with: 100

#     click_button 'Create a Transaction'

#     expect(page).to have_content('Transaction created successfully')
#     expect(page).to have_content('Test Group')
#     expect(page).to have_content('Test Transaction')
#     expect(page).to have_content('$100.00')
#   end
# end
