module Minimizer
  extend self

  def minimize(content)
    content.gsub!(/\/\*.*\*\//, "")
    content.gsub!(/\n(\n)+/, "\n")
    content.strip!
  end
end
