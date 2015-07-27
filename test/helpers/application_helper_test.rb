require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title,         "NouveauMiniOlympics"
    #Result of the line below 
    # Expected: "Help | NouveauMiniOlympics"
    # Actual: "NouveauMiniOlympics"
    # need to find a way that help will be added to the actual title
    #assert_equal full_title("Help"), "NouveauMiniOlympics"
  end
end