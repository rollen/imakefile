Feature: Make a Filestructure of a program
  In order to make creating a filestructure easily
  As a Developer
  I need to be able to have a tool that creates the filestructure with a simple dsl

  Scenario: Developer creates a directory
    Given I have the imakefile tool
    When I invoke it using a configuration file with on a directory specified
    Then I should see only the directory created
