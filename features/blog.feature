Feature: Blog Feature

    Description: This feature is used to test SignUp

    Scenario: Create post positive
        Given I have logged in as a register user
            And I can access my profile information
        When I Create blog post
        Then I Check if blog post is created

    Scenario: Update post positive
        Given I have logged in as a register user
            And I can access my profile information
            And I Create blog post
            And I Check if blog post is created
        When I Change blog post title
        Then I Check if blog post title is changed