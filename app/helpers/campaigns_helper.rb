module CampaignsHelper

  def sql_syntax_highlight(text)
    text.gsub!(/(?:^| )(SELECT|FROM|WHERE|NOT|EXISTS|IN|AND|GROUP|BY)/, '<span class="statement"> \1</span>')
    text.gsub!(/\'(.*?)\'/, '<span class="enclosed_string">\'\1\'</span>')
    text.gsub!(/[[:space:]*](\d+)/, '<span class="number"> \1</span>')
    text.gsub!(/\[(.*?)\]/, '<span class="data_extension">[\1]</span>')
    text
  end

end