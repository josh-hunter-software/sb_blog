require 'spec_helper'

describe 'visitor', type: :feature do 
  context "visits home page" do 
    before do 
      u = FactoryGirl.create(:user)
      b = FactoryGirl.create(:blog)
      b.user = u
      u.save
    end
    it "should", js: true do 
    
    end
  end
end

