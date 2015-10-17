require 'spec_helper'

feature 'Flight' do
  scenario 'should successfull define component', js: true do
    visit root_path
    expect(page.find('.js-component')).to have_text('It works!')
  end
end
