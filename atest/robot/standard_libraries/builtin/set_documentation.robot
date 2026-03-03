*** Settings ***
Suite Setup       Run Tests    ${EMPTY}    standard_libraries/builtin/documentation/
Resource          atest_resource.robot

*** Test Cases ***
Set test documentation
    ${tc} =    Check Test Doc    ${TESTNAME}     This has been set!\nTo several lines.
    Check Log Message    ${tc[0, 0]}    Set test documentation to:\nThis has been set!\nTo several lines.

Replace test documentation
    ${tc} =    Check Test Doc    ${TESTNAME}    New doc
    Check Log Message    ${tc[0, 0]}    Set test documentation to:\nNew doc

Append to test documentation
    ${tc} =    Check Test Doc    ${TESTNAME}     Original doc is continued \n\ntwice! thrice!!
    Check Log Message    ${tc[0, 0]}    Set test documentation to:\nOriginal doc is continued
    Check Log Message    ${tc[2, 0]}    Set test documentation to:\nOriginal doc is continued \n\ntwice!
    Check Log Message    ${tc[4, 0]}    Set test documentation to:\nOriginal doc is continued \n\ntwice! thrice
    Check Log Message    ${tc[6, 0]}    Set test documentation to:\nOriginal doc is continued \n\ntwice! thrice!
    Check Log Message    ${tc[8, 0]}    Set test documentation to:\nOriginal doc is continued \n\ntwice! thrice!!

Set suite documentation
    ${tc} =    Check Test Case    ${TESTNAME}
    Check Log Message    ${tc[0, 0]}    Set suite documentation to:\nNew suite doc
    Check Test Case    ${TESTNAME} 2
    Should Start With    ${SUITE.suites[0].doc}    New suite doc

Append to suite documentation
    ${tc} =    Check Test Case    ${TESTNAME}
    Check Log Message    ${tc[0, 0]}    Set suite documentation to:\nNew suite doc is continued
    ${tc} =    Check Test Case    ${TESTNAME} 2
    Check Log Message    ${tc[1, 0]}    Set suite documentation to:\nNew suite doc is continued \n\ntwice!
    Check Log Message    ${tc[3, 0]}    Set suite documentation to:\nNew suite doc is continued \n\ntwice!,thrice
    Check Log Message    ${tc[5, 0]}    Set suite documentation to:\nNew suite doc is continued \n\ntwice!,thrice?1
    Should Be Equal    ${SUITE.suites[0].doc}    New suite doc is continued \n\ntwice!,thrice?1

Set init file suite docs
    Should Be Equal     ${SUITE.doc}    Init file doc. Concatenated in setup. Appended in test.
    Check Log Message    ${SUITE.setup[0]}    Set suite documentation to:\nInit file doc. Concatenated in setup.

Set top level suite documentation
    ${tc} =    Check Test Case    ${TESTNAME}
    Check Log Message    ${tc[0, 0]}    Set suite documentation to:\nInit file doc. Concatenated in setup. Appended in test.

Set HTML test documentation
    ${tc} =    Check Test Doc    ${TESTNAME}     *HTML* My <b>HTML</b> test doc
    Check Log Message    ${tc[0, 0]}    Set test documentation to:\n*HTML* My <b>HTML</b> test doc

Append HTML to non-HTML test documentation
    ${tc} =    Check Test Doc    ${TESTNAME}     *HTML* Original non-HTML doc with <b>HTML</b> continuation
    Check Log Message    ${tc[0, 0]}    Set test documentation to:\n*HTML* Original non-HTML doc with <b>HTML</b> continuation

Append non-HTML to HTML test documentation
    ${tc} =    Check Test Doc    ${TESTNAME}     *HTML* Original <b>HTML</b> doc with non-HTML &lt;continuation&gt;
    Check Log Message    ${tc[0, 0]}    Set test documentation to:\n*HTML* Original <b>HTML</b> doc with non-HTML &lt;continuation&gt;

Append HTML to HTML test documentation
    ${tc} =    Check Test Doc    ${TESTNAME}     *HTML* Original <b>HTML</b> doc with <i>more</i> HTML
    Check Log Message    ${tc[0, 0]}    Set test documentation to:\n*HTML* Original <b>HTML</b> doc with <i>more</i> HTML

Set HTML suite documentation
    ${tc} =    Check Test Case    ${TESTNAME}
    Check Log Message    ${tc[0, 0]}    Set suite documentation to:\n*HTML* My <b>HTML</b> suite doc

Append HTML to non-HTML suite documentation
    ${tc} =    Check Test Case    ${TESTNAME}
    Check Log Message    ${tc[0, 0]}    Set suite documentation to:\n*HTML* My <b>HTML</b> suite doc with <b>HTML</b> continuation

Append non-HTML to HTML suite documentation
    ${tc} =    Check Test Case    ${TESTNAME}
    Check Log Message    ${tc[0, 0]}    Set suite documentation to:\n*HTML* My <b>HTML</b> suite doc with <b>HTML</b> continuation with non-HTML &lt;continuation&gt;

Append HTML to HTML suite documentation
    ${tc} =    Check Test Case    ${TESTNAME}
    Check Log Message    ${tc[0, 0]}    Set suite documentation to:\n*HTML* My <b>HTML</b> suite doc with <b>HTML</b> continuation with non-HTML &lt;continuation&gt; with <i>more</i> HTML
