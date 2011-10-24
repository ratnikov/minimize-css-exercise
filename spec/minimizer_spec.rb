require 'minimize_css'

describe Minimizer do
  it "should remove blank lines" do
    content =
      '
      #wrapper {
       background: #CCC;
      }

      #container {
       width: 990px;
       margin: 0px auto;
       background: #FFF;
      }
      '

    minimized_content =
      '#wrapper {
       background: #CCC;
      }
      #container {
       width: 990px;
       margin: 0px auto;
       background: #FFF;
      }'

    Minimizer.minimize(content).should == minimized_content
  end

  it "should remove lines that are only comments" do
    content =
      '/* reset a few things */
      body {
       margin: 0;
       padding: 0;
      }'

    minimized_content =
      'body {
       margin: 0;
       padding: 0;
      }'

    Minimizer.minimize(content).should == minimized_content
  end

  it "should remove blank lines and lines that are only comments" do
    content =
      '
      /* color of brain-matter */
      #wrapper {
       background: #CCC;
      }

      #container {
       width: 990px;
       margin: 0px auto;
       background: #FFF;
      }
      '

    minimized_content =
      '#wrapper {
       background: #CCC;
      }
      #container {
       width: 990px;
       margin: 0px auto;
       background: #FFF;
      }'

    Minimizer.minimize(content).should == minimized_content
  end

  it "should return empty string for a string that consists only of blank lines and comments" do
    content =
      '
      /* @todo: define styles for body */

      /* @todo: define styles for header */
      /* @todo: define styles for footer */

      /* @todo: define styles for main menu */
      '

    minimized_content = ''

    Minimizer.minimize(content).should == minimized_content
  end
end