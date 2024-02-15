# spec/features/entities_spec.rb

require 'rails_helper'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.include Devise::Test::IntegrationHelpers, type: :feature
end

RSpec.feature 'Entities', type: :feature do
  before do 
    user = create(:user)
  end
  scenario "user signs up and confirms email" do
    visit new_user_registration_path

    fill_in "Name", with: "John Doe"
    fill_in "Email", with: "john@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    click_button "Sign up"

    confirmation_email = ActionMailer::Base.deliveries.last
    confirmation_link = confirmation_email.body.match(/confirmation_token=(.+)\"/)[1]

    visit confirmation_link

    expect(page).to have_content("Your email address has been successfully confirmed.")
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  scenario "user logs in successfully" do
    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Log in"

    expect(page).to have_content("Signed in successfully.")
    # Add any other expectations for a successful login
  end
  scenario 'User views entities in a group' do
    # Create a user and log in
    user = create(:user)
    login_as(user, scope: :user)

    # Create a group and entities associated with the user
    group = create(:group, user: user)
    entities = create_list(:entity, 3, group: group, user: user)

    # Visit the entities page
    visit group_entities_path(group)

    # Verify the presence of elements
    expect(page).to have_content('Back to Categories')

    if entities.any?
      entities.each do |entity|
        expect(page).to have_content(entity.name)
        expect(page).to have_content(entity.amount)
      end
      expect(page).to have_content("Total amount: #{entities.sum(&:amount)}")
    else
      expect(page).to have_content('No entities in this group yet.')
    end

    expect(page).to have_link('Add New', href: new_group_entity_path(group))
  end
end
