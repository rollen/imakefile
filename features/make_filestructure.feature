Feature: Make a Filestructure of a program
  In order to make creating a filestructure easy
  As a Developer
  I need to be able to have a tool that creates the filestructure with a simple dsl


  Scenario: Developer creates a single directory
    Given that a directory named index does not exist
    When directory('index') is invoked
    Then a folder named index should be created
    And I should see 'created index/'


  Scenario: Developer creates a file
    Given that a file named myfile does not exist
    When file('index') is invoked
    Then a file named index should be created
    And I should see 'created file'

  Scenario: Developer creates a nested directory stucture
    Given that the following directories do not exist
      |dirname|
      |root|
      |root/app|
    When I create them using the specified dsl
      |dirname|
      |root|
      |root/app|
    Then I should see the root and root/app directories

