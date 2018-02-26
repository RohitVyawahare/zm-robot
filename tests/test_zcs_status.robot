*** Settings ***
Documentation          Test ZCS status
...                    - Validate ZCS version
...                    - Validate if the services are running fine

Library                SSHLibrary
Suite Setup            Open Connection And Log In
Suite Teardown         Close All Connections

*** Variables ***
${HOST}                <HOST where ZCS is installed>
${USERNAME}            <username>
${PASSWORD}            <password>

*** Test Cases ***
Validate ZCS version
    [Documentation]    Validate ZCS version
    ${output}=    Execute Command    su - zimbra -c 'zmcontrol -v'
    Should Be Equal    ${output}    Release 8.8.7_GA_1964.RHEL7_64_20180223145016 RHEL7_64 NETWORK edition.

Validate if the services are running fine
    [Documentation]    Validate if services are running fine               
    ${rc}=    Execute Command    su - zimbra -c 'zmcontrol status'  return_stdout=False    return_rc=True
    Should Be Equal    ${rc}    ${0}

*** Keywords ***
Open Connection And Log In
   Open Connection    ${HOST}
   Login    ${USERNAME}    ${PASSWORD}

