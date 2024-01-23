unit unitGenerateReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, DBCtrls, Mask, ExtCtrls, strUtils;

type
  TfrmGenerateReportPage = class(TForm)

    btnGoBack: TButton;
    btnContinue: TButton;
    lblText1: TLabel;
    lblMainText: TLabel;
    qryStudents: TADOQuery;
    lstStudents: TListBox;
    lbledtStudentID: TLabeledEdit;
    lbledtYearGroup: TLabeledEdit;
    lbledtFormGroup: TLabeledEdit;
    lblText2: TLabel;
    edtSearchFullName: TEdit;
    lbledtCandidateNumber: TLabeledEdit;
    lbledtParentEmail: TLabeledEdit;
    lbledtStudentEmail: TLabeledEdit;
    
    procedure btnGoBackClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lstStudentsClick(Sender: TObject);
    procedure edtSearchFullNameChange(Sender: TObject);
    procedure edtSearchFullNameClick(Sender: TObject);
    procedure edtSearchFullNameKeyPress(Sender: TObject; var Key: Char);
    procedure btnContinueClick(Sender: TObject);

  public
    StudentID : string;
    
  private
    searchFullNamePromptHidden : boolean;

    procedure SetSQL;
    procedure UpdateData;
    procedure HideTextPrompt(textEdit : TEdit; var hidden : boolean);
  end;

var
  frmGenerateReportPage: TfrmGenerateReportPage;
  studentIDs : array of integer;

implementation

uses unitHomePage, unitLogin, unitReportGeneratorPage;

{$R *.dfm}

procedure TfrmGenerateReportPage.btnGoBackClick(Sender: TObject);
begin
  Hide;
  frmHomePage.Show;
end;

procedure TfrmGenerateReportPage.FormShow(Sender: TObject);
begin
  lstStudents.Clear;
  SetLength(studentIDs, 0);

  SetSQL;

  if Length(studentIDs) > 1 then begin
    lstStudents.Selected[0] := true;
    UpdateData;
  end;
end;

procedure TfrmGenerateReportPage.lstStudentsClick(Sender: TObject);
begin
  UpdateData;
end;

procedure TfrmGenerateReportPage.SetSQL;
var
  sqlStatement : string;
begin
  sqlStatement :=
  'SELECT DISTINCT Students.studentID, firstName, lastName, yearGroup, formGroup, studentEmail, parentEmail, candidateNumber ' +
  'FROM Students INNER JOIN Reports ' +
  'ON Students.studentID = Reports.studentID ' +
  'WHERE Reports.staffID = ' + frmLogin.StaffID;

  with qryStudents do begin
    Close;
    SQL.Clear;
    SQL.Add(sqlStatement);
    Open;
    
    First;
    while not Eof do begin
      lstStudents.Items.Add(FieldByName('firstName').AsString + ' ' + FieldByName('lastName').AsString);
      SetLength(studentIDs, Length(studentIDs) + 1);
      studentIDs[High(studentIDs)] := FieldByName('studentID').AsInteger;
      Next;
    end;
  end;
end;

procedure TfrmGenerateReportPage.UpdateData;
var
  sqlStatement : string;
begin
  StudentID := IntToStr(studentIDs[lstStudents.ItemIndex]);

  sqlStatement := 'SELECT * FROM Students WHERE studentID = ' + StudentID;

  with qryStudents do begin
    Close;
    SQL.Clear;
    SQL.Add(sqlStatement);
    Open;

    lbledtStudentID.Text := StudentID;
    lbledtYearGroup.Text := FieldByName('yearGroup').AsString;
    lbledtFormGroup.Text := FieldByName('formGroup').AsString;
    lbledtCandidateNumber.Text := FieldByName('candidateNumber').AsString;
    lbledtParentEmail.Text := FieldByName('parentEmail').AsString;
    lbledtStudentEmail.Text := FieldByName('studentEmail').AsString;
  end;
end;

procedure TfrmGenerateReportPage.HideTextPrompt(textEdit : TEdit; var hidden : Boolean);
begin
  if not hidden then begin
    textEdit.Text := '';
    textEdit.Font.Color := clBlack;
    hidden := true;
  end;
end;

procedure TfrmGenerateReportPage.edtSearchFullNameChange(Sender: TObject);
var
  inputText : string;
  i : Integer;
begin
  inputText := TEdit(Sender).Text;

  for i := 0 to lstStudents.Items.Count - 1 do begin
    if AnsiContainsText(lstStudents.Items[i], inputText) then begin
      lstStudents.Selected[i] := true;
      UpdateData;
    end;
  end;
end;

procedure TfrmGenerateReportPage.edtSearchFullNameClick(Sender: TObject);
begin
  HideTextPrompt(TEdit(Sender), searchFullNamePromptHidden);
end;

procedure TfrmGenerateReportPage.edtSearchFullNameKeyPress(Sender: TObject;
  var Key: Char);
begin
  HideTextPrompt(TEdit(Sender), searchFullNamePromptHidden);
end;

procedure TfrmGenerateReportPage.btnContinueClick(Sender: TObject);
begin
  if Length(studentIDs) > 1 then begin
    Hide;
    frmReportGeneratorPage.Show;
  end;
end;

end.
