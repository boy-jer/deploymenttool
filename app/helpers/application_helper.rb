module ApplicationHelper

  attr_reader :toggle
  
  @toggle = FALSE;

  def approved_badge(approval)
    approval ? "<span class='approved'>&#10003;</span>".html_safe : NIL
  end
  
  def toggle_row_bg_color
    color = @toggle ? 'dark' : 'light'
    @toggle = (@toggle ? FALSE : TRUE)
    color
  end

end
