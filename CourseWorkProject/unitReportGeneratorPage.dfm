object frmReportGeneratorPage: TfrmReportGeneratorPage
  Left = 521
  Top = 301
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
  object lblMainText: TLabel
    Left = 8
    Top = 8
    Width = 693
    Height = 78
    Caption = 'GENERATE REPORT'
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
    Width = 419
    Height = 25
    Caption = 'Generate report for STUDENT NAME'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblText2: TLabel
    Left = 8
    Top = 152
    Width = 389
    Height = 18
    Caption = '(1 - Major Cause Of Concern    5 - Excellent)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblErrorMessage: TLabel
    Left = 16
    Top = 528
    Width = 66
    Height = 23
    Caption = 'ERROR'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -19
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
    Visible = False
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
  object grpInclude: TGroupBox
    Left = 8
    Top = 208
    Width = 329
    Height = 209
    Caption = 'Include Sections'
    Color = 3221282
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 1
    object chkIncludeIntroduction: TCheckBox
      Left = 16
      Top = 32
      Width = 273
      Height = 41
      Caption = 'Include Introduction'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 0
    end
    object chkIncludeConclusion: TCheckBox
      Left = 16
      Top = 64
      Width = 273
      Height = 41
      Caption = 'Include Conclusion'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 1
    end
    object chkMentionGrades: TCheckBox
      Left = 16
      Top = 96
      Width = 273
      Height = 41
      Caption = 'Mention Grades'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 2
    end
    object chkMentionAttendancePunctuality: TCheckBox
      Left = 16
      Top = 128
      Width = 273
      Height = 41
      Caption = 'Mention Attendance And Punctuality'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 3
    end
    object chkMentionAchievementBehaviour: TCheckBox
      Left = 16
      Top = 160
      Width = 305
      Height = 41
      Caption = 'Mention Behaviour And Achievement Points'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 4
    end
  end
  object rgWorkCompletion: TRadioGroup
    Left = 352
    Top = 216
    Width = 225
    Height = 57
    Caption = 'Work Completion'
    Columns = 5
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5')
    ParentFont = False
    TabOrder = 2
  end
  object rgHomeworkCompletion: TRadioGroup
    Left = 352
    Top = 288
    Width = 225
    Height = 57
    Caption = 'Homework Completion'
    Columns = 5
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5')
    ParentFont = False
    TabOrder = 3
  end
  object rgWorkQuality: TRadioGroup
    Left = 592
    Top = 216
    Width = 225
    Height = 57
    Caption = 'Work Quality'
    Columns = 5
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5')
    ParentFont = False
    TabOrder = 4
  end
  object rgLessonInvolvement: TRadioGroup
    Left = 592
    Top = 360
    Width = 225
    Height = 57
    Caption = 'Lesson Involvement'
    Columns = 5
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5')
    ParentFont = False
    TabOrder = 5
  end
  object rgBehaviour: TRadioGroup
    Left = 352
    Top = 360
    Width = 225
    Height = 57
    Caption = 'Behaviour'
    Columns = 5
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5')
    ParentFont = False
    TabOrder = 6
  end
  object rgHomeworkQuality: TRadioGroup
    Left = 592
    Top = 288
    Width = 225
    Height = 57
    Caption = 'Homework Quality'
    Columns = 5
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5')
    ParentFont = False
    TabOrder = 7
  end
  object btnGenerate: TButton
    Left = 749
    Top = 504
    Width = 265
    Height = 49
    Caption = 'GENERATE'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnClick = btnGenerateClick
  end
  object qryStudent: TADOQuery
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
