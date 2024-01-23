unit unitHomePage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, unitStudentsPage, unitClassesPage, unitReports,
  unitGradesPage, unitGenerateReport, unitStudentPerformancePage, unitEditDetailsPage;

type
  TfrmHomePage = class(TForm)

    lblHomePage: TLabel;
    lblFullName: TLabel;
    lblStaffID: TLabel;
    lblEmail: TLabel;
    btnStudents: TButton;
    btnReports: TButton;
    btnGrades: TButton;
    btnGenerateReport: TButton;
    btnPerformance: TButton;
    qryHomePage: TADOQuery;
    btnQuit: TButton;
    btnSignOut: TButton;
    btnEditDetails: TButton;

    procedure FormShow(Sender: TObject);
    procedure btnStudentsClick(Sender: TObject);
    procedure btnClassesClick(Sender: TObject);
    procedure btnReportsClick(Sender: TObject);
    procedure btnGradesClick(Sender: TObject);
    procedure btnGenerateReportClick(Sender: TObject);
    procedure btnPerformanceClick(Sender: TObject);
    procedure btnQuitClick(Sender: TObject);
    procedure btnSignOutClick(Sender: TObject);
    procedure btnEditDetailsClick(Sender: TObject);

  private
    procedure DisplayStaffDetails;
  end;

var
  frmHomePage: TfrmHomePage;

implementation

uses unitLogin;

{$R *.dfm}

procedure TfrmHomePage.FormShow(Sender: TObject);
begin
  DisplayStaffDetails;
end;

procedure TfrmHomePage.btnStudentsClick(Sender: TObject);
begin
  Hide;
  frmStudentsPage.Show;
end;

procedure TfrmHomePage.btnClassesClick(Sender: TObject);
begin
  Hide;
  frmClassesPage.Show;
end;

procedure TfrmHomePage.btnReportsClick(Sender: TObject);
begin
  Hide;
  frmReports.Show;
end;

procedure TfrmHomePage.btnGradesClick(Sender: TObject);
begin
  Hide;
  frmGradesPage.Show;
end;

procedure TfrmHomePage.btnGenerateReportClick(Sender: TObject);
begin
  Hide;
  frmGenerateReportPage.Show;
end;

procedure TfrmHomePage.btnPerformanceClick(Sender: TObject);
begin
  Hide;
  frmStudentPerformancePage.Show;
end;

procedure TfrmHomePage.DisplayStaffDetails;
var
  sqlStatement : string;
  firstName : string;
  lastName : string;
  email : string;
begin
  sqlStatement := 'SELECT * FROM Staff WHERE staffID = ' + frmLogin.StaffID;

  with qryHomePage do begin
    Close;
    SQL.Clear;
    SQL.Add(sqlStatement);
    Open;

    if RecordCount <> 0 then begin
      firstName := FieldByName('firstName').AsString;
      lastName := FieldByName('lastName').AsString;
      email := FieldByName('email').AsString;

      lblFullName.Caption := 'Name: ' + firstName + ' ' + lastName;
      lblStaffID.Caption := 'Staff ID: ' + frmLogin.StaffID;
      lblEmail.Caption := 'Email: ' + email;
    end;
  end;
end;

procedure TfrmHomePage.btnQuitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmHomePage.btnSignOutClick(Sender: TObject);
begin
  Hide;
  frmLogin.Show;
end;

procedure TfrmHomePage.btnEditDetailsClick(Sender: TObject);
begin
  Hide;
  frmEditDetails.Show;
end;

end.
