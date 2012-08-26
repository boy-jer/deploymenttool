class Version < ActiveRecord::Base
  attr_accessible :audience_id, :campaign_id, :creative, :creative_approval, :from, :subject_line
end
