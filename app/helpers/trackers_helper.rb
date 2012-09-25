module TrackersHelper

  attr_accessor :day_code
  
  def campaign_is_due_tomorrow_relative_to_pointer(drop_date, compare_time)
    return TRUE if (drop_date > compare_time) else FALSE
  end
  
  def campaign_is_due_today_relative_to_pointer(drop_date, compare_time)
    return TRUE if (drop_date < compare_time) else FALSE
  end

end
