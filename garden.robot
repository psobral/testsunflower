*** Settings ***


Library        AppiumLibrary

#EXECUTA KEYWORD ANTES DE CADA TESTCASE
Test Setup        Open Session
# EXECUTA KEYWORD DEPOIS DE CADA TESTCASE
Test Teardown     Close Session    

*** Variables ***
${START}         ADD PLANT
${FILTER}        xpath=//android.widget.TextView[@content-desc="Filter by grow zone"]
${PLANT_LIST}	 xpath=//android.widget.LinearLayout[@content-desc="Plant list"]



*** Test Cases ***
Cenário 01: Consultar uma planta 
    Open Session
    Open Nav
    
    Wait Until Page Contains         Avocado 
    Click Text                       Avocado
    Element Text Should Be           id=com.google.samples.apps.sunflower:id/plant_watering_header             Watering needs

Cenário 02: Adicionar uma planta 
    Open Session
    Open Nav
    
    Wait Until Page Contains         Avocado 
    Click Text                       Avocado
    Element Text Should Be           id=com.google.samples.apps.sunflower:id/plant_watering_header             Watering needs
    Wait Until Element Is Visible    id=com.google.samples.apps.sunflower:id/fab
    Click Element                    id=com.google.samples.apps.sunflower:id/fab
    

Cenário 03: Validar se a planta foi adicionada  
    Open Session
    Open Nav
    
    Wait Until Page Contains         Avocado 
    Click Text                       Avocado
    Element Text Should Be           id=com.google.samples.apps.sunflower:id/plant_watering_header             Watering needs
    Wait Until Element Is Visible    id=com.google.samples.apps.sunflower:id/fab
    Click Element                    id=com.google.samples.apps.sunflower:id/fab
    
    Wait Until Element Is Visible    class=android.widget.ImageButton
    Click Element                     class=android.widget.ImageButton

    Wait Until Element Is Visible    xpath=//android.widget.LinearLayout[@content-desc="My garden"]
    Click Element                    xpath=//android.widget.LinearLayout[@content-desc="My garden"]

    Element Text Should Be           id=com.google.samples.apps.sunflower:id/plant_name        Avocado   
    

***keywords***
Open Session  
    Set Appium Timeout      5  
    Open Application        http://localhost:4723/wd/hub
    ...                     automationName=UiAutomator2
    ...                     platformName=Android
    ...                     deviceName=Emulator
    ...                     app=${EXECDIR}/app/sunflower.apk
    ...                     udid=emulator-5554
    
    Get Started

Close Session
    Close Application

Get Started
    Wait Until Page Contains         ${START}   
    Click Text                       ${START}        
 

Open Nav
    Wait Until Element Is Visible    ${FILTER}      
    
    Click Element                    ${FILTER} 
    Wait Until Element Is Visible    ${PLANT_LIST}
