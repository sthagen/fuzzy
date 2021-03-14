***Settings***

*** Variables ***
${page_count}                  42

***Tasks***
Count Keyword
    Should Be Equal As Integers    ${page_count}    42    Did not find the answer to all questions
