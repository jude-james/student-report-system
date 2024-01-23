object frmStudentsPage: TfrmStudentsPage
  Left = 644
  Top = 236
  BorderStyle = bsDialog
  Caption = 'Students'
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
    Width = 606
    Height = 78
    Caption = 'YOUR STUDENTS'
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
    Width = 141
    Height = 25
    Caption = '(View Only)'
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
  object dbgrdStudents: TDBGrid
    Left = 8
    Top = 136
    Width = 1009
    Height = 329
    Align = alCustom
    Color = 15724527
    Ctl3D = True
    DataSource = dsStudents
    FixedColor = 4732444
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Verdana'
    Font.Style = []
    Options = [dgTitles, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWhite
    TitleFont.Height = -21
    TitleFont.Name = 'Verdana'
    TitleFont.Style = [fsBold]
    OnDrawColumnCell = dbgrdStudentsDrawColumnCell
    OnTitleClick = dbgrdStudentsTitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'studentID'
        Title.Caption = 'Student ID'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -19
        Title.Font.Name = 'Verdana'
        Title.Font.Style = [fsBold]
        Width = 126
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'firstName'
        Title.Caption = 'First Name'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -19
        Title.Font.Name = 'Verdana'
        Title.Font.Style = [fsBold]
        Width = 230
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lastName'
        Title.Caption = 'Last Name'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -19
        Title.Font.Name = 'Verdana'
        Title.Font.Style = [fsBold]
        Width = 230
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'yearGroup'
        Title.Caption = 'Year Group'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -19
        Title.Font.Name = 'Verdana'
        Title.Font.Style = [fsBold]
        Width = 127
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'formGroup'
        Title.Caption = 'Form Group'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -19
        Title.Font.Name = 'Verdana'
        Title.Font.Style = [fsBold]
        Width = 132
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'studentEmail'
        Title.Caption = 'Student Email'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -19
        Title.Font.Name = 'Verdana'
        Title.Font.Style = [fsBold]
        Width = 194
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'parentEmail'
        Title.Caption = 'Parent Email'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -19
        Title.Font.Name = 'Verdana'
        Title.Font.Style = [fsBold]
        Width = 370
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'candidateNumber'
        Title.Caption = 'Candidate Number'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -19
        Title.Font.Name = 'Verdana'
        Title.Font.Style = [fsBold]
        Width = 208
        Visible = True
      end>
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
    TabOrder = 1
    OnClick = btnGoBackClick
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
    TabOrder = 2
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
    TabOrder = 3
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
    TabOrder = 4
    Text = 'Student ID'
    OnChange = edtSearchIDChange
    OnClick = edtSearchIDClick
    OnKeyPress = edtSearchIDKeyPress
  end
  object dsStudents: TDataSource
    DataSet = qryStudents
    Left = 976
    Top = 80
  end
  object qryStudents: TADOQuery
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Program Files (x' +
      '86)\Borland\Delphi7\Projects\CourseWorkProject\schoolDatabase.md' +
      'b;Persist Security Info=False'
    CursorType = ctStatic
    Parameters = <>
    Left = 920
    Top = 80
  end
end
