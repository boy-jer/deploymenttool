require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the CampaignsHelper. For example:
#
# describe CampaignsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe CampaignsHelper do

  subject { helper }
  
  it { should respond_to :toggle_row_bg_color}

  describe "toggle_row_bg_color" do
    it "toggles between two colors" do
      color_1 = helper.toggle_row_bg_color
      color_2 = helper.toggle_row_bg_color
      
      color_1.should_not == color_2
    end
  end
end
