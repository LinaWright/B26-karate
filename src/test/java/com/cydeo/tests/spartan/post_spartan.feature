Feature: Add new spartan

  Background:
    * url spartan_base_url

#    Given content type is json
#    And accept type is json
#    And body is name=karate, gender=Male, phone=1231231234
#    Then I send Post request to /spartans
#    Then status code is 201
#    And id is a number
#    And success is "A Spartan is Born!"
#    And name is karate
#
#  declare variable newSpartanId and assign generated id
#
#    Then send GET request to /sparatans/newSpartanId
#    And status code is 200

  Scenario: Post new spartan
    Given header Content-Type = "application/json"
    And header Accept = "application/json"
    #set json body of request
    And request {name : "karate", gender : "Male", phone:1231231234}
    And path "/spartans"
    When method POST
    Then status 201
    And match response.data.id == '#number'
    * def successMessage = response.success
    * print "message = " , successMessage
    And assert successMessage == "A Spartan is Born!"
    And assert response.data.name == "karate"

    * def newSpartanId = response.data.id
    * print "newSpartanId = " , newSpartanId

    #send get request
    Given header Accept = "application/json"
    And path "/spartans",newSpartanId
    When method get
    Then status 200
    And match response == {id: '#(newSpartanId)', name : "karate", gender : "Male", phone:1231231234}

    #delete newly created spartan using newSpartanId
    Given path "/spartans",newSpartanId
    When method delete
    Then status 204
