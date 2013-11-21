Feature: Edit Categories
  As a blog administrator
  So that readers can easily find similar articles
  I want to be able to create new categories

Background:
  Given the blog is set up

  And the following categories exist:
| name      | keywords | permalink | description |
| category1 | keyword1 | myslug    | abcdefg     |

Scenario: Successfully edit existing category
  Given I am logged into the admin panel
  When I go to the edit category page for "category1"
  And I fill in "Name" with "category2"
  And I fill in "Keywords" with "keyword2"
  And I fill in "Permalink" with "mynewslug"
  And I fill in "Description" with "qwerty"
  And I press "Save"
  Then I should be on the new categories page
  And I should see "category2"
  And I should see "keyword2"
  And I should see "mynewslug"
  And I should see "qwerty"