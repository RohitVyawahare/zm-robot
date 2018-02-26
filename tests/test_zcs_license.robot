*** Settings ***
Documentation          Test ZCS license
...                    - Check if the license is valid

Library                SSHLibrary
Suite Setup            Open Connection And Log In
Suite Teardown         Close All Connections

*** Variables ***
${HOST}                zqa-149.eng.zimbra.com
${USERNAME}            root
${PASSWORD}            zimbra

*** Test Cases ***
Validate if the license if OK
    [Documentation]    Check license using zmlicense -c
    ${output}=    Execute Command    su - zimbra -c 'zmlicense -c'
    Should Be Equal    ${output}  license is OK

*** Keywords ***
Open Connection And Log In
   Open Connection    ${HOST}
   Login    ${USERNAME}    ${PASSWORD}

