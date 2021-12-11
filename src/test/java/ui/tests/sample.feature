@UI
Feature: Karate UI Sample feature

Background:
* configure driver = { type: 'chrome', executable: 'C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe' }
  
  Scenario: Sample UI scenario
    Given driver 'https://www.google.com/'
    * waitFor("input[title='Search']")
    * input("input[title='Search']", 'Karate ui automation')
    * delay(5000)
