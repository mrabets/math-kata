require 'rails_helper'

RSpec.describe 'Pages content', type: :system do
  describe 'Home content' do
    it 'shows the last tasks' do
      visit root_path
      expect(page).to have_content('Last tasks')
    end

    it 'shows the most rated tasks' do
      visit root_path
      expect(page).to have_content('Most rated tasks')
    end
  end
end