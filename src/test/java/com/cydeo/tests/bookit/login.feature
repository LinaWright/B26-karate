Feature: Teacher user get authorization token
  Background:
    * url bookit_base_url
  Scenario: Teacher user login and get token
    Given header Accept = "application/json"
    And param email = "blyst6@si.edu"
    And param password = "barbabaslyst"
    And path "/sign"
    When method get
    Then status 200
    * def accessToken = response.accessToken
    * print "accessToken = " , accessToken

