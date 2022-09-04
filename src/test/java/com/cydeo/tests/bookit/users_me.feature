Feature: Teacher user get info

  Background:
    * url bookit_base_url

  Scenario: Teacher user get info "/api/users/me"
    #call login.feature file and store response to login variable
    * def login = call read('login.feature')
    #get access token value and print out
    * print "access token = " , login.accessToken
    Given header Accept = "application/json"
    And header Authorization = login.accessToken
    And path "/api/users/me"
    When method GET
    Then status 200
    And match response.role == "teacher"
