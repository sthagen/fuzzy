***Settings***
Library           OperatingSystem
Library           Process

*** Variables ***
${root_dir}                  ${CURDIR}/../
${page_count}                  42

*** Test Cases ***
Count Keyword
    [Tags]    sample   test case
    Should Be Equal As Integers    ${page_count}    42    Did not find the answer to all questions

Fuzzy Smoke Test
    [Tags]    smoke   test
    ${result} =    Run Process    ls    ${root_dir}
    Should Contain    ${result.stdout}    fuzzy

Fuzzy Call
    [Tags]    call   test
    ${rc} =	Run and Return RC	python -m fuzzy arg
    Should Be Equal As Integers	${rc}	0

Test Robot Framework Logging
    [Tags]    sample   log
    Log    Test Logging

Test My Robot Framework Logging
    [Tags]    sample   warn
    My Logging    My Message    WARN

*** Keywords ***
My Logging
    [Arguments]    ${msg}    ${level}
    Log    ${msg}    ${level}
