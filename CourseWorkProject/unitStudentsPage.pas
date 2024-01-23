unit unitStudentsPage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, ExtCtrls, DBCtrls, StdCtrls, Mask;

type
  TfrmStudentsPage = class(TForm)

    lblMainText: TLabel;
    lblText1: TLabel;
    lblText2: TLabel;
    btnGoBack: TButton;
    dsStudents: TDataSource;
    dbgrdStudents: TDBGrid;
    qryStudents: TADOQuery;
    edtSearchFirstName: TEdit;
    edtSearchLastName: TEdit;
    edtSearchID: TEdit;

    procedure FormShow(Sender: TObject);
    procedure btnGoBackClick(Sender: TObject);
    procedure dbgrdStudentsDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbgrdStudentsTitleClick(Column: TColumn);
    procedure edtSearchFirstNameClick(Sender: TObject);
    procedure edtSearchFirstNameKeyPress(Sender: TObject; var Key: Char);
    procedure edtSearchLastNameClick(Sender: TObject);
    procedure edtSearchLastNameKeyPress(Sender: TObject; var Key: Char);
    procedure edtSearchIDClick(Sender: TObject);
    procedure edtSearchIDKeyPress(Sender: TObject; var Key: Char);
    procedure edtSearchFirstNameChange(Sender: TObject);
    procedure edtSearchLastNameChange(Sender: TObject);
    procedure edtSearchIDChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    sortByToggle : boolean;
    searchFirstNamePromptHidden : boolean;
    searchLastNamePromptHidden : Boolean;
    searchIDPromptHidden : boolean;

    procedure SetSQL;
    procedure HideTextPrompt(textEdit : TEdit; var hidden : boolean);
  end;

var
  frmStudentsPage: TfrmStudentsPage;

implementation

uses unitHomePage, unitLogin;

{$R *.dfm}

procedure TfrmStudentsPage.FormShow(Sender: TObject);
begin
  SetSQL;
end;

procedure TfrmStudentsPage.FormCreate(Sender: TObject);
begin
  dbgrdStudents.Columns[0].Title.Color := RGB(28, 54, 120);
end;

procedure TfrmStudentsPage.btnGoBackClick(Sender: TObject);
begin
  Hide;
  frmHomePage.Show;
end;

procedure TfrmStudentsPage.dbgrdStudentsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (qryStudents.RecNo MOD 2 = 0) then begin
    if (dbgrdStudents.Canvas.Brush.Color = dbgrdStudents.Color) then begin
      dbgrdStudents.Canvas.Brush.Color := RGB(220, 220, 220);
    end;
  end;
  dbgrdStudents.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmStudentsPage.dbgrdStudentsTitleClick(Column: TColumn);
var
  i : integer;
begin
  for i := 0 to dbgrdStudents.Columns.Count - 1 do begin
      dbgrdStudents.Columns[i].Title.Color := RGB(28, 54, 72);
  end;

  for i := 0 to dbgrdStudents.Columns.Count - 1 do begin
    if Column.FieldName = dbgrdStudents.Columns[i].FieldName then begin
      Column.Title.Color := RGB(28, 54, 120);
      if not sortByToggle then begin
        qryStudents.Sort := dbgrdStudents.Columns[i].FieldName + ' ASC';
        sortByToggle := true;
      end
      else begin
        qryStudents.Sort := dbgrdStudents.Columns[i].FieldName + ' DESC';
        sortByToggle := false;
      end;
    end
  end;
end;

procedure TfrmStudentsPage.edtSearchFirstNameClick(Sender: TObject);
begin
  HideTextPrompt(TEdit(Sender), searchFirstNamePromptHidden);
end;

procedure TfrmStudentsPage.edtSearchFirstNameKeyPress(Sender: TObject; var Key: Char);
begin
  HideTextPrompt(TEdit(Sender), searchFirstNamePromptHidden);
end;

procedure TfrmStudentsPage.edtSearchLastNameClick(Sender: TObject);
begin
  HideTextPrompt(TEdit(Sender), searchLastNamePromptHidden);
end;

procedure TfrmStudentsPage.edtSearchLastNameKeyPress(Sender: TObject; var Key: Char);
begin
  HideTextPrompt(TEdit(Sender), searchLastNamePromptHidden);
end;

procedure TfrmStudentsPage.edtSearchIDClick(Sender: TObject);
begin
  HideTextPrompt(TEdit(Sender), searchIDPromptHidden);
end;

procedure TfrmStudentsPage.edtSearchIDKeyPress(Sender: TObject; var Key: Char);
begin
  HideTextPrompt(TEdit(Sender), searchIDPromptHidden);
end;

procedure TfrmStudentsPage.edtSearchFirstNameChange(Sender: TObject);
var
  inputText : string;
  searchOptions : TLocateOptions;
begin
  inputText := TEdit(Sender).Text;
  searchOptions := [loPartialKey];
  qryStudents.Locate('firstName', inputText, searchOptions);
end;

procedure TfrmStudentsPage.edtSearchLastNameChange(Sender: TObject);
var
  inputText : string;
  searchOptions : TLocateOptions;
begin
  inputText := TEdit(Sender).Text;
  searchOptions := [loPartialKey];
  qryStudents.Locate('lastName', inputText, searchOptions);
end;

procedure TfrmStudentsPage.edtSearchIDChange(Sender: TObject);
var
  inputText: string;
  value : integer;
begin
  inputText := TEdit(Sender).Text;
  if (TryStrToInt(inputText, value)) then
    qryStudents.Locate('studentID', value, [])
end;

procedure TfrmStudentsPage.SetSQL;
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
  end;
end;

procedure TfrmStudentsPage.HideTextPrompt(textEdit : TEdit; var hidden : Boolean);
begin
  if not hidden then begin
    textEdit.Text := '';
    textEdit.Font.Color := clBlack;
    hidden := true;
  end;
end;

end.
