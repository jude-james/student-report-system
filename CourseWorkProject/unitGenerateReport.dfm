object frmGenerateReportPage: TfrmGenerateReportPage
  Left = 751
  Top = 178
  BorderStyle = bsDialog
  Caption = 'Generate Report'
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
  object lblText1: TLabel
    Left = 8
    Top = 96
    Width = 574
    Height = 25
    Caption = 'Select the student you want to write a report for'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblMainText: TLabel
    Left = 8
    Top = 8
    Width = 622
    Height = 78
    Caption = 'SELECT STUDENT'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -64
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblText2: TLabel
    Left = 8
    Top = 144
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
  object btnContinue: TButton
    Left = 749
    Top = 504
    Width = 265
    Height = 49
    Caption = 'CONTINUE'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnContinueClick
  end
  object lstStudents: TListBox
    Left = 8
    Top = 192
    Width = 657
    Height = 217
    Color = clScrollBar
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Verdana'
    Font.Style = []
    ItemHeight = 25
    ParentFont = False
    TabOrder = 2
    OnClick = lstStudentsClick
  end
  object lbledtStudentID: TLabeledEdit
    Left = 8
    Top = 448
    Width = 153
    Height = 33
    Color = clScrollBar
    EditLabel.Width = 114
    EditLabel.Height = 25
    EditLabel.Caption = 'Student ID'
    EditLabel.Font.Charset = ANSI_CHARSET
    EditLabel.Font.Color = clWhite
    EditLabel.Font.Height = -21
    EditLabel.Font.Name = 'Verdana'
    EditLabel.Font.Style = [fsItalic]
    EditLabel.ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
  object lbledtYearGroup: TLabeledEdit
    Left = 176
    Top = 448
    Width = 153
    Height = 33
    Color = clScrollBar
    EditLabel.Width = 119
    EditLabel.Height = 25
    EditLabel.Caption = 'Year Group'
    EditLabel.Font.Charset = ANSI_CHARSET
    EditLabel.Font.Color = clWhite
    EditLabel.Font.Height = -21
    EditLabel.Font.Name = 'Verdana'
    EditLabel.Font.Style = [fsItalic]
    EditLabel.ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
  end
  object lbledtFormGroup: TLabeledEdit
    Left = 344
    Top = 448
    Width = 153
    Height = 33
    Color = clScrollBar
    EditLabel.Width = 125
    EditLabel.Height = 25
    EditLabel.Caption = 'Form Group'
    EditLabel.Font.Charset = ANSI_CHARSET
    EditLabel.Font.Color = clWhite
    EditLabel.Font.Height = -21
    EditLabel.Font.Name = 'Verdana'
    EditLabel.Font.Style = [fsItalic]
    EditLabel.ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
  end
  object edtSearchFullName: TEdit
    Left = 160
    Top = 144
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
    TabOrder = 6
    Text = 'Full Name'
    OnChange = edtSearchFullNameChange
    OnClick = edtSearchFullNameClick
    OnKeyPress = edtSearchFullNameKeyPress
  end
  object lbledtCandidateNumber: TLabeledEdit
    Left = 512
    Top = 448
    Width = 153
    Height = 33
    Color = clScrollBar
    EditLabel.Width = 151
    EditLabel.Height = 25
    EditLabel.Caption = 'Candidate No.'
    EditLabel.Font.Charset = ANSI_CHARSET
    EditLabel.Font.Color = clWhite
    EditLabel.Font.Height = -21
    EditLabel.Font.Name = 'Verdana'
    EditLabel.Font.Style = [fsItalic]
    EditLabel.ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 7
  end
  object lbledtParentEmail: TLabeledEdit
    Left = 8
    Top = 520
    Width = 321
    Height = 33
    Color = clScrollBar
    EditLabel.Width = 134
    EditLabel.Height = 25
    EditLabel.Caption = 'Parent Email'
    EditLabel.Font.Charset = ANSI_CHARSET
    EditLabel.Font.Color = clWhite
    EditLabel.Font.Height = -21
    EditLabel.Font.Name = 'Verdana'
    EditLabel.Font.Style = [fsItalic]
    EditLabel.ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 8
  end
  object lbledtStudentEmail: TLabeledEdit
    Left = 344
    Top = 520
    Width = 321
    Height = 33
    Color = clScrollBar
    EditLabel.Width = 147
    EditLabel.Height = 25
    EditLabel.Caption = 'Student Email'
    EditLabel.Font.Charset = ANSI_CHARSET
    EditLabel.Font.Color = clWhite
    EditLabel.Font.Height = -21
    EditLabel.Font.Name = 'Verdana'
    EditLabel.Font.Style = [fsItalic]
    EditLabel.ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 9
  end
  object qryStudents: TADOQuery
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Program Files (x' +
      '86)\Borland\Delphi7\Projects\CourseWorkProject\schoolDatabase.md' +
      'b;Persist Security Info=False'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM Students')
    Left = 984
    Top = 80
  end
end
