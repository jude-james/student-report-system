unit unitGradesPage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, Grids, DBGrids, DBCtrls, ExtCtrls, ComCtrls;

type
  TfrmGradesPage = class(TForm)
  
    btnGoBack: TButton;
    dbgrdGrades: TDBGrid;
    dsGrades: TDataSource;
    qryGrades: TADOQuery;
    cbbWorkingAt: TComboBox;
    cbbTarget: TComboBox;
    cbbPredicted: TComboBox;
    cbbEndOfYear: TComboBox;
    lblText2: TLabel;
    cbbSubject: TComboBox;
    cbbYear: TComboBox;
    lblMainText: TLabel;
    lblText1: TLabel;
    lblText3: TLabel;
    edtSearchFirstName: TEdit;
    edtSearchLastName: TEdit;
    edtSearchID: TEdit;

    procedure btnGoBackClick(Sender: TObject);
    procedure cbbWorkingAtChange(Sender: TObject);
    procedure cbbTargetChange(Sender: TObject);
    procedure cbbPredictedChange(Sender: TObject);
    procedure cbbEndOfYearChange(Sender: TObject);
    procedure dbgrdGradesDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgrdGradesTitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure cbbSubjectChange(Sender: TObject);
    procedure cbbYearChange(Sender: TObject);
    procedure edtSearchFirstNameClick(Sender: TObject);
    procedure edtSearchFirstNameKeyPress(Sender: TObject; var Key: Char);
    procedure edtSearchLastNameClick(Sender: TObject);
    procedure edtSearchLastNameKeyPress(Sender: TObject; var Key: Char);
    procedure edtSearchIDClick(Sender: TObject);
    procedure edtSearchFirstNameChange(Sender: TObject);
    procedure edtSearchLastNameChange(Sender: TObject);
    procedure edtSearchIDChange(Sender: TObject);

  private
    sortByToggle : Boolean;
    searchFirstNamePromptHidden : boolean;
    searchLastNamePromptHidden : Boolean;
    searchIDPromptHidden : boolean;

    procedure SetSQL(fieldName : string; recordType : string);
    procedure HideTextPrompt(textEdit : TEdit; var hidden : boolean);
  end;

var
  frmGradesPage: TfrmGradesPage;

implementation

uses unitHomePage;

{$R *.dfm}

procedure TfrmGradesPage.FormCreate(Sender: TObject);
begin
  dbgrdGrades.Columns[0].Title.Color := RGB(28, 54, 120);
end;

procedure TfrmGradesPage.btnGoBackClick(Sender: TObject);
begin
  Hide;
  frmHomePage.Show;
end;

procedure TfrmGradesPage.SetSQL(fieldName : string; recordType : string);
var
  sqlStatement : string;
begin

  if recordType = 'ALL' then
    sqlStatement :=
    'SELECT Students.firstName, Students.lastName, Students.studentID, academicYear, subject, workingAt, target, predicted, endOfYear ' +
    'FROM Grades INNER JOIN Students ON Students.studentID = Grades.studentID'
  else
    sqlStatement := 'SELECT Students.firstName, Students.lastName, Students.studentID, academicYear, subject, workingAt, target, predicted, endOfYear ' +
    'FROM Grades INNER JOIN Students ON Students.studentID = Grades.studentID ' +
    'WHERE ' + fieldName + ' = ' + QuotedStr(recordType);

  with qryGrades do begin
    Close;
    SQL.Clear;
    SQL.Add(sqlStatement);
    Open;
  end;
end;

procedure TfrmGradesPage.cbbWorkingAtChange(Sender: TObject);
begin
  SetSQL('workingAt', TComboBox(Sender).Text);
end;

procedure TfrmGradesPage.cbbTargetChange(Sender: TObject);
begin
  SetSQL('target', TComboBox(Sender).Text);
end;

procedure TfrmGradesPage.cbbPredictedChange(Sender: TObject);
begin
  SetSQL('predicted', TComboBox(Sender).Text);
end;

procedure TfrmGradesPage.cbbEndOfYearChange(Sender: TObject);
begin
  SetSQL('endOfYear', TComboBox(Sender).Text);
end;

procedure TfrmGradesPage.cbbSubjectChange(Sender: TObject);
begin
  SetSQL('subject', TComboBox(Sender).Text);
end;

procedure TfrmGradesPage.cbbYearChange(Sender: TObject);
var
  sqlStatement : string;
begin
  if TComboBox(Sender).Text = 'ALL' then
    sqlStatement :=
    'SELECT Students.firstName, Students.lastName, Students.studentID, academicYear, subject, workingAt, target, predicted, endOfYear ' +
    'FROM Grades INNER JOIN Students ON Students.studentID = Grades.studentID'
  else
    sqlStatement := 'SELECT Students.firstName, Students.lastName, Students.studentID, academicYear, subject, workingAt, target, predicted, endOfYear ' +
    'FROM Grades INNER JOIN Students ON Students.studentID = Grades.studentID ' +
    'WHERE academicYear = ' + TComboBox(Sender).Text;

  with qryGrades do begin
    Close;
    SQL.Clear;
    SQL.Add(sqlStatement);
    Open;
  end
end;

procedure TfrmGradesPage.dbgrdGradesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (qryGrades.RecNo MOD 2 = 0) then begin
    if (dbgrdGrades.Canvas.Brush.Color = dbgrdGrades.Color) then begin
      dbgrdGrades.Canvas.Brush.Color := RGB(220, 220, 220);
    end;
  end;
  dbgrdGrades.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmGradesPage.dbgrdGradesTitleClick(Column: TColumn);
var
  i : integer;
begin
  for i := 0 to dbgrdGrades.Columns.Count - 1 do begin
      dbgrdGrades.Columns[i].Title.Color := RGB(28, 54, 72);
  end;

  for i := 0 to dbgrdGrades.Columns.Count - 1 do begin
    if Column.FieldName = dbgrdGrades.Columns[i].FieldName then begin
      Column.Title.Color := RGB(28, 54, 120);
      if not sortByToggle then begin
        qryGrades.Sort := dbgrdGrades.Columns[i].FieldName + ' ASC';
        sortByToggle := true;
      end
    else begin
      qryGrades.Sort := dbgrdGrades.Columns[i].FieldName + ' DESC';
      sortByToggle := false;
    end;
  end
  end;
end;

procedure TfrmGradesPage.HideTextPrompt(textEdit : TEdit; var hidden : Boolean);
begin
  if not hidden then begin
    textEdit.Text := '';
    textEdit.Font.Color := clBlack;
    hidden := true;
  end;
end;

procedure TfrmGradesPage.edtSearchFirstNameClick(Sender: TObject);
begin
  HideTextPrompt(TEdit(Sender), searchFirstNamePromptHidden);
end;

procedure TfrmGradesPage.edtSearchFirstNameKeyPress(Sender: TObject; var Key: Char);
begin
  HideTextPrompt(TEdit(Sender), searchFirstNamePromptHidden);
end;

procedure TfrmGradesPage.edtSearchLastNameClick(Sender: TObject);
begin
  HideTextPrompt(TEdit(Sender), searchLastNamePromptHidden);
end;

procedure TfrmGradesPage.edtSearchLastNameKeyPress(Sender: TObject; var Key: Char);
begin
  HideTextPrompt(TEdit(Sender), searchLastNamePromptHidden);
end;

procedure TfrmGradesPage.edtSearchIDClick(Sender: TObject);
begin
  HideTextPrompt(TEdit(Sender), searchIDPromptHidden);
end;

procedure TfrmGradesPage.edtSearchFirstNameChange(Sender: TObject);
var
  inputText : string;
  searchOptions : TLocateOptions;
begin
  inputText := TEdit(Sender).Text;
  searchOptions := [loPartialKey];
  qryGrades.Locate('firstName', inputText, searchOptions);
end;

procedure TfrmGradesPage.edtSearchLastNameChange(Sender: TObject);
var
  inputText : string;
  searchOptions : TLocateOptions;
begin
  inputText := TEdit(Sender).Text;
  searchOptions := [loPartialKey];
  qryGrades.Locate('lastName', inputText, searchOptions);
end;

procedure TfrmGradesPage.edtSearchIDChange(Sender: TObject);
var
  inputText: string;
  value : integer;
begin
  inputText := TEdit(Sender).Text;
  if (TryStrToInt(inputText, value)) then
    qryGrades.Locate('studentID', value, [])
end;

end.
