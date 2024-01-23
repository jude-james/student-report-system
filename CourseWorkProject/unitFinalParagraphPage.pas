unit unitFinalParagraphPage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, ADODB;

type
  TfrmFinalParagraphPage = class(TForm)

    btnRegenerate: TButton;
    btnSave: TButton;
    redtFinalParagraph: TRichEdit;
    btnGoBack: TButton;
    qryReports: TADOQuery;
    procedure btnGoBackClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnRegenerateClick(Sender: TObject);

  private
    procedure UpdateSQL;
    
  end;

var
  frmFinalParagraphPage: TfrmFinalParagraphPage;

implementation

uses unitReportGeneratorPage, unitLogin, unitGenerateReport;

{$R *.dfm}

procedure TfrmFinalParagraphPage.btnGoBackClick(Sender: TObject);
begin
  Hide;
  frmReportGeneratorPage.Show;
end;

procedure TfrmFinalParagraphPage.btnRegenerateClick(Sender: TObject);
begin
  frmReportGeneratorPage.RegenerateReport;
end;

procedure TfrmFinalParagraphPage.btnSaveClick(Sender: TObject);
begin
  if MessageDlg('Are you sure you want to save this report? You can view it on the reports page.', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    UpdateSQL;
    Hide;
    frmGenerateReportPage.Show;
  end;
end;

procedure TfrmFinalParagraphPage.UpdateSQL;
var
  sqlStatement : string;
begin
  sqlStatement := 'INSERT INTO Reports (reportDocument, dateModified, studentID, staffID) VALUES (' + QuotedStr(redtFinalParagraph.Text) + ', ' + QuotedStr(DateToStr(Now())) + ', ' + QuotedStr(frmGenerateReportPage.StudentID) + ', ' + QuotedStr(frmLogin.StaffID) + ')';

  with qryReports do begin
    SQL.Clear;
    SQL.Add(sqlStatement);
    ExecSQL;
  end;
end;

end.
