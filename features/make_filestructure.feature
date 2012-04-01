Feature: Make a Filestructure of a program
  In order to make creating a filestructure easy
  As a Developer
  I need to be able to have a tool that creates the filestructure with a simple dsl


  @wip @announce
  Scenario: Developer creates a single directory
    Given that a directory named index does not exist
    When directory('index') is invoked
    Then a folder named index should be created
    And I should see 'created index/'

