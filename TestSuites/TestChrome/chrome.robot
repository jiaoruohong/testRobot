*** Settings ***
Library  SeleniumLibrary
Library  ../../ExternalKeywords/UserKeywords.py

*** Variables ***
${oracle}       https://profile.oracle.com/myprofile/account/create-account.jspx
${frstNameCN}   焦
${lastNameCN}   若鸿
${frstNameEN}   Ruohong
${lastNameEN}   Jiao

*** Test Cases ***
Test1
    Open Browser        ${oracle}   chrome
    Input Account And Password
    Input Name          ${frstNameCN}   ${lastNameCN}   ${frstNameEN}   ${lastNameEN}
    ${res}              Contatenate Two Values  Nanjing    Jiangning
    Log                 ${res}
    Input Addr          ${res}
    Close Browser

*** Keywords ***
Input Account And Password
    Input Text          id=email::content           email@163.com
    Input Password      id=password::content        password
    Input Password      id=retypePassword::content  password

Input Name
    [Arguments]         ${lastcn}  ${frstcn}   ${lasten}   ${frsten}
    Input Text          id=localLastName::content       ${lastcn}
    Input Text          id=localFirstName::content      ${frstcn}
    Input Text          id=lastName::content            ${lasten}
    Input Text          id=firstName::content           ${frsten}

Input Addr
    [Arguments]         ${addr}
    Input Text          id=address1::content            ${addr}

Contatenate Two Values
    [Arguments]         ${val1}    ${val2}
    ${ans}=             concatenate_values      ${val1}   ${val2}
    [Return]            ${ans}



