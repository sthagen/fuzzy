***Settings***
Library           OperatingSystem
Library           Process

*** Variables ***
${root_dir}                  ${CURDIR}/../
${page_count}                  42

*** Test Cases ***
Count Keyword
    Should Be Equal As Integers    ${page_count}    42    Did not find the answer to all questions

Fuzzy Smoke Test
    ${result} =    Run Process    ls    ${root_dir}
    Should Contain    ${result.stdout}    LICENSE

Fuzzy Call
    ${rc} =	Run and Return RC	python -m fuzzy arg
    Should Be Equal As Integers	${rc}	0

Test Robot Framework Logging
    Log    Test Logging

Test My Robot Framework Logging
    My Logging    My Message    WARN

*** Keywords ***
My Logging
    [Arguments]    ${msg}    ${level}
    Log    ${msg}    ${level}
    