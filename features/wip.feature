Feature: wip limit

    Background: clean database
        Given the database is clean

    Scenario: cant exceed wip limit
        Given exists a board with wip limit of 2
        When exists status "todo" with wip limit 1
        And exists member "sensorario"
        And exists one card assigned to "sensorario"
        And I go to "/card/new"
        And I fill in "Title" with "sample"
        And I fill in "Description" with "sample"
        And I select "todo" from "appbundle_card[status]"
        And I press "Create"
        Then the response should contain "wip column limit reached"

    Scenario: board's wip limit
        Given exists a board with wip limit of 1
        And exists status "todo" with wip limit 42
        And exists member "sensorario"
        And exists one card assigned to "sensorario"
        When I go to "/card/new"
        And I fill in "appbundle_card[title]" with "Title"
        And I fill in "appbundle_card[description]" with "description ..."
        And I select "todo" from "appbundle_card[status]"
        And I press "Create"
        Then I go to "/card/new"
        And I fill in "appbundle_card[title]" with "Title"
        And I fill in "appbundle_card[description]" with "description ..."
        And I select "todo" from "appbundle_card[status]"
        And I press "Create"
        Then the response should contain "wip board limit reached"
