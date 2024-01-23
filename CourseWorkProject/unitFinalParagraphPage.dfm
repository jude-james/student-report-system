object frmFinalParagraphPage: TfrmFinalParagraphPage
  Left = 400
  Top = 222
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
  PixelsPerInch = 96
  TextHeight = 13
  object btnRegenerate: TButton
    Left = 693
    Top = 496
    Width = 265
    Height = 49
    Caption = 'REGENERATE'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = btnRegenerateClick
  end
  object btnSave: TButton
    Left = 69
    Top = 496
    Width = 265
    Height = 49
    Caption = 'SAVE'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnSaveClick
  end
  object redtFinalParagraph: TRichEdit
    Left = 8
    Top = 8
    Width = 1001
    Height = 473
    Color = clScrollBar
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Verdana'
    Font.Style = []
    HideScrollBars = False
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object btnGoBack: TButton
    Left = 381
    Top = 496
    Width = 265
    Height = 49
    Caption = 'GO BACK'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = btnGoBackClick
  end
  object qryReports: TADOQuery
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Program Files (x' +
      '86)\Borland\Delphi7\Projects\CourseWorkProject\schoolDatabase.md' +
      'b;Persist Security Info=False'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM Students')
    Left = 976
    Top = 504
  end
end
