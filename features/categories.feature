Feature: Create And Edit Categories
  As a blog administrator
  So that readers can easily find similar articles
  I want to be able to create and edit new categories

Background:
  Given the blog is set up

Scenario: Successfully create new category
  Given I am logged into the admin panel
  When I follow "Categories"
  Then I should be on the new categories page
  When I fill in "Name" with "category1"
  And I fill in "Keywords" with "keyword1"
  And I fill in "Permalink" with "myslug"
  And I fill in "Description" with "abcdefg"
  And I press "Save"
  Then I should be on the new categories page
  And I should see "category1"
  And I should see "keyword1"
  And I should see "myslug"
  And I should see "abcdefg"