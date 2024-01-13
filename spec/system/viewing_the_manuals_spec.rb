require 'rails_helper'

RSpec.describe "ViewingTheManuals", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "views the manual and sees some information" do
    visit '/manual'
    expect(page).to have_content('SWIIM')
  end

  it "sets the preference to mg/dL and sees that" do
    visit edit_users_path
    choose 'mg/dL'
    click_on 'Update Preferences'
    visit '/manual/monitoring'
    expect(page).to have_content ('mg/dL')
  end
end
