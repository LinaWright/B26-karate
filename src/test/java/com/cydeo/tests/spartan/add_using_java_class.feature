Feature:
Feature: Add new spartan using random name

  Background:
    * url spartan_base_url

  Scenario: Post new spartan
    Given header Content-Type = "application/json"
    And header Accept = "application/json"
    #create variable and assign utils class
    * def apiUtils = Java.type('com.cydeo.utils.APIUtils')
    * def randomName = apiUtils.getRandomName()
    * print "random name from feature file = " , randomName
    #set json body of request
    And request {name : '#(randomName)', gender : "Male", phone:1231231234}
    And path "/spartans"
    When method POST
    Then status 201
