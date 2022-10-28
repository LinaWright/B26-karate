Feature: Spartan Rest API: get spartan tests

  Background:
    Given url spartan_base_url

#    Given base url is ...
#    And accept type is Json
#    When I send GET request to /spartans
#    Then status code should be 200
#    And content type should be application json
#    And print the response
  Scenario: Get all spartans
    Given header Accept = "application/json"
    When path "/spartans"
    When method get
    Then status 200
    And match header Content-Type == "application/json"
    And print response


#      Scenario: Get single spartan and verify data
#      Given base url is set
#      And accept type is json
#      And path param id is 88
#      When I send get request to /spartans/{id}
#      Then status code is 200
#      And content type is json
#      And body
    #    {
    #    "id": 88,
    #    "name": "Julie",
    #    "gender": "Male",
    #    "phone": 1279288759
    #    }
   Scenario: Get single spartan and verify data
     Given header Accept = "application/json"
     And path "/spartans/" , 88
     When method get
     Then status 200
     And match header Content-Type == "application/json"
     And match response.id == 88
     And match response.name == "Julie"
     And match response.gender ==  "Male"
     And match response.phone ==  1279288759
     And match response == {id:88, name:"Julie", gender:"Male", phone:1279288759}
     * def spartanId = 88
     * print "spartan = ID " , spartanId
     * match spartanId == 88


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

  Scenario: Search for spartans using query params
