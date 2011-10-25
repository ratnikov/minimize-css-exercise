require 'spec_helper'

require 'tempfile'

describe MinimizeCss do
  it "should remove all comments and blank lines from a file" do
    minimized_content =
'body {
 margin: 0;
 padding: 0;
}
#wrapper {
 background: #CCC;
}
#container {
 width: 990px;
 margin: 0px auto;
 background: #FFF;
}'

    original_css = fixture_path('style.css')
    minimized_css = Tempfile.new('mini_style.css')

    minimizer = MinimizeCss.new(original_css)
    minimizer.minimize_to(minimized_css)

    content = File.open(minimized_css, "r") { |f| f.read }
    content.should == minimized_content
  end
end
