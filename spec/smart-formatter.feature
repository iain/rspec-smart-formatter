Feature: Smart Formatter

  Because I want to save time figuring out which tests have failed,
  I can specify to always use the smart formatter
  So it will choose the best possible formatter for me.

  Background:
    Given I have installed the smart formatter



  Scenario: Running only a couple of specs

    With a couple of specs, it's easier to use the documentation formatter.
    It allowes you to see in relation to other specs, which specs failed.
    I'm guessing about 20 specs is the maximum for documentation to be readable.

    When I run 20 specs
    Then I should see the documentation output

  Scenario: Running a lot of specs

    Wit a lot of specs, you'd want a shorter output.
    Since we cannot be sure you have something fancy like Fuubar installed, it will use progress

    When I run 100 specs
    Then I should see the progress output

