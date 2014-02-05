require 'spec_helper'

feature 'Viewing tickets' do
	before do
		textmate_2 = FactoryGirl.create(:project, name: 'TextMate 2')

		FactoryGirl.create(:ticket,
			project: textmate_2,
			title: 'Make it shiny!',
			description: 'Gradients! Oh my!')

		internet_explorer = FactoryGirl.create(:project, name: 'Internet Explorer')

		FactoryGirl.create(:ticket,
			project: internet_explorer,
			title: 'Kill!',
			description: 'Is not a joke.')

		visit '/'
	end

	scenario 'Viewing tickets for a given project' do
		click_link 'TextMate 2'

		expect(page).to have_content('Make it shiny!')
		expect(page).to_not have_content('Kill!')

		click_link 'Make it shiny!'
		within('#ticket h2') do
			expect(page).to have_content('Make it shiny!')
		end

		expect(page).to have_content('Gradients! Oh my!')
	end
end