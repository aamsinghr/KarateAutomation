#Author: aam.singh@gmail.com
#Keywords Summary :
#Feature: List of scenarios.
#Scenario: Business rule through list of steps with arguments.
#Given: Some precondition step
#When: Some key actions
#Then: To observe outcomes or validation
#And,But: To enumerate more Given,When,Then steps
#Scenario Outline: List of steps for data-driven as an Examples and <placeholder>
#Examples: Container for s table
#Background: List of steps run before each of the scenarios
#""" (Doc Strings)
#| (Data Tables)
#@ (Tags/Labels):To group Scenarios
#<> (placeholder)
#""
## (Comments)
#Sample Feature Definition Template
@API
Feature: user Details
  I want to use this template for my feature file
  
  Background:
  	* print classpath
  	* def expectedOutput = read('classpath:api/data/userDetails.json')
  	* def result = call read('sample.feature')

  @API
  Scenario: Request user 2 details
    Given url 'https://reqres.in/api/users/2'
    When method GET
    # compare status
    Then status 200
    # print response
    Then print 'Actual Response:', response
    #instead of Given When Then, we can use *
    * print 'Expected Response:: ', expectedOutput[0]
    # match full json response
    And match response == expectedOutput[0]
    #match a single field
    * match response.data.id == 2
    # check if a field is not null
    * match response.data.last_name != null
    # check if a field is not present, say job_code
    * def job_code = response.data.job_code
    * print 'job code: ',job_code
    * match job_code == null
    
  @API
  Scenario: Request user 3 details
    Given url 'https://reqres.in/api/users/3'
    When method GET
    Then status 200
    Then print 'Actual Response:', response
    * print 'Expected Response:: ', expectedOutput[1]
    * match response == expectedOutput[1]
    * print 'Result from another feature call: ',result.response
    