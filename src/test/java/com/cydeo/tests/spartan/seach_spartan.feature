#    Given base url is set
#    And accept type is json
#    And query param gender is Female
#    And query param nameContains is A
#    When I send get request to /spartans/search
#    Then status code is 200
#    And content type is json
#    And total Element is 32
#    And first spartan name is Jaimie
#    And "Lorenza, Nona, Elizabeth" are among the names
Feature:  Searching spartans

  Background:
    * url spartan_base_url

  Scenario: Search for spartans using query params
    Given header Accept = "application/json"
    And param gender = "Female"
    And param nameContains = "a"
    And path "/spartans/search"
    When method get
    Then status 200
    And match header Content-Type == "application/json"
  #response body verifications:
    * print "total elements count = " , response.totalElement
    * match response.totalElement == 66

    # Get the name of first spartan
    * print "name of first spartan = " , response.content[0].name
    * print "id of first spartan = " , response.content[0].id

    #assert first spartan name contains A
    * def firstSpartanName = response.content[0].name
    And match firstSpartanName contains "a"
    And match karate.lowerCase(firstSpartanName) contains "a"
    #  * print "all names = ", response.content[*].name (this one doesn't work)
    * def allNames = $.content[*].name
    * print allNames
    And match response.content[*].name contains "Janna"
    And match response.content[*].name contains["Janna","Jeanelle","Delora"]

    #check if each gender is "Female"
    * def allGenders = $.content[*].gender
    * print allNames
    And match each $.content[*].gender == "Female"

    #check if each name contains letter a
    And match each karate.lowerCase(allNames) contains "a"
