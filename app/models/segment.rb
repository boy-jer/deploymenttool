class Segment < ActiveRecord::Base

  attr_accessible :segmentation, :version_id, :suppressions, :data_file

  belongs_to :campaign

  def scripted_segmentation
    @parser = Parser.new
    
    @parser.set_treatment_name = campaign.treatment_name
    @parser.set_campaign_id = campaign.alt_id.to_s
    @parser.set_brand_code = campaign.brand.code
    
    @parser.parse(segmentation)
  end
  
  def script(segment)
    @parser = Parser.new
  
    @parser.set_treatment_name = campaign.treatment_name
    @parser.set_campaign_id = campaign.alt_id.to_s
    @parser.set_brand_code = campaign.brand.code
    
    @parser.parse(segment)
  end

end
