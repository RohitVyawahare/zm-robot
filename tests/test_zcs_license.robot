*** Settings ***
Documentation          Test ZCS license
...                    - Check if the license is valid

Library                SSHLibrary
Suite Setup            Open Connection And Log In
Suite Teardown         Close All Connections
Variables              ../conf/variables.py

*** Variables ***

*** Test Cases ***
Validate if the license if OK
    [Documentation]    Check license using zmlicense -c
    ${output}=    Execute Command    su - zimbra -c 'zmlicense -c'
    Should Be Equal    ${output}  license is OK

*** Keywords ***
Open Connection And Log In
   Open Connection    ${HOST}
   Login    ${USERNAME}    ${PASSWORD}

