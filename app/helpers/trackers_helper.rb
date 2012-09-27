module TrackersHelper

  attr_accessor :day_code, :time_pointer
  
  def due_tomorrow(drop_date, time_marker)
    return TRUE if (drop_date >= time_marker) else FALSE
  end

end
