class Segment < ActiveRecord::Base

  attr_accessible :version_id, :suppressions, :data_file

  belongs_to :segmentation

end
