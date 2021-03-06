Feature: card ownership

    Background: no members
        Given the database is clean
        And exists a board with wip limit of 42
        And exists admin user
        And exists status todo

        Given I go to "/login"
        Then I fill in "_username" with "admin"
        And I fill in "_password" with "password"
        And I press "login"

    Scenario: Card without member assigned
        And exists one card with status todo
        When I go to "/card/1"
        Then the response should contain "never assigned"

    Scenario: Card with member assigned
        And exists member "sensorario"
        And exists one card with status "todo" assigned to "sensorario"
        When I go to "/card/1"
        Then the response should contain "sensorario"

    Scenario: Card owner in kanban
        And exists member "sensorario"
        And exists status "todo"
        And exists one card with status "todo" assigned to "sensorario"
        When I go to "/card/kanban"
        Then the response should contain "@sensorario"
