object frmGradesPage: TfrmGradesPage
  Left = 878
  Top = 180
  BorderStyle = bsDialog
  Caption = 'Grades'
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
  PixelsPerInch = 96
  TextHeight = 13
  object lblText2: TLabel
    Left = 8
    Top = 140
    Width = 153
    Height = 33
    Caption = 'FILTER BY:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblMainText: TLabel
    Left = 8
    Top = 8
    Width = 535
    Height = 78
    Caption = 'ALL STUDENTS'
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
    Width = 337
    Height = 25
    Caption = 'Grade Overview (View Only)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblText3: TLabel
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
  object dbgrdGrades: TDBGrid
    Left = 8
    Top = 232
    Width = 1009
    Height = 249
    Align = alCustom
    Color = 15724527
    Ctl3D = True
    DataSource = dsGrades
    FixedColor = 4732444
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Verdana'
    Font.Style = []
    Options = [dgTitles, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWhite
    TitleFont.Height = -21
    TitleFont.Name = 'Verdana'
    TitleFont.Style = [fsBold]
    OnDrawColumnCell = dbgrdGradesDrawColumnCell
    OnTitleClick = dbgrdGradesTitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'studentID'
        Title.Caption = 'Student ID'
        Width = 135
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'firstName'
        Title.Caption = 'First Name'
        Width = 230
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lastName'
        Title.Caption = 'Last Name'
        Width = 230
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'academicYear'
        Title.Caption = 'Year'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'subject'
        Title.Caption = 'Subject'
        Width = 142
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'workingAt'
        Title.Caption = 'Working At'
        Width = 141
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'target'
        Title.Caption = 'Target'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'predicted'
        Title.Caption = 'Predicated'
        Width = 133
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'endOfYear'
        Title.Caption = 'End Of Year'
        Width = 147
        Visible = True
      end>
  end
  object cbbWorkingAt: TComboBox
    Left = 184
    Top = 136
    Width = 241
    Height = 33
    Color = clScrollBar
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Verdana'
    Font.Style = []
    ItemHeight = 25
    ParentFont = False
    TabOrder = 2
    Text = 'Working At Grade'
    OnChange = cbbWorkingAtChange
    Items.Strings = (
      'A*'
      'A'
      'B'
      'C'
      'D'
      'E'
      'F'
      'ALL')
  end
  object cbbTarget: TComboBox
    Left = 456
    Top = 136
    Width = 241
    Height = 33
    Color = clScrollBar
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Verdana'
    Font.Style = []
    ItemHeight = 25
    ParentFont = False
    TabOrder = 3
    Text = 'Target Grade'
    OnChange = cbbTargetChange
    Items.Strings = (
      'A*'
      'A'
      'B'
      'C'
      'D'
      'E'
      'F'
      'ALL')
  end
  object cbbPredicted: TComboBox
    Left = 184
    Top = 184
    Width = 241
    Height = 33
    Color = clScrollBar
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Verdana'
    Font.Style = []
    ItemHeight = 25
    ParentFont = False
    TabOrder = 4
    Text = 'Predicted Grade'
    OnChange = cbbPredictedChange
    Items.Strings = (
      'A*'
      'A'
      'B'
      'C'
      'D'
      'E'
      'F'
      'ALL')
  end
  object cbbEndOfYear: TComboBox
    Left = 456
    Top = 184
    Width = 241
    Height = 33
    Color = clScrollBar
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Verdana'
    Font.Style = []
    ItemHeight = 25
    ParentFont = False
    TabOrder = 5
    Text = 'EOY Grade'
    OnChange = cbbEndOfYearChange
    Items.Strings = (
      'A*'
      'A'
      'B'
      'C'
      'D'
      'E'
      'F'
      'ALL')
  end
  object cbbSubject: TComboBox
    Left = 728
    Top = 184
    Width = 241
    Height = 33
    Color = clScrollBar
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Verdana'
    Font.Style = []
    ItemHeight = 25
    ParentFont = False
    TabOrder = 6
    Text = 'Subject'
    OnChange = cbbSubjectChange
    Items.Strings = (
      'English'
      'Maths'
      'Chemisty'
      'Biology'
      'Physics'
      'History'
      'Geography'
      'Religious Studies'
      'Spanish'
      'French'
      'Computer Science'
      'Economics'
      'Media Studies'
      'ALL')
  end
  object cbbYear: TComboBox
    Left = 728
    Top = 136
    Width = 241
    Height = 33
    Color = clScrollBar
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Verdana'
    Font.Style = []
    ItemHeight = 25
    ParentFont = False
    TabOrder = 7
    Text = 'Year'
    OnChange = cbbYearChange
    Items.Strings = (
      '2023'
      '2022'
      '2021'
      '2020'
      '2019'
      '2018'
      '2017'
      '2016'
      '2015'
      '2014'
      '2013'
      '2012'
      '2011'
      '2010'
      '2009'
      '2008'
      '2007'
      '2006'
      '2005'
      '2004'
      '2003'
      '2002'
      '2001'
      '2000'
      'ALL')
  end
  object edtSearchFirstName: TEdit
    Left = 160
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
    TabOrder = 8
    Text = 'First Name'
    OnChange = edtSearchFirstNameChange
    OnClick = edtSearchFirstNameClick
    OnKeyPress = edtSearchFirstNameKeyPress
  end
  object edtSearchLastName: TEdit
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
    TabOrder = 9
    Text = 'Last Name'
    OnChange = edtSearchLastNameChange
    OnClick = edtSearchLastNameClick
    OnKeyPress = edtSearchLastNameKeyPress
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
    TabOrder = 10
    Text = 'Student ID'
    OnChange = edtSearchIDChange
    OnClick = edtSearchIDClick
  end
  object dsGrades: TDataSource
    DataSet = qryGrades
    Left = 984
    Top = 80
  end
  object qryGrades: TADOQuery
    Active = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Program Files (x' +
      '86)\Borland\Delphi7\Projects\CourseWorkProject\schoolDatabase.md' +
      'b;Persist Security Info=False'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT Students.firstName, Students.lastName, Students.studentID' +
        ', academicYear, subject, workingAt, target, predicted, endOfYear' +
        ' FROM Grades'
      'INNER JOIN Students '
      'ON Students.studentID = Grades.studentID')
    Left = 920
    Top = 80
  end
end
