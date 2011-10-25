require 'spec_helper'

describe Minimizer do
  it "should remove blank lines" do
    content = <<-CONTENT
foo
baz

bar



zeta
    CONTENT

    Minimizer.minimize(content).should == "foo\nbaz\nbar\nzeta"
  end

  it "should remove comments" do
    content = <<-CONTENT
foo
/* this is a new line comment

bar /* with a side comment */

/**
 * multiline comment!
 */
baz
    CONTENT

    Minimizer.minimize(content).should == "foo\nbar\baz"
  end

  it "should return empty string for a string that consists only of blank lines and comments" do
    content = <<-CONTENT
      /* @todo: define styles for body */

      /* @todo: define styles for header */
      /* @todo: define styles for footer */

      /* @todo: define styles for main menu */
    CONTENT

    Minimizer.minimize(content).should == ""
  end
end
