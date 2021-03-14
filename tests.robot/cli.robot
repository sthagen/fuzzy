*** Settings ***
Library           Process

*** Variables ***
${root_dir}                  ${CURDIR}/../

*** Test Cases ***
License Present
    [Tags]    license   existence
    ${result} =    Run Process    ls    ${root_dir}
    Should Contain    ${result.stdout}    LICENSE

License Correct
    [Tags]    license   content
    ${result} =    Run Process    cat    ${root_dir}LICENSE
    Should Contain    ${result.stdout}    MIT License
