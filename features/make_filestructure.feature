Feature: Make a Filestructure of a program
  In order to make creating a filestructure easily
  As a Developer
  I need to be able to have a tool that creates the filestructure with a simple dsl

  Scenario: Developer creates a directory
    Given I have the binary "imakefile"
    And the option "--directory mydir"
    When I run imakefile with the option
    Then a directory named "mydir" should be created
    And the output should contain "Filestructure Successfully Created!!"
