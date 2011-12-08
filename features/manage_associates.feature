@associates
Feature: Associates
  In order to have associates on my website
  As an administrator
  I want to manage associates

  Background:
    Given I am a logged in refinery user
    And I have no associates

  @associates-list @list
  Scenario: Associates List
   Given I have associates titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of associates
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @associates-valid @valid
  Scenario: Create Valid Associate
    When I go to the list of associates
    And I follow "Add New Associate"
    And I fill in "Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 associate

  @associates-invalid @invalid
  Scenario: Create Invalid Associate (without name)
    When I go to the list of associates
    And I follow "Add New Associate"
    And I press "Save"
    Then I should see "Name can't be blank"
    And I should have 0 associates

  @associates-edit @edit
  Scenario: Edit Existing Associate
    Given I have associates titled "A name"
    When I go to the list of associates
    And I follow "Edit this associate" within ".actions"
    Then I fill in "Name" with "A different name"
    And I press "Save"
    Then I should see "'A different name' was successfully updated."
    And I should be on the list of associates
    And I should not see "A name"

  @associates-duplicate @duplicate
  Scenario: Create Duplicate Associate
    Given I only have associates titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of associates
    And I follow "Add New Associate"
    And I fill in "Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 associates

  @associates-delete @delete
  Scenario: Delete Associate
    Given I only have associates titled UniqueTitleOne
    When I go to the list of associates
    And I follow "Remove this associate forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 associates
 