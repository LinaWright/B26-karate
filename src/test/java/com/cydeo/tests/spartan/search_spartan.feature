
Feature: Searching spartans

  Background:
    * url spartan_base_url

Scenario: Search for spartans using query params
  Given header Accept = "application/json"
  And param gender = "Female"
  And param nameContains = "A"
  #When I send get request to /spartans/search
  And path "/spartans/search"
  When method GET
  Then status 200
  And match header Content-Type == "application/json"
  #response body verifications:
  * print "total elements count = " , response.totalElement
  And match response.totalElement == 74
  * print "name of first spartan = " , response.content[0].name
  * print "id of first spartan = " , response.content[0].id
  #assert first spartan name contains A
  * def firstSpartanName = response.content[0].name
  And match firstSpartanName contains "a"
  And match karate.lowerCase(firstSpartanName) contains "a"
  * def allNames = $.content[*].name
  * print "all names = " , allNames
  And match response.content[*].name contains ["Lorenza", "Olga", "Svetlana"]

  #check if each gender is "Female"
  * def allGenders = $.content[*].gender
  * print "gender values = " , allGenders
  And match each response.content[*].gender == "Female"

  #check if each name contains letter a
