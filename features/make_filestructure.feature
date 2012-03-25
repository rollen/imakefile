@announce
Feature: Make a Filestructure of a program
  In order to make creating a filestructure easily
  As a Developer
  I need to be able to have a tool that creates the filestructure with a simple dsl

  Scenario: Developer creates a directory
    When I successfully run "imakefile --directory mydir" 
    Then a directory named "mydir" should exist
    And I should see
      """
      Filestructure Successfully Created!!
      """
