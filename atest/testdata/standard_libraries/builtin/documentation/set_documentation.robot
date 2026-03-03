*** Settings ***
Documentation        Old suite docs

*** Test Cases ***
Set test documentation
    Set test documentation      This has been set!\nTo several lines.
    Should be equal      ${TEST DOCUMENTATION}       This has been set!\nTo several lines.

Replace test documentation
   [Documentation]         This will be replaced
   Set test documentation      New doc
   Should be equal        ${TEST DOCUMENTATION}      New doc

Append to test documentation
   [Documentation]         Original doc
   Set test documentation      is continued    append please
   Should be equal        ${TEST DOCUMENTATION}      Original doc is continued
   Set test documentation      \n\ntwice!    append=yep
   Should be equal        ${TEST DOCUMENTATION}      Original doc is continued \n\ntwice!
   Set test documentation      thrice    append=yes    separator=${SPACE}
   Should be equal        ${TEST DOCUMENTATION}      Original doc is continued \n\ntwice! thrice
   Set test documentation      ${EMPTY}    append=yes    separator=!
   Should be equal        ${TEST DOCUMENTATION}      Original doc is continued \n\ntwice! thrice!
   Set test documentation      !    append=yes    separator=${EMPTY}
   Should be equal        ${TEST DOCUMENTATION}      Original doc is continued \n\ntwice! thrice!!

Set suite documentation
   Set suite documentation     New suite doc
   Should be equal        ${SUITE DOCUMENTATION}      New suite doc

Set suite documentation 2
   Should be equal        ${SUITE DOCUMENTATION}      New suite doc

Append to suite documentation
   Set suite documentation      is continued    append please
   Should be equal        ${SUITE DOCUMENTATION}      New suite doc is continued

Append to suite documentation 2
   Should be equal        ${SUITE DOCUMENTATION}      New suite doc is continued
   Set suite documentation      \n\ntwice!    append=yep
   Should be equal        ${SUITE DOCUMENTATION}      New suite doc is continued \n\ntwice!
   Set suite documentation      thrice    append=yep    separator=,
   Should be equal        ${SUITE DOCUMENTATION}      New suite doc is continued \n\ntwice!,thrice
   Set suite documentation      ${1}    append=yes    separator=?
   Should be equal        ${SUITE DOCUMENTATION}      New suite doc is continued \n\ntwice!,thrice?1

Set top level suite documentation
   Set suite documentation    Appended in test.    append=yes    top=please
   Should be equal        ${SUITE DOCUMENTATION}      New suite doc is continued \n\ntwice!,thrice?1

Set HTML test documentation
   Set test documentation      *HTML* My <b>HTML</b> test doc
   Should be equal        ${TEST DOCUMENTATION}      *HTML* My <b>HTML</b> test doc

Append HTML to non-HTML test documentation
   [Documentation]         Original non-HTML doc
   Set test documentation      *HTML* with <b>HTML</b> continuation    append=yes
   Should be equal        ${TEST DOCUMENTATION}      *HTML* Original non-HTML doc with <b>HTML</b> continuation

Append non-HTML to HTML test documentation
   [Documentation]         *HTML* Original <b>HTML</b> doc
   Set test documentation      with non-HTML <continuation>    append=yes
   Should be equal        ${TEST DOCUMENTATION}      *HTML* Original <b>HTML</b> doc with non-HTML &lt;continuation&gt;

Append HTML to HTML test documentation
   [Documentation]         *HTML* Original <b>HTML</b> doc
   Set test documentation      *HTML* with <i>more</i> HTML    append=yes
   Should be equal        ${TEST DOCUMENTATION}      *HTML* Original <b>HTML</b> doc with <i>more</i> HTML

Set HTML suite documentation
   Set suite documentation      *HTML* My <b>HTML</b> suite doc
   Should be equal        ${SUITE DOCUMENTATION}      *HTML* My <b>HTML</b> suite doc

Append HTML to non-HTML suite documentation
   Set suite documentation      with <b>HTML</b> continuation    append=yes
   Should be equal        ${SUITE DOCUMENTATION}      *HTML* My <b>HTML</b> suite doc with <b>HTML</b> continuation

Append non-HTML to HTML suite documentation
   Set suite documentation      with non-HTML <continuation>    append=yes
   Should be equal        ${SUITE DOCUMENTATION}      *HTML* My <b>HTML</b> suite doc with <b>HTML</b> continuation with non-HTML &lt;continuation&gt;

Append HTML to HTML suite documentation
   Set suite documentation      *HTML* with <i>more</i> HTML    append=yes
   Should be equal        ${SUITE DOCUMENTATION}      *HTML* My <b>HTML</b> suite doc with <b>HTML</b> continuation with non-HTML &lt;continuation&gt; with <i>more</i> HTML
