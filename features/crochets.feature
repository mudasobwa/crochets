Feature: Crochery built on top of Aquarium Aspects library is working
  In order to build and use crochets library
  A user defines hooks and they are called respectively

  Scenario: Check no hook
    Given The respective aspects are applied
    When I do not set the hook on tester method
    Then the hook is not being called

  Scenario: Check hook unsetting
    Given The respective aspects are applied
    When I set the hook on tester method
    And  I unset the hook on tester method
    Then the hook is not being called

  Scenario: Check hook setting
    Given The respective aspects are applied
    When I set the hook on tester method
    Then the hook is being called

  Scenario: Check non-blocking hook setting
    Given The respective aspects are applied
    When I set the non-blocking hook on tester method
#    And I wait for a while
    Then the hook is being called

