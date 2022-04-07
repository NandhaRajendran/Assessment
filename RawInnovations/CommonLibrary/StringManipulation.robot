*** Settings ***
Documentation   Generic Library for All reusable String Manipulation Keywords
Library     SeleniumLibrary
Library     String

*** Variables ***
${UpdatedLocatorValue}

*** Keyword ***
Format Locator Property
    [Documentation]     This keyword is used to format a dynamic value to the Locator Object
    [Arguments]     ${LocatorElement}  ${FormatValue}
    #Arguments Required : ${LocatorElement}  ${FormatValue}
	#${LocatorElement} - Locator Element - Xpath
	#${FormatValue} - Dynamic Value to be formatted to Locator
	#Return: ${UpdatedLocatorValue} - Locator with dynamic value is returned
    #
         #        *Examples*:
         #        | *Keyword*               | *Attributes* |
         #        | Format Locator Property   | //div[contains(text(),'{}')] | Test Automation
    ${UpdatedLocatorValue}=  format string  ${LocatorElement}  ${FormatValue}
    [return]  ${UpdatedLocatorValue}