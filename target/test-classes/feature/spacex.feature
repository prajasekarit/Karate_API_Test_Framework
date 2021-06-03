Feature: Validation of Space X API 


  Background:
    * url 'https://api.spacexdata.com/v4/launches/'
    * def pathFun = Java.type('filePath.UserPath')
    * def path = new pathFun().systemPath();
    * def expectedOut = read('classpath:/resources/response.json')

  Scenario Outline: Validate the API Response Status as 200
    Given path 'latest'
    When method get
    Then status <Status_code>
Examples:
|Status_code|
|200|

Scenario: Validate the Response we are getting is matching with expected output file
   Given path 'latest'
    When method get
    Then print response
    Then match response  == expectedOut
    
    
Scenario: Validate the ID value in Response
   Given path 'latest'
    When method get
    Then match response.id  == '6079bd399a06446e8c61bf77'
    Then match response.fairings.reused == true
    
Scenario: Validate that particular key value is present in response
   Given path 'latest'
    When method get
    Then match response.static_fire_date_utc  ==  null