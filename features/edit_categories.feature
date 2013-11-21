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
  