# RSpec.configure do |config|
#   config.include FactoryBot::Syntax::Methods
# end

# RSpec.feature 'Groups', type: :feature do
#   scenario 'User views the list of groups with icons and total amounts' do
#     user = create(:user)

#     group1 = create(:group, name: 'Group 1', icon: 'icon1.png')
#     group2 = create(:group, name: 'Group 2', icon: 'icon2.png')

#     entity1 = create(:entity, group: group1, amount: 100, author: user)
#     entity2 = create(:entity, group: group1, amount: 200, author: user)
#     entity3 = create(:entity, group: group2, amount: 150, author: user)

#     visit user_session_path
#     fill_in 'Email', with: user.email
#     fill_in 'Password', with: user.password
#     click_button 'Log in'

#     visit groups_path
#     expect(page).to have_link('Group 1', href: group_path(group1))
#     expect(page).to have_link('Group 2', href: group_path(group2))
#   end
# end
