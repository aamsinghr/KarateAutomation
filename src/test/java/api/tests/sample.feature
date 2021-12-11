@API
Feature: Sample feature
  
  Scenario: Print the text
    Given url 'https://reqres.in/api/users/4'
    When method GET
    Then status 200
    Then print 'Actual Response:', response
    