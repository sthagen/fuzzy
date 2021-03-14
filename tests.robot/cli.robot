*** Settings ***
Library           Process

*** Variables ***
${root_dir}                  ${CURDIR}/../

*** Test Cases ***
License Present
    ${result} =    Run Process    ls    ${root_dir}
    Should Contain    ${result.stdout}    LICENSE

License Correct
    ${result} =    Run Process    cat    ${root_dir}LICENSE
    Should Contain    ${result.stdout}    MIT License
