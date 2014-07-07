require 'spec_helper'

feature 'Update account with invalid data' do
  let(:user) { create :user, :confirmed }
  let(:login_page) { LoginPage.new }
  let(:edit_user_page) { EditUserPage.new }

  before do
    edit_user_page.load
    edit_user_page.top_bar.sign_in(user.email, '123456')
  end

  scenario 'I submit update account form with wrong current password' do
    edit_user_page.update_account_form(
      full_name: 'My new name with invalid password',
      email: user.email,
      password: '123456',
      password_confirmation: '123456',
      current_password: 'invalid password'
    )

    expect(user.reload.full_name).to_not eql 'My new name with invalid password'
  end
end
