object frmHomePage: TfrmHomePage
  Left = 443
  Top = 290
  BorderStyle = bsDialog
  Caption = 'Home Page'
  ClientHeight = 567
  ClientWidth = 1024
  Color = 3221282
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblFullName: TLabel
    Left = 16
    Top = 112
    Width = 93
    Height = 38
    Caption = 'Name'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -32
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lblStaffID: TLabel
    Left = 16
    Top = 240
    Width = 125
    Height = 38
    Caption = 'Staff ID'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -32
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lblEmail: TLabel
    Left = 16
    Top = 176
    Width = 88
    Height = 38
    Caption = 'Email'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -32
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lblHomePage: TLabel
    Left = 16
    Top = 16
    Width = 213
    Height = 78
    Caption = 'HOME'
    Color = clBlack
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -64
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object btnStudents: TButton
    Left = 16
    Top = 328
    Width = 265
    Height = 49
    Caption = 'STUDENTS'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = btnStudentsClick
  end
  object btnReports: TButton
    Left = 16
    Top = 400
    Width = 265
    Height = 49
    Caption = 'REPORTS'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnReportsClick
  end
  object btnGrades: TButton
    Left = 16
    Top = 472
    Width = 265
    Height = 49
    Caption = 'GRADES'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btnGradesClick
  end
  object btnGenerateReport: TButton
    Left = 304
    Top = 400
    Width = 265
    Height = 49
    Caption = 'GENERATE REPORT'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = btnGenerateReportClick
  end
  object btnPerformance: TButton
    Left = 304
    Top = 328
    Width = 265
    Height = 49
    Caption = 'STUDENT STATS'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = btnPerformanceClick
  end
  object btnQuit: TButton
    Left = 749
    Top = 80
    Width = 265
    Height = 49
    Caption = 'QUIT'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = btnQuitClick
  end
  object btnSignOut: TButton
    Left = 749
    Top = 16
    Width = 265
    Height = 49
    Caption = 'SIGN OUT'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = btnSignOutClick
  end
  object btnEditDetails: TButton
    Left = 304
    Top = 472
    Width = 265
    Height = 49
    Caption = 'EDIT DETAILS'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = btnEditDetailsClick
  end
  object qryHomePage: TADOQuery
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Program Files (x' +
      '86)\Borland\Delphi7\Projects\CourseWorkProject\schoolDatabase.md' +
      'b;Persist Security Info=False'
    Parameters = <>
    Left = 976
    Top = 160
  end
end
