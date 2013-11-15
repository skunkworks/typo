Feature: Merge Articles
  As a blog administrator
  In order to reduce the number of redundant or similar blog posts
  I want to be able to merge two articles into one

  Background:
    Given the blog is set up

    And the following users exist:
  | login | name          | email          | password | profile_id | state  |
  | user1 | First Author  | user1@test.com | foobar   | 2          | active |
  | user2 | Second Author | user2@test.com | foobar   | 3          | active |
    
    And the following articles exist:
  | title     | body          | author        | published |
  | Article 1 | Lorum Ipsum 1 | First Author  | true      |
  | Article 2 | Lorum Ipsum 2 | Second Author | true      |

    And the following comments exist:
  | article_title | author | body             | published | status_confirmed |
  | Article 1     | Guy 1  | An inane comment | true      | true             |
  | Article 2     | Guy 2  | Begawk           | true      | true             |
 
  Scenario: Successfully merge articles
    Given I am logged into the admin panel
    And I am on the admin content page
    When I follow "Article 1"
    Then I should be on the edit content page for "Article 1"
    And I should see "Merge with article ID"
    When I fill in "merge_with" with the article ID of "Article 2"
    And I press "Merge With This Article"
    Then I should be on the edit content page for "Article 1" or "Article 2"
    And I should see "Successfully merged with article"
    When I go to the admin content page
    Then I should see the author as "First Author" or "Second Author"
    When I go to the home page
    And I follow "Article 1" or "Article 2"
    Then I should see "Lorum Ipsum 1"
    And I should see "Lorum Ipsum 2"
    And I should see "Guy 1"
    And I should see "An inane comment"
    And I should see "Guy 2"
    And I should see "Begawk"

  Scenario: publisher users cannot merge articles
    Given I log in as "user1" with password "foobar"
    And I am on the admin content page
    When I follow "Article 1"
    Then I should not see "Merge with article ID"