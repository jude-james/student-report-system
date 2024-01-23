object frmReports: TfrmReports
  Left = 297
  Top = 292
  BorderStyle = bsDialog
  Caption = 'Reports'
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
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblMainText: TLabel
    Left = 8
    Top = 8
    Width = 559
    Height = 78
    Caption = 'YOUR REPORTS'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -64
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblText1: TLabel
    Left = 8
    Top = 96
    Width = 316
    Height = 25
    Caption = '(Edit Permissions Enabled)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblText2: TLabel
    Left = 8
    Top = 496
    Width = 133
    Height = 32
    Caption = 'SEARCH:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -27
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnGoBack: TButton
    Left = 749
    Top = 16
    Width = 265
    Height = 49
    Cancel = True
    Caption = 'GO BACK'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = btnGoBackClick
  end
  object dtpDateModified: TDateTimePicker
    Left = 160
    Top = 496
    Width = 265
    Height = 33
    CalColors.BackColor = clWhite
    CalColors.TitleBackColor = 4732444
    Date = 44942.421701157410000000
    Time = 44942.421701157410000000
    Color = clScrollBar
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnChange = dtpDateModifiedChange
  end
  object dbgrdReports: TDBGrid
    Left = 8
    Top = 136
    Width = 545
    Height = 329
    Align = alCustom
    Color = 15724527
    Ctl3D = True
    DataSource = dsReports
    FixedColor = 4732444
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Verdana'
    Font.Style = []
    Options = [dgTitles, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWhite
    TitleFont.Height = -21
    TitleFont.Name = 'Verdana'
    TitleFont.Style = [fsBold]
    OnDrawColumnCell = dbgrdReportsDrawColumnCell
    OnTitleClick = dbgrdReportsTitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'studentID'
        Title.Caption = 'S-ID'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'firstName'
        Title.Caption = 'First Name'
        Width = 143
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lastName'
        Title.Caption = 'Last Name'
        Width = 154
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dateModified'
        Title.Caption = 'Date Modified'
        Width = 172
        Visible = True
      end>
  end
  object dbredtReport: TDBRichEdit
    Left = 560
    Top = 136
    Width = 457
    Height = 329
    Color = clScrollBar
    DataField = 'reportDocument'
    DataSource = dsReports
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Verdana'
    Font.Style = []
    HideScrollBars = False
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 3
    OnKeyPress = dbredtReportKeyPress
  end
  object edtSearchFullName: TEdit
    Left = 448
    Top = 496
    Width = 265
    Height = 33
    AutoSelect = False
    Color = clScrollBar
    Font.Charset = ANSI_CHARSET
    Font.Color = clGray
    Font.Height = -21
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Text = 'Full Name'
    OnChange = edtSearchFullNameChange
    OnClick = edtSearchFullNameClick
    OnKeyPress = edtSearchFullNameKeyPress
  end
  object edtSearchID: TEdit
    Left = 736
    Top = 496
    Width = 265
    Height = 33
    AutoSelect = False
    Color = clScrollBar
    Font.Charset = ANSI_CHARSET
    Font.Color = clGray
    Font.Height = -21
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    Text = 'Student ID'
    OnChange = edtSearchIDChange
    OnClick = edtSearchIDClick
    OnKeyPress = edtSearchIDKeyPress
  end
  object dsReports: TDataSource
    DataSet = qryReports
    Left = 984
    Top = 80
  end
  object qryReports: TADOQuery
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Program Files (x' +
      '86)\Borland\Delphi7\Projects\CourseWorkProject\schoolDatabase.md' +
      'b;Persist Security Info=False'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT reportID, firstName, lastName, reportDocument, dateModifi' +
        'ed, Reports.studentID FROM Reports'
      'INNER JOIN Students'
      'ON Reports.studentID = Students.studentID')
    Left = 920
    Top = 80
  end
  object qryUpdate: TADOQuery
    Active = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Program Files (x' +
      '86)\Borland\Delphi7\Projects\CourseWorkProject\schoolDatabase.md' +
      'b;Persist Security Info=False'
    CursorType = ctStatic
    DataSource = dsReports
    Parameters = <>
    SQL.Strings = (
      
        'SELECT reportID, firstName, lastName, reportDocument, dateModifi' +
        'ed, Reports.studentID FROM Reports'
      'INNER JOIN Students'
      'ON Reports.studentID = Students.studentID')
    Left = 784
    Top = 80
  end
end
