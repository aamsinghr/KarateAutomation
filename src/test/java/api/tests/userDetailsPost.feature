@API
Feature: Post user Details
  To send the post request to create a user.
  
  Background:
  	* print classpath
  	* def reqPayload = read('classpath:api/data/requestCreateUser.json')
  	* def id = null
  	

  @API
  Scenario: Post Request to create a new user
    Given url 'https://reqres.in/api/users'
    * request reqPayload
    # header Content-Type = 'application/json'
    * headers {Content-Type : 'application/json', Accept : 'application/json'}
    * param delay = 3
    When method POST
    Then status 201
    * print 'resposne new user: ',response
    * def id = response.id
    * print 'id :', id
    
    @API
    Scenario: Get Request to verify new user
    * print 'id :', id
    Given url 'https://reqres.in/api/users'
    * path id
    When method GET
    Then status 200
   