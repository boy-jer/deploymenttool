class Segment < ActiveRecord::Base

  attr_accessible :segmentation, :version_id, :suppressions, :data_file

  belongs_to :campaign

  def scripted_segmentation
    @parser = Parser.new
    
    @parser.set_table = campaign.treatment_name
    @parser.set_campaign_id = campaign.id.to_s
    @parser.set_brand_code = campaign.brand.code

    
    @parser.parse(segmentation)
  end

end
