object Form4: TForm4
  Left = 492
  Top = 284
  BorderStyle = bsDialog
  Caption = 'Generate Report'
  ClientHeight = 567
  ClientWidth = 1024
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblMain: TLabel
    Left = 32
    Top = 24
    Width = 228
    Height = 39
    Caption = 'Select student'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnGoBack: TButton
    Left = 824
    Top = 24
    Width = 177
    Height = 65
    Caption = 'Go Back'
    TabOrder = 0
  end
  object btnContinue: TButton
    Left = 832
    Top = 472
    Width = 177
    Height = 65
    Caption = 'Continue'
    TabOrder = 1
  end
  object lbledtFirstName: TLabeledEdit
    Left = 16
    Top = 360
    Width = 209
    Height = 21
    EditLabel.Width = 52
    EditLabel.Height = 13
    EditLabel.Caption = 'Student ID'
    TabOrder = 2
  end
  object lbledtLastName: TLabeledEdit
    Left = 256
    Top = 360
    Width = 209
    Height = 21
    EditLabel.Width = 54
    EditLabel.Height = 13
    EditLabel.Caption = 'Year Group'
    TabOrder = 3
  end
  object lbledtEmail: TLabeledEdit
    Left = 16
    Top = 472
    Width = 449
    Height = 21
    EditLabel.Width = 59
    EditLabel.Height = 13
    EditLabel.Caption = 'Parent email'
    TabOrder = 4
  end
  object lbledtAddress: TLabeledEdit
    Left = 16
    Top = 528
    Width = 449
    Height = 21
    EditLabel.Width = 65
    EditLabel.Height = 13
    EditLabel.Caption = 'Student email'
    TabOrder = 5
  end
  object lbledt1: TLabeledEdit
    Left = 16
    Top = 416
    Width = 209
    Height = 21
    EditLabel.Width = 56
    EditLabel.Height = 13
    EditLabel.Caption = 'Form Group'
    TabOrder = 6
  end
  object lbledt2: TLabeledEdit
    Left = 256
    Top = 416
    Width = 209
    Height = 21
    EditLabel.Width = 89
    EditLabel.Height = 13
    EditLabel.Caption = 'Candidate Number'
    TabOrder = 7
  end
  object lbledtFullName: TLabeledEdit
    Left = 24
    Top = 88
    Width = 257
    Height = 21
    EditLabel.Width = 82
    EditLabel.Height = 13
    EditLabel.Caption = 'Search Full Name'
    TabOrder = 8
  end
  object lstStudents: TListBox
    Left = 24
    Top = 152
    Width = 705
    Height = 177
    ItemHeight = 13
    TabOrder = 9
  end
end
