module DeviseFeatureMacros
  def login(user)
    visit new_user_session_path
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => 'password'
    click_button 'Sign in'
  end
end
