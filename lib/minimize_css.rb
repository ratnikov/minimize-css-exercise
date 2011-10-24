class MinimizeCss
  def initialize(input)
    @input = input
  end

  def minimize(content)
    content.gsub!(/\/\*.*\*\//, "")
    content.gsub!(/\n(\n)+/, "\n")
    content.strip!
  end

  def minimize_to(output)
    content = File.open(@input, "r") { |f| f.read }
    minimized_content = minimize(content)

    File.open(output, "w") { |f| f.write(minimized_content) }
  end
end
