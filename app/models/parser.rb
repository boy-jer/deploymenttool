class Parser

  attr_reader :gsub_sets

  def initialize
    @gsub_sets = Hash.new
  end

  def parse(text)
    gsub_sets.each_pair do |variable, value|
      text.gsub!( get_regex_for(variable), value )
    end
    text
  end

private  

  def add_gsub_set(gsub_set)
    gsub_sets.merge! gsub_set
  end

  def get_regex_for(variable)
    regex = /\$\$#{variable}\$\$/
  end

  def method_missing(method_name, *arguments)
    return if method_name[0..-2] == 'gsub_sets'
    add_gsub_set( method_name[4..-2] => arguments[0].to_s ) if method_name[-1, 1] == "="
  end

end