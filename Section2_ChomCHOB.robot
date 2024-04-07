*** Settings ***
Library      SeleniumLibrary
Library      Collections

#กำหนดตัวแปร และ Locator
*** Variables ***
${website}                     https://www.nejavu.com
${locator_popup_close}         css=#top > main > div.modal-overlay.active > div.modal.p-0.active > a
${locator_menu_cartoon}        css=#top > main > div.main-wrapper.is-chrome > div.nav-wrapper.site-nav > div.nav-container > div.dn.db-lg.rel.z-2 > nav > div > ul > li:nth-child(3) > a
${locator_book01}              css=#top > main > div.main-wrapper.is-chrome > div.content-wrapper > div.bg-4th.p-4.page-categories > div.bg-white.book-list > div.space.overflow-hide > div:nth-child(1) > div > div.nev-card-detail.mt-2.discounted > a:nth-child(1) > h5
${locator_book02}              css=#top > main > div.main-wrapper.is-chrome > div.content-wrapper > div.bg-4th.p-4.page-categories > div.bg-white.book-list > div.space.overflow-hide > div:nth-child(2) > div > div.nev-card-detail.mt-2.discounted > a:nth-child(1) > h5
${locator_book03}              css=#top > main > div.main-wrapper.is-chrome > div.content-wrapper > div.bg-4th.p-4.page-categories > div.bg-white.book-list > div.space.overflow-hide > div:nth-child(3) > div > div.nev-card-detail.mt-2.discounted > a:nth-child(1) > h5
${locator_book04}              css=#top > main > div.main-wrapper.is-chrome > div.content-wrapper > div.bg-4th.p-4.page-categories > div.bg-white.book-list > div.space.overflow-hide > div:nth-child(4) > div > div.nev-card-detail.mt-2.discounted > a:nth-child(1) > h5
${locator_book05}              css=#top > main > div.main-wrapper.is-chrome > div.content-wrapper > div.bg-4th.p-4.page-categories > div.bg-white.book-list > div.space.overflow-hide > div:nth-child(5) > div > div.nev-card-detail.mt-2.discounted > a:nth-child(1) > h5
${locator_cart01}              css=#top > main > div.main-wrapper.is-chrome > div.content-wrapper > div.bg-4th.p-4.page-categories > div.bg-white.book-list > div.space.overflow-hide > div:nth-child(1) > div > div.nev-pd-button-group.mx-n1 > div:nth-child(2)
${locator_cart02}              css=#top > main > div.main-wrapper.is-chrome > div.content-wrapper > div.bg-4th.p-4.page-categories > div.bg-white.book-list > div.space.overflow-hide > div:nth-child(2) > div > div.nev-pd-button-group.mx-n1 > div:nth-child(2)
${locator_cart03}              css=#top > main > div.main-wrapper.is-chrome > div.content-wrapper > div.bg-4th.p-4.page-categories > div.bg-white.book-list > div.space.overflow-hide > div:nth-child(3) > div > div.nev-pd-button-group.mx-n1 > div:nth-child(2)
${locator_cart04}              css=#top > main > div.main-wrapper.is-chrome > div.content-wrapper > div.bg-4th.p-4.page-categories > div.bg-white.book-list > div.space.overflow-hide > div:nth-child(4) > div > div.nev-pd-button-group.mx-n1 > div:nth-child(2)
${locator_cart05}              css=#top > main > div.main-wrapper.is-chrome > div.content-wrapper > div.bg-4th.p-4.page-categories > div.bg-white.book-list > div.space.overflow-hide > div:nth-child(5) > div > div.nev-pd-button-group.mx-n1 > div:nth-child(2)
${locator_deletebook}          xpath=//*[@id="cart"]/div[2]/div[2]/div[5]/a/img
${locator_confirm_deletebook}  css=#top > div > div > div.swal2-actions > button.swal2-confirm.swal2-styled
${locator_cart}                css=#top > main > div.main-wrapper.is-chrome > div.header-wrapper.site-header > div > div > div.header-bottom > div > div.dim-4.dim-3-lg.df.aic.jce.od-3.p-1.p-0-lg > ul > li:nth-child(2) > div > a > img
${locator_total_cart}          id=badge-cart

${locator_cookies_accept}      css=#top > main > div.cookie-policy.show > div > small > small > div > div:nth-child(1) > button
${locator_listname_cart01}     css=#cart > div.shpct-container > div:nth-child(2) > div.cart-column.column-1 > div > div.cart-item-detail > p:nth-child(2) > strong
${locator_listname_cart02}     css=#cart > div.shpct-container > div:nth-child(3) > div.cart-column.column-1 > div > div.cart-item-detail > p:nth-child(2) > strong
${locator_listname_cart03}     css=#cart > div.shpct-container > div:nth-child(4) > div.cart-column.column-1 > div > div.cart-item-detail > p:nth-child(2) > strong
${locator_listname_cart04}     css=#cart > div.shpct-container > div:nth-child(5) > div.cart-column.column-1 > div > div.cart-item-detail > p:nth-child(1) > strong
${locator_listname_cart05}     css=#cart > div.shpct-container > div:nth-child(6) > div.cart-column.column-1 > div > div.cart-item-detail > p:nth-child(1) > strong
${No_Goods_visible}            css=#top > main > div.main-wrapper.no-sidebar-nav.is-chrome > div.content-wrapper > div.bg-4th.p-4.p-8-md > div > div > h2 > strong
*** Keywords ***
#เข้า URL : Nejanu.com และขยายหน้าจอ
Open Web Browser
    Set Selenium Speed              0.5
    Open Browser                    ${website}        chrome        options=add_experimental_option("detach", True)
    Maximize Browser Window
#รอ Pop up เด้ง และสั่งให้ปิด
Open and Close Popup
    Wait Until Element Is Visible        ${locator_popup_close}  
    Click Element                        ${locator_popup_close}    
    
#Click ไปที่เมนูการ์ตูน พร้อมปิดการแจ้งเตือนคุกกี้
Click Cartoon Menu
    Click Element                        ${locator_menu_cartoon} 
    Click Element                        ${locator_cookies_accept}
#เก็บรายชื่อหนังสือทุกเล่มในแถวที่ 1 และเซ็ตเป็น Global เพื่อใช้ตัวแปรนอกฟังก์ชัน
Get Book Name
    Wait Until Element Is Visible              ${locator_book01}    
    ${book_title01}            Get Text        ${locator_book01} 
    Set Global Variable                        ${book_title01}  
    ${book_title02}            Get Text        ${locator_book02} 
    Set Global Variable                        ${book_title02}  
    ${book_title03}            Get Text        ${locator_book03} 
    Set Global Variable                        ${book_title03}  
    ${book_title04}            Get Text        ${locator_book04} 
    Set Global Variable                        ${book_title04}  
    ${book_title05}            Get Text        ${locator_book05} 
    Set Global Variable                        ${book_title05}  


#เพิ่มหนังสือเข้ารถเข็นทุกเล่มในแถวที่ 1
Add Cart
    Click Element                       ${locator_cart01} 
    Set Selenium Speed                  1
    Click Element                       ${locator_cart02} 
    Set Selenium Speed                  1
    Click Element                       ${locator_cart03} 
    Set Selenium Speed                  1
    Click Element                       ${locator_cart04} 
    Set Selenium Speed                  1
    Click Element                       ${locator_cart05} 

#Verify รายชื่อหนังสือในตระกร้า จากชื่อที่ได้รับข้อที่แล้ว
Verify Book Name In Cart
    Set Selenium Speed                        2      
    Click Element                             ${locator_cart}

    @{list}        Create List       ${book_title01}    ${book_title02}    ${book_title03}    ${book_title04}    ${book_title05}
    Wait Until Page Contains    ${list}[0]
    Wait Until Page Contains    ${list}[1]
    Wait Until Page Contains    ${list}[2]
    Wait Until Page Contains    ${list}[3]     
    Should Be Equal    ${list}[4]       ${book_title05}     

         
    
    
  
#ทำการลบหนังสือออกจากตระกร้า  
Delete Book Cart
    Wait Until Element Is Visible       ${locator_deletebook} 
    
    FOR        ${i}    IN RANGE   5
        Log    ${i}
        Click Element                       ${locator_deletebook}    
        Click Element                       ${locator_confirm_deletebook}  
        Set Selenium Speed                  1.5
    END


#ตรวจสอบตะกร้าหนังสือเท่ากันกับ 0 เล่ม

Verify Cart Badge Zero
    Wait Until Element Is Visible   ${locator_cart}  
    ${txt}            Get Text      ${locator_total_cart} 
    Should Be Equal                 ${txt}            0
    Page Should Contain Element     ${No_Goods_visible}         ยังไม่มีรายการสินค้าในตะกร้า โปรดสั่งซื้อสินค้า    
 
    
*** Test Cases ***

TC01 Verify Booktitle and Verify Cart Badge Zero 
    Open Web Browser
    Open and Close Popup
    Click Cartoon Menu
    Get Book Name
    Add Cart
    Verify Book Name In Cart
    Delete Book Cart
    Verify Cart Badge Zero



