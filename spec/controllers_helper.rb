module ControllerHelper

  def sign_in_with(email, password)
    visit login_path
    fill_in 'user[email]', with: email
    fill_in 'user[password]', with: password
    click_button 'Submit'
  end

  def fill_in_fields_with(header, content)
    fill_in 'post[content]', with: content
    fill_in 'post[header]', with: header
    click_button 'Create Post'
  end

  def edit_fields_with(header, content)
    fill_in 'post[content]', with: content
    fill_in 'post[header]', with: header
    click_button 'Update Post'
  end

  def expect_msg_with(css, msg)
    expect(page).to have_css css, text: msg
    expect(page).to have_css '.hide_flash'
  end

end
