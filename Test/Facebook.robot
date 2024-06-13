** Settings ***
Library         OperatingSystem
Library         SeleniumLibrary                 implicit_wait=2
Resource        ../Functions/Functions.robot
Test Teardown    Close All Browsers

*** Test Cases ***
NegativeAndPositifCase
    OpenWebBrowser
    #negative case 1 (empty username)
    Element Should Be Visible                     //input[@placeholder="Email address or phone number"] 
    Element Should Be Visible                     //input[@placeholder="Password"] 
    Element Should Be Visible                     //button[@name="login"]
    Wait Until Element Is Visible                 //input[@placeholder="Password"]                                    timeout=30s
    Click Element                                 //input[@placeholder="Password"]
    Input Text                                    //input[@placeholder="Password"]                                    ${Pwd1}                 
    Sleep                                         2s
    Click Element                                 //button[@name="login"]
    Sleep                                         3s
    Element Should Be Visible                     (//div[contains(.,"The email address or mobile number you entered isn't connected to an account.")])[9]
    Sleep                                         2s  
    #negative case 2 (invalid username and empty pwd)
    Wait Until Element Is Visible                 //input[@placeholder="Email address or phone number"]               timeout=30s
    Click Element                                 //input[@placeholder="Email address or phone number"] 
    Input Text                                    //input[@placeholder="Email address or phone number"]                ${UName1}                
    Click Element                                 //button[@name="login"]
    Sleep                                         3s
    Element Should Be Visible                     (//div[contains(.,"The email address you entered isn't connected to an account.")])[9]
    Sleep                                         2s
    #negative case 3 (invalid username and invalid pwd)
    Wait Until Element Is Visible                 //input[@placeholder="Email address or phone number"]                timeout=30s
    Click Element                                 //input[@placeholder="Email address or phone number"] 
    Input Text                                    //input[@placeholder="Email address or phone number"]                ${UName1}                 
    Wait Until Element Is Visible                 //input[@placeholder="Password"]                                     timeout=30s
    Click Element                                 //input[@placeholder="Password"]
    Input Text                                    //input[@placeholder="Password"]                                     ${Pwd1}                 
    Click Element                                 //button[@name="login"]
    Sleep                                         5s
    Element Should Be Visible                     (//div[contains(.,"The email address you entered isn't connected to an account.")])[9]
    Sleep                                         2s
    #negative case 4 (valid username and wrong pwd)
    Wait Until Element Is Visible                 //input[@placeholder="Email address or phone number"]                timeout=30s
    Click Element                                 //input[@placeholder="Email address or phone number"] 
    Input Text                                    //input[@placeholder="Email address or phone number"]                ${UName}                 
    Wait Until Element Is Visible                 //input[@placeholder="Password"]                                     timeout=30s
    Click Element                                 //input[@placeholder="Password"]
    Input Text                                    //input[@placeholder="Password"]                                     ${Pwd1}                 
    Sleep                                         2s
    Click Element                                 //button[@name="login"]
    Sleep                                         3s
    Element Should Be Visible                     (//div[contains(.,"The password that you've entered is incorrect.")])[9]
    Sleep                                         2s 
    #Login Succes                
    Wait Until Element Is Visible                 //input[@placeholder="Password"]                                      timeout=30s
    Click Element                                 //input[@placeholder="Password"]
    Input Text                                    //input[@placeholder="Password"]                                      ${Pwd}                 
    Sleep                                         2s
    Click Element                                 //button[@name="login"]
    Sleep                                         2s
    Element Should Be Visible                     //span[contains(.,"Welcome to Facebook, Kara")]
    Element Should Not Be Visible                 (//div[contains(.,"The email address you entered isn't connected to an account.")])[9]
    Element Should Not Be Visible                 (//div[contains(.,"The password that you've entered is incorrect.")])[9]
    Element Should Not Be Visible                 (//div[contains(.,"The email address or mobile number you entered isn't connected to an account.")])[9]
    Element Should Not Be Visible                 //button[@name="login"]
    #Sleep                                         3s
    #Create Post
    Click Element                                 //a[@aria-label="Home"]
    Wait Until Element Is Visible                 //div[@aria-label="Create a post"]                                     timeout=60s
    Click Element                                 //span[contains(.,"What's on your mind, Kara?")]
    Sleep                                         7s
    Wait Until Element Is Visible                 //span[contains(.,"What's on your mind, Kara?")]                       timeout=60s
    Click Element                                 //div[@aria-label="What's on your mind, Kara?"]
    Input Text                                    //div[@aria-label="What's on your mind, Kara?"]                        Hi
    Click Element                                 //div[@aria-label="Post"]
    Sleep                                         5s
    #Edit Post
    Wait Until Element Is Visible                 (//span[contains(.,"Kara Amel")])[5]                                   timeout=30s
    Click Element                                 (//div[@aria-label="Actions for this post"])[1]
    Sleep                                         2s
    Wait Until Element Is Visible                 //span[contains(.,"Edit post")]                                        timeout=30s
    Click Element                                 //span[contains(.,"Edit post")]
    Wait Until Element Is Visible                 (//span[contains(.,"Edit post")])[1]                                    timeout=30s
    Click Element                                 //div[@aria-label="What's on your mind, Kara?"]
    Input Text                                    //div[@aria-label="What's on your mind, Kara?"]                        Edit Post
    Sleep                                         2s
    Click Element                                 //div[@aria-label="Save"]
    Sleep                                         3s
    #Delete Post
    Wait Until Element Is Visible                 (//span[contains(.,"Kara Amel")])[5]                                    timeout=30s
    Click Element                                 (//div[@aria-label="Actions for this post"])[1]
    Wait Until Element Is Visible                 //span[contains(.,"Edit post")]                                          timeout=30s
    Click Element                                 //span[contains(.,"Move to bin")]
    Sleep                                         2s
    Wait Until Element Is Visible                 (//span[contains(.,"Move to your bin")])[1]                              timeout=30s
    Click Element                                 (//span[contains(.,"Move")])[4]
    Sleep                                         2s
    #Create Story
    Click Element                                 //a[@aria-label="Home"]
    Wait Until Element Is Visible                 //span[contains(.,"Create Story")]                                      timeout=30s
    Click Element                                 //span[contains(.,"Create Story")]
    Wait Until Element Is Visible                 //h1[contains(.,"Your story")]                                          timeout=30s
    Sleep                                         3s
    Click Element                                 (//div[contains(.,"Create a Text Story")])[19]
    Sleep                                         3s
    Wait Until Element Is Visible                 //span[contains(.,"Start typing")]                                       timeout=30s
    Click Element                                 //textarea[@dir="ltr"]  
    Input Text                                    //textarea[@dir="ltr"]                                                    Hello
    Sleep                                         2s
    Wait Until Element Is Visible                 //div[@aria-label="Font style"]                                           timeout=30s
    Click Element                                 //div[@aria-label="Font style"]
    Wait Until Element Is Visible                 (//div[contains(.,"clean")])[19]                                           timeout=30s
    Click Element                                 (//div[contains(.,"clean")])[19]
    Sleep                                         3s
    Click Element                                 //div[@aria-label="Solid red, background"]
    Sleep                                         3s
    Click Element                                 (//span[contains(.,"Share to Story")])[2]
    Sleep                                         5s
    #Delete Story
    Wait Until Element Is Visible                 //a[@aria-label="View Your Story"]                                         timeout=30s
    Click Element                                 //a[@aria-label="View Your Story"]
    Sleep                                         3s
    Wait Until Element Is Visible                 (//div[@aria-label="Menu"])[2]                                             timeout=30s
    Click Element                                 (//div[@aria-label="Menu"])[2]  
    Sleep                                         2s                              
    Wait Until Element Is Visible                 (//div[@class="xu06os2 x1ok221b"])[24]                                     timeout=30s
    Click Element                                 (//div[@class="xu06os2 x1ok221b"])[24]
    Sleep                                         2s
    Wait Until Element Is Visible                 (//span[contains(.,"Delete photo")])[1]                                    timeout=30s
    Click Element                                 //div[@aria-label="Delete"]
    Sleep                                         8s
    #Create Message
    Wait Until Element Is Visible                 //div[@aria-label="New Message"]                                           timeout=30s
    Click Element                                 //div[@aria-label="New Message"]
    Wait Until Element Is Visible                 //div[@class="x1sln4lm"]                                                   timeout=30s
    Click Element                                 (//input[@aria-autocomplete="list"])[2]
    Input Text                                    (//input[@aria-autocomplete="list"])[2]                                     Nonni Yuvikha
    Sleep                                         3s
    Wait Until Element Is Visible                 (//span[contains(.,"Novi Novi")])[3]                                       timeout=30s
    Click Element                                 (//span[contains(.,"Novi Novi")])[3]
    Wait Until Element Is Visible                 //div[@class="xod5an3"]                                                    timeout=30s
    Click Element                                 //div[@aria-label="Message"]
    Input Text                                    //div[@aria-label="Message"]                                               Hi Novii
    Sleep                                         2s
    Wait Until Element Is Visible                 //div[@aria-label="Press Enter to send"]                                   timeout=30s
    Click Element                                 //div[@aria-label="Press Enter to send"]
    Wait Until Element Is Visible                 (//span[contains(.,"Novi Novi")])[4]                                       timeout=30s
    #Cancel Edit Message
    Click Element                                 //div[@class="x78zum5 xh8yej3"]                        
    Wait Until Element Is Visible                 //div[@aria-label="More"]                                                   timeout=30s
    Click Element                                 //div[@aria-label="More"]
    Wait Until Element Is Visible                 //div[@aria-label="Edit"]                                                   timeout=30s
    Click Element                                 //div[@aria-label="Edit"]
    Wait Until Element Is Visible                 //div[@aria-label="Cancel edit"]                                           timeout=30s
    Click Element                                 //div[@aria-label="Cancel edit"]
    Sleep                                         2s
    #Edit Message
    Wait Until Element Is Visible                 //div[@aria-label="More"]                                                  timeout=30s
    Click Element                                 //div[@aria-label="More"]
    Wait Until Element Is Visible                 //div[@aria-label="Edit"]                                                  timeout=30s
    Click Element                                 //div[@aria-label="Edit"]
    Wait Until Element Is Visible                 //div[@aria-label="Cancel edit"]                                            timeout=30s
    Click Element                                 //div[@role="textbox"]
    Input Text                                    //div[@role="textbox"]                                                       Edit Message
    Sleep                                         2s
    Click Element                                 //div[@aria-label="Edit"]
    Sleep                                         3s
    #Remove chat
    Click Element                                 //div[@class="x78zum5 xh8yej3"]                        
    Wait Until Element Is Visible                 //div[@aria-label="More"]                                                  timeout=30s
    Click Element                                 //div[@aria-label="More"]
    Wait Until Element Is Visible                 //div[@aria-label="Remove Message"]                                         timeout=30s
    Click Element                                 //div[@aria-label="Remove Message"] 
    Sleep                                         3s
    Wait Until Element Is Visible                 //div[@aria-label="Who do you want to remove this message for?"]            timeout=30s
    Click Element                                 (//div[@aria-label="Remove"])[2]
    Sleep                                         3s
    Wait Until Element Is Visible                 (//span[contains(.,"Novi Novi")])[4]                                        timeout=30s
    Click Element                                 (//span[contains(.,"Novi Novi")])[4] 
    Wait Until Element Is Visible                 //span[contains(.,"Delete Chat")]                                          timeout=30s
    Click Element                                 //span[contains(.,"Delete Chat")]
    Wait Until Element Is Visible                 (//span[contains(.,"Delete Chat")])[1]                                     timeout=30s
    Click Element                                 (//span[contains(.,"Delete Chat")])[1] 
    Wait Until Element Is Visible                 (//span[contains(.,"Delete Chat")])[6]                                     timeout=30s
    Click Element                                 (//span[contains(.,"Delete Chat")])[6]
    Logoff
