require 'spec_helper'

feature 'Deleting Projects' do
  scenario 'Deleting a project' do
    FactoryGirl.create(:project, name: 'MacVim')
   
    visit '/'
    click_link 'MacVim'
    click_link 'Delete Project'
    expect(page).to have_content('Project has beed destroyed.')

    visit '/'
    expect(page).to have_no_content('MacVim')
  end
end  
