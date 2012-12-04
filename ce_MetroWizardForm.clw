! http://clarionedge.com, http://fushnisoft.com
! Licensed under the MIT license: https://github.com/fushnisoft/ClarionMetroWizard/blob/master/LICENSE.txt 

      Member()
         omit('***$***',_VER_C55)
_ABCDllMode_  EQUATE(0)
_ABCLinkMode_ EQUATE(1)
         ***$***
      Include('Equates.CLW'),ONCE
      Include('Keycodes.CLW'),ONCE
      Include('Errors.CLW'),ONCE
      Map
      End ! map
      Include('ce_MetroWizardForm.inc'),ONCE

ce_MetroWizardForm.Construct  PROCEDURE   
  CODE
  
  SELF.headerHeight = 40
  SELF.footerHeight = 80

  SELF.listTitleFontSize = 16
  SELF.headerFontSize = 14
  SELF.footerFontSize = 9
  
  SELF.lightColor = 0D1B171H
  SELF.darkColor = 04F453Ch
  SELF.fontColor = COLOR:White
  SELF.fontSelectedColor = COLOR:Black
  
  SELF.promptTabHeaderUpper = FALSE
  SELF.promptTabDetailUpper = TRUE
  
  SELF.headerImage = '~resources\header_ce_metro_24x24.ico'
  
  SELF.buttonCloseIcon =  '~resources\cancel_ce_metro_24x24.ico'
  SELF.buttonNextIcon = '~resources\navigation-right_ce_metro_24x24.ico'
  SELF.buttonPreviousIcon = '~resources\navigation-left_ce_metro_24x24.ico'
  SELF.buttonOKIcon = '~resources\thumb_up_ce_metro_24x24.ico'

  SELF.themeColors[1, CMW_COLOR_DARK] = 0252525h
  SELF.themeColors[1, CMW_COLOR_LIGHT] = 000b3f4h
  SELF.themeColors[2, CMW_COLOR_DARK] = 0252525h
  SELF.themeColors[2, CMW_COLOR_LIGHT] = 00ab78h
  SELF.themeColors[3, CMW_COLOR_DARK] = 0252525h
  SELF.themeColors[3, CMW_COLOR_LIGHT] = 0ed7327h
  SELF.themeColors[4, CMW_COLOR_DARK] = 0252525h
  SELF.themeColors[4, CMW_COLOR_LIGHT] = 03e11aeh
  SELF.themeColors[5, CMW_COLOR_DARK] = 0001631h
  SELF.themeColors[5, CMW_COLOR_LIGHT] = 0002f63h
  SELF.themeColors[6, CMW_COLOR_DARK] = 0040055h
  SELF.themeColors[6, CMW_COLOR_LIGHT] = 0011db1h
  SELF.themeColors[7, CMW_COLOR_DARK] = 03a024fh
  SELF.themeColors[7, CMW_COLOR_LIGHT] = 04f00c1h
  SELF.themeColors[8, CMW_COLOR_DARK] = 051022eh
  SELF.themeColors[8, CMW_COLOR_LIGHT] = 0ad0072h
  SELF.themeColors[9, CMW_COLOR_DARK] = 065001dh
  SELF.themeColors[9, CMW_COLOR_LIGHT] = 0b51746h
  SELF.themeColors[10, CMW_COLOR_DARK] = 04f2100h
  SELF.themeColors[10, CMW_COLOR_LIGHT] = 0c06a00h
  SELF.themeColors[11, CMW_COLOR_DARK] = 05e4800h
  SELF.themeColors[11, CMW_COLOR_LIGHT] = 0878300h
  SELF.themeColors[12, CMW_COLOR_DARK] = 0004900h
  SELF.themeColors[12, CMW_COLOR_LIGHT] = 0009918h
  SELF.themeColors[13, CMW_COLOR_DARK] = 02c9917h
  SELF.themeColors[13, CMW_COLOR_LIGHT] = 040c100h
  SELF.themeColors[14, CMW_COLOR_DARK] = 01b6be6h
  SELF.themeColors[14, CMW_COLOR_LIGHT] = 01d99ffh
  SELF.themeColors[15, CMW_COLOR_DARK] = 01e1db9h
  SELF.themeColors[15, CMW_COLOR_LIGHT] = 0132effh
  SELF.themeColors[16, CMW_COLOR_DARK] = 06a1ab3h
  SELF.themeColors[16, CMW_COLOR_LIGHT] = 0771dffh
  SELF.themeColors[17, CMW_COLOR_DARK] = 0b41c68h
  SELF.themeColors[17, CMW_COLOR_LIGHT] = 0ff3faah
  SELF.themeColors[18, CMW_COLOR_DARK] = 0ba5719h
  SELF.themeColors[18, CMW_COLOR_LIGHT] = 0ffae20h
  SELF.themeColors[19, CMW_COLOR_DARK] = 0e59b59h
  SELF.themeColors[19, CMW_COLOR_LIGHT] = 0ffc557h
  SELF.themeColors[20, CMW_COLOR_DARK] = 0a8a800h
  SELF.themeColors[20, CMW_COLOR_LIGHT] = 0cdd800h
  SELF.themeColors[21, CMW_COLOR_DARK] = 01bba82h
  SELF.themeColors[21, CMW_COLOR_LIGHT] = 000d191h
  SELF.themeColors[22, CMW_COLOR_DARK] = 0099dd3h
  SELF.themeColors[22, CMW_COLOR_LIGHT] = 000b7e1h
  SELF.themeColors[23, CMW_COLOR_DARK] = 0bb65e1h
  SELF.themeColors[23, CMW_COLOR_LIGHT] = 0bc76ffh
  SELF.themeColors[24, CMW_COLOR_DARK] = 0686868h
  SELF.themeColors[24, CMW_COLOR_LIGHT] = 0a5a400h
  SELF.themeColors[25, CMW_COLOR_DARK] = 0686868h
  SELF.themeColors[25, CMW_COLOR_LIGHT] = 0237dffh

ce_MetroWizardForm.Init   PROCEDURE (WindowManager pWM, SIGNED pSheetFeq)
savePixels                  BYTE
  CODE
  
  ! Make sure the sheet is set to the width of the window
  pSheetFeq{PROP:Xpos} = 0
  pSheetFeq{PROP:Width} = 0{PROP:Width}
  
  ! Init the parent TabList class
  SELF.Init(pWm, pSheetFeq, TRUE)
  
  savePixels = 0{PROP:Pixels}
  0{PROP:Pixels} = TRUE
  SELF.MoveOriginalControls()
  SELF.CreateControls()
  SELF.SetupWindow()
  SELF.SetupButtons()
  SELF.ApplyColors(SELF.darkColor, SELF.lightColor)

  0{PROP:Pixels} = FALSE

ce_MetroWizardForm.MoveOriginalControls   PROCEDURE()
thisFeq SIGNED
  CODE
  LOOP
    thisFeq = 0{PROP:NextField, thisFeq}
    IF thisFeq = 0
      BREAK
    END
    CASE thisFeq
    OF SELF.backgroundImageFeq
    OROF SELF.boxFeq
    OROF SELF.boxFooterFeq
    OROF SELF.boxHeaderFeq
    OROF SELF.boxListTitleFeq
    OROF SELF.buttonClose
    OROF SELF.buttonNext
    OROF SELF.buttonOK
    OROF SELF.buttonPrevious
    OROF SELF.headerImageFeq
    OROF SELF.lastTabFeq
    OROF SELF.listFeq
      CYCLE
    END
    thisFeq{PROP:Ypos} = thisFeq{PROP:Ypos} + SELF.headerHeight
  END

ce_MetroWizardForm.SetupWindow    PROCEDURE()
posG                                Group(PositionGroup)
                                    END
  CODE
  
  ! Do some messing around to position all the controls...
  ! This first bit is to re-arrange the controls added by the PARENT TabList class
  SELF.boxFeq{PROP:Xpos} = SELF.listFeq{PROP:Width} - 1
  SELF.boxFeq{PROP:Ypos} = SELF.boxHeaderFeq{PROP:Height}
  SELF.boxFeq{PROP:Height} = SELF.boxFooterFeq{PROP:YPos} - SELF.boxFooterFeq{PROP:YPos} - 1
  SELF.boxFeq{PROP:Width} = 0{PROP:Width} - SELF.boxFeq{PROP:Xpos} + 2
  
  SELF.backgroundImageFeq{PROP:Xpos} = SELF.boxFeq{PROP:Xpos}
  SELF.backgroundImageFeq{PROP:Ypos} = SELF.boxFeq{PROP:Ypos}
  SELF.backgroundImageFeq{PROP:Width} = SELF.boxFeq{PROP:Width}

  SELF.boxHeaderFeq{PROP:Width} = 0{PROP:Width}
  
  SELF.boxFooterFeq{PROP:Width} = 0{PROP:Width}
  !SELF.boxFooterFeq{PROP:Height} = 0{PROP:Height} - SELF.boxFooterFeq{PROP:Ypos} + 20
  
  SELF.boxListTitleFeq{PROP:XPos} = 0
  SELF.boxListTitleFeq{PROP:YPos} = SELF.boxHeaderFeq{PROP:Height}
  SELF.boxListTitleFeq{PROP:Width} = SELF.listFeq{PROP:Width}+1
  
  SELF.listFeq{PROP:YPos} = SELF.boxHeaderFeq{PROP:Height} + SELF.boxListTitleFeq{PROP:Height} - 1
  SELF.listFeq{PROP:Height} = SELF.boxFooterFeq{PROP:YPos} - SELF.listFeq{PROP:YPos} 
  SELF.listFeq{PROP:XPos} = SELF.listFeq{PROP:XPos} - 1
  SELF.listFeq{PROP:Width} = SELF.listFeq{PROP:Width} + 1

  SELF.promptListTitleFeq{PROP:XPos} = 8
  SELF.promptListTitleFeq{PROP:YPos} = SELF.boxListTitleFeq{PROP:YPos} + (SELF.boxListTitleFeq{PROP:Height}/3)
  
  SELF.listFeq{PROP:Trn} = FALSE
  
  !SELF.listFeq{PROPSTYLE:FontSize, 1} = SELF.listFeq{PROPSTYLE:FontSize, 1} * 2
  SELF.listFeq{PROPLIST:LeftOffset, 1} = 4
  
    !SELF.listFeq{PROPSTYLE:FontSize, 2} = SELF.listFeq{PROPSTYLE:FontSize, 1} * 2
  SELF.listFeq{PROPLIST:LeftOffset, 2} = 6
  
  SELF.listFeq{PROP:LineHeight} = SELF.listFeq{PROP:LineHeight} + 6
   
  SELF.promptHeaderFeq{PROP:Xpos} = 40
  SELF.promptHeaderFeq{PROP:Ypos} = 6
  
  SELF.promptFooterFeq{PROP:Xpos} = 20
  SELF.promptFooterFeq{PROP:Ypos} = 0{PROP:Height} - 30
  
  SELF.listFeq{PROP:Height} = SELF.listFeq{PROP:Height} - 1
  GetPosition(SELF.listFeq, posG.XPos, posG.YPos, posG.Width, posG.Height)
  SELF.listBorderFeq = Create(0, CREATE:region)
  SetPosition(SELF.listBorderFeq, posG.XPos, posG.YPos-1, posG.Width+1, posG.Height+2)
  SELF.listBorderFeq{PROP:Hide} = FALSE
 
ce_MetroWizardForm.SetupButtons   PROCEDURE()
  CODE
  IF SELF.buttonClose > 0
    SELF.SetButtonStyle(SELF.buttonClose, SELF.buttonCloseIcon)
    SELF.buttonClose{PROP:Xpos} = 0{PROP:Width} - SELF.buttonClose{PROP:Width} - 20
  END
  IF SELF.buttonNext > 0
    SELF.SetButtonStyle(SELF.buttonNext, SELF.buttonNextIcon)
    SELF.buttonNext{PROP:Xpos} = 0{PROP:Width} - (SELF.buttonNext{PROP:Width}*2) - 30
  END
  IF SELF.buttonOK > 0
    SELF.SetButtonStyle(SELF.buttonOK, SELF.buttonOKIcon)
    SELF.buttonOK{PROP:Xpos} = SELF.buttonNext{PROP:XPos}
    SELF.buttonOK{PROP:Hide} = TRUE
  END  
  IF SELF.buttonPrevious > 0
    SELF.SetButtonStyle(SELF.buttonPrevious, SELF.buttonPreviousIcon)
    SELF.buttonPrevious{PROP:Xpos} = 0{PROP:Width} - (SELF.buttonPrevious{PROP:Width}*3) - 40
  END

  
ce_MetroWizardForm.SetButtonStyle PROCEDURE(SIGNED pFeq, STRING pIcon) !,VIRTUAL
  CODE

   pFeq{PROP:Width} = 56
   pFeq{PROP:Height} = 56
   pFeq{PROP:Xpos} = 0{PROP:Width} - pFeq{PROP:Width} - 20
   pFeq{PROP:Ypos} = 0{PROP:Height} - pFeq{PROP:Height} - 10    
   pFeq{PROP:Flat} = TRUE
   pFeq{PROP:Trn} = TRUE
   IF pFeq{PROP:Icon} = '' 
     pFeq{PROP:Icon} = pIcon
   END
  
  

ce_MetroWizardForm.CreateControls PROCEDURE()!,VIRTUAL
  CODE

  ! Create a bunch of controls used by the window
  ! ==========================================
  SELF.boxHeaderFeq = Create(0, CREATE:box)
  SetPosition(SELF.boxHeaderFeq, 0, 0, 0{PROP:Width}, SELF.headerHeight)
  SELF.boxHeaderFeq{PROP:Hide} = FALSE

  SELF.boxFooterFeq = Create(0, CREATE:box)
  SETPOSITION(SELF.boxFooterFeq, 0, 0{PROP:Height} - SELF.footerHeight, 0{PROP:Width}, SELF.footerHeight) 
  SELF.boxFooterFeq{PROP:Hide} = FALSE
  
  SELF.boxListTitleFeq = CREATE(0, CREATE:box)
  ! SETPOSITION <-- happens later
  SELF.boxListTitleFeq{PROP:Hide} = FALSE

  SELF.promptListTitleFeq = CREATE(0, CREATE:prompt)
  SELF.promptListTitleFeq{PROP:FontSize} = SELF.listTitleFontSize
  SELF.promptListTitleFeq{PROP:Text} = 'List Title'
  SELF.promptListTitleFeq{PROP:Hide} = FALSE

  SELF.promptHeaderFeq = CREATE(0, CREATE:prompt)
  SELF.promptHeaderFeq{PROP:FontSize} = SELF.headerFontSize
  SELF.promptHeaderFeq{PROP:Text} = 'Header'
  SELF.promptHeaderFeq{PROP:Hide} = FALSE

  SELF.promptFooterFeq = CREATE(0, CREATE:prompt)
  SELF.promptFooterFeq{PROP:FontSize} = SELF.footerFontSize
  SELF.promptFooterFeq{PROP:Text} = 'Footer'
  SELF.promptFooterFeq{PROP:Hide} = FALSE

  SELF.headerImageFeq = Create(0, CREATE:image)
  SETPOSITION(SELF.headerImageFeq, 6, 8, 24, 24)
  SELF.headerImageFeq{PROP:Text} = SELF.headerImage
  SELF.headerImageFeq{PROP:Hide} = FALSE
  ! ==========================================

ce_MetroWizardForm.SetTheme   PROCEDURE(BYTE pThemeNumber)!,VIRTUAL
  CODE
  IF pThemeNumber > 0 AND pThemeNumber < 26
    SELF.ApplyColors(SELF.themeColors[pThemeNumber, CMW_COLOR_DARK], SELF.themeColors[pThemeNumber, CMW_COLOR_LIGHT])
  END
  
ce_MetroWizardForm.ApplyColors                   PROCEDURE(LONG pDarkColor, LONG pLightColor)!,VIRTUAL
buttonFeq                           SIGNED
i                                   LONG
  CODE
  
  SELF.lightColor = pLightColor
  SELF.darkColor = pDarkColor
  
  SELF.boxFeq{PROP:Color} = COLOR:WINDOW

  SELF.listFeq{PROP:Background} = SELF.lightColor
  SELF.listFeq{PROP:Color} = SELF.lightColor

  SELF.listFeq{PROPLIST:TextSelected, 1} = SELF.fontSelectedColor
  SELF.listFeq{PROPLIST:BackSelected, 1} = SELF.fontColor
  SELF.listFeq{PROPLIST:TextColor, 1} = SELF.fontColor
  SELF.listFeq{PROPLIST:BackColor, 1} = SELF.listFeq{PROP:Background}

  SELF.listFeq{PROPLIST:TextSelected, 2} = SELF.fontSelectedColor
  SELF.listFeq{PROPLIST:BackSelected, 2} = SELF.fontColor
  SELF.listFeq{PROPLIST:TextColor, 2} = SELF.fontColor
  SELF.listFeq{PROPLIST:BackColor, 2} = SELF.listFeq{PROP:Background}

  SELF.listFeq{PROPLIST:Grid, 1} = SELF.listFeq{PROP:Background}
  SELF.listFeq{PROPLIST:Grid, 2} = SELF.listFeq{PROP:Background}

  SELF.listBorderFeq{PROP:Color} = SELF.listFeq{PROP:Background}

  LOOP
    i += 1
    EXECUTE i
      buttonFeq = SELF.buttonClose
      buttonFeq = SELF.buttonNext
      buttonFeq = SELF.buttonOK
      buttonFeq = SELF.buttonPrevious
    ELSE
      BREAK
    END
    IF buttonFeq = 0
      CYCLE
    END
    
    buttonFeq{PROP:FontColor} = SELF.fontColor
    buttonFeq{PROP:FontStyle} = FONT:bold
    buttonFeq{PROP:Background} = SELF.darkColor
  END
  
  SELF.boxHeaderFeq{PROP:Color} = SELF.darkColor
  SELF.boxHeaderFeq{PROP:Fill} = SELF.darkColor

  SELF.boxFooterFeq{PROP:Color} = SELF.darkColor
  SELF.boxFooterFeq{PROP:Fill} = SELF.darkColor  

  SELF.boxListTitleFeq{PROP:Color} = SELF.lightColor
  SELF.boxListTitleFeq{PROP:Fill} = SELF.lightColor

  SELF.promptListTitleFeq{PROP:FontColor} = SELF.fontColor
  SELF.promptListTitleFeq{PROP:Color} = SELF.lightColor

  SELF.promptHeaderFeq{PROP:FontColor} = SELF.fontColor
  SELF.promptHeaderFeq{PROP:Color} = SELF.darkColor

  SELF.promptFooterFeq{PROP:FontColor} = SELF.fontColor
  SELF.promptFooterFeq{PROP:Color} = SELF.darkColor

ce_MetroWizardForm.TakeAccepted  PROCEDURE() !,VIRTUAL
  CODE

  CASE Event()
  OF EVENT:Accepted
    CASE ACCEPTED()
    OF SELF.buttonNext
      Select(SELF.listFeq, Choice(SELF.listFeq)+1)
      Post(EVENT:NewSelection, SELF.listFeq)
    OF SELF.buttonPrevious
      Select(SELF.listFeq, Choice(SELF.listFeq)-1)
      Post(EVENT:NewSelection, SELF.listFeq)
    END
  END

  RETURN 

ce_MetroWizardForm.TakeNewSelection   PROCEDURE() !,VIRTUAL
selectedTabFeq                          SIGNED
  CODE
  
  CASE Field()
  OF SELF.sheetFeq 
    selectedTabFeq = SELF.sheetFeq{PROP:ChoiceFEQ}
    IF SELF.promptTabHeader > 0      
      SELF.promptTabHeader{PROP:Text} = Choose(SELF.promptTabHeaderUpper=TRUE, Upper(selectedTabFeq{PROP:Text}), selectedTabFeq{PROP:Text})
    END
    IF SELF.promptTabDetail > 0
      SELF.promptTabDetail{PROP:Text} = Choose(SELF.promptTabDetailUpper=TRUE, Upper(selectedTabFeq{PROP:Tip}), selectedTabFeq{PROP:Tip})
    END    
      
    IF selectedTabFeq{PROP:ChildIndex} = SELF.sheetFeq{PROP:NumTabs}
      SELF.buttonOK{PROP:Hide} = FALSE
      SELF.buttonNext{PROP:Hide} = TRUE
    ELSE
      SELF.buttonOK{PROP:Hide} = TRUE
      SELF.buttonNext{PROP:Hide} = FALSE
    END
    
    IF selectedTabFeq{PROP:ChildIndex} = 1
      SELF.buttonPrevious{PROP:Hide} = TRUE
    ELSE
      SELF.buttonPrevious{PROP:Hide} = FALSE
    END      
  END  
  
ce_MetroWizardForm.SetHeaderIcon  PROCEDURE(STRING pText)
  CODE
  SELF.headerImageFeq{PROP:Text} = pText
  
ce_MetroWizardForm.SetHeaderText  PROCEDURE(STRING pText)
  CODE
  SELF.promptHeaderFeq{PROP:Text} = pText
  
ce_MetroWizardForm.SetListHeaderText  PROCEDURE(STRING pText)
  CODE
  SELF.promptListTitleFeq{PROP:Text} = pText
  
ce_MetroWizardForm.SetFooterText  PROCEDURE(STRING pText)
  CODE
  SELF.promptFooterFeq{PROP:Text} = pText
