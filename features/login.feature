Feature: Login Feature
    Description: This feature is used to test Login

    Scenario: Login positive
        Given I have logged in as a register user
        Then I can access my profile information
    
    Scenario: Login negative
        Given I try to login with invalid password
        Then I check if I am not logged in