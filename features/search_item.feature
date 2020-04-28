Feature: Searching
  Background: user visits MTA store
    Given user visits MTA store

  @search
  Scenario Outline: user might see searched item in suggested lists
    When user enters "<search_name>" text in Search field on Homepage
    Then user can see the "<found_name>" text in suggested list1
    #Then user can see the "<found_name>" text in suggested list2
    Examples:
      |search_name |found_name|
      |apple       |apple     |

#  Scenario Outline: user might see searched item in search results page
#    When user enters "<search_name>" text in Search field on Homepage
#    Then user hit Enter button in Search field on Homepage
#    Then user can see the "<found_name>" text in Search results page
#    Examples:
#      |search_name |found_name|
#      |apple       |apple     |

  # показати і дати завдання на wait_until, на xpath, українські літери в терміналі
