*** Settings ***
Documentation	微型專案
Library	Selenium2Library
#Resource
#Test Setup	開啟瀏覽器
#Test Teardown	關閉瀏覽器

*** Variables ***
${web_url} =	https://www.landtop.com.tw/	
${cart_url}=	https://www.landtop.com.tw/carts	
${email}=	#             # 以${包裹變數名稱} = 賦予初始值
${password}=	#

*** Test Cases ***
測試用步驟

	開啟瀏覽器	${web_url}
	檢查網頁
    登入
	加入購物車
	登出
	關閉瀏覽器

*** Keywords ***
Check Exist	
	[Arguments]	${xp}
	Sleep	1
	${count}=	get element count	${xp}
	${res}=	set variable if	${count} > 0	${True}	${False}
	RUN Keyword if	${res}!=${True}	Log "Not Found ${xp}"
	[Return]	${res}
	
Wait And Click
	[Arguments]	${xp}
	Wait Until Element Is Visible	${xp}  5
	Click Element	${xp}
	
開啟瀏覽器
	[Arguments]	${url}
	open browser	${url}	chrome	option=add_argument("--ignore-certificate-errors")

關閉瀏覽器
	close all browsers
	
檢查網頁	# web = landtop
	Check Exist	//div[contains(@class,"simple-logo")]
	
登入
	Click Element	//a[contains(text(),'登入')]  # //a[text()='註冊/登入']
	Wait Until Element Is Visible	//input[contains(@id,"signin-email")]  5
	Press Keys	//input[contains(@id,"signin-email")]	${email}
	Press Keys	//input[contains(@id,"password")]	${password}
	Click Element	//button[contains(text(),'登入')]
	Sleep	2
	
登出
	Click Element	//a[contains(text(),'登出')]
	
加入購物車
	Wait And Click	//span[contains(text(),'手機平板')]/../img
	Wait And Click	//span[contains(text(),'ASUS')]
	Wait And Click	//h2[contains(text(),'Zenfone 9 16G/256G')]
	Wait And Click	//input[contains(@value,"加入購物車")]
    Go To	${cart_url}


#Note (IF)	(${var} == 1 or ${var} == 2)
#${argument}=	Parameter
#${argument}=	Func Of (Set Variable) 	Parameter


