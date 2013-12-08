require 'spec_helper'

feature 'Editing Projects' do
  before do
    FactoryGirl.create(:project, name: "MacVim")
    visit "/"
    click_link "MacVim"
    click_link "Edit Project"
  end
  
  scenario 'Updating a project' do
    fill_in "Name", with: "Vim!"
    click_button "Update Project"
    expect(page).to have_content("Project has been updated.")
  end
  
  scenario 'Updating a project with invalid attributes is bas' do
    fill_in "Name", with: ""
    click_button "Update Project"
    expect(page).to have_content("Project has not been updated.")
  end
end
