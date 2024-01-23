unit unitReports;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DBCtrls, Grids, DBGrids, DB, ADODB, Mask;

type
  TfrmReports = class(TForm)

    btnGoBack: TButton;
    dtpDateModified: TDateTimePicker;
    lblMainText: TLabel;
    lblText1: TLabel;
    dbgrdReports: TDBGrid;
    dsReports: TDataSource;
    qryReports: TADOQuery;
    dbredtReport: TDBRichEdit;
    lblText2: TLabel;
    qryUpdate: TADOQuery;
    edtSearchFullName: TEdit;
    edtSearchID: TEdit;

    procedure FormShow(Sender: TObject);
    procedure btnGoBackClick(Sender: TObject);
    procedure dbgrdReportsDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbgrdReportsTitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure dtpDateModifiedChange(Sender: TObject);
    procedure dbredtReportKeyPress(Sender: TObject; var Key: Char);
    procedure edtSearchFullNameClick(Sender: TObject);
    procedure edtSearchFullNameKeyPress(Sender: TObject; var Key: Char);
    procedure edtSearchFullNameChange(Sender: TObject);
    procedure edtSearchIDClick(Sender: TObject);
    procedure edtSearchIDKeyPress(Sender: TObject; var Key: Char);
    procedure edtSearchIDChange(Sender: TObject);

  private
    sortByToggle : boolean;
    searchFullNamePromptHidden : boolean;
    searchIDPromptHidden : boolean;

    procedure SetSQL;
    procedure HideTextPrompt(textEdit : TEdit; var hidden : boolean);
  end;

var
  frmReports: TfrmReports;

implementation

uses unitHomePage, unitLogin;

{$R *.dfm}

procedure TfrmReports.FormShow(Sender: TObject);
begin
  SetSQL;
end;

procedure TfrmReports.FormCreate(Sender: TObject);
begin
  dbgrdReports.Columns[0].Title.Color := RGB(28, 54, 120);
end;

procedure TfrmReports.btnGoBackClick(Sender: TObject);
begin
  Hide;
  frmHomePage.Show;
end;

procedure TfrmReports.SetSQL;
var
  sqlStatement : string;
begin
  sqlStatement :=
  'SELECT reportID, firstName, lastName, reportDocument, dateModified, Reports.studentID ' +
  'FROM Reports INNER JOIN Students ON Reports.studentID = Students.studentID ' +
  'WHERE staffID = ' + frmLogin.StaffID;

  with qryReports do begin
    Close;
    SQL.Clear;
    SQL.Add(sqlStatement);
    Open;
  end;
end;

procedure TfrmReports.dbgrdReportsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (qryReports.RecNo MOD 2 = 0) then begin
    if (dbgrdReports.Canvas.Brush.Color = dbgrdReports.Color) then begin
      dbgrdReports.Canvas.Brush.Color := RGB(220, 220, 220);
    end;
  end;
  dbgrdReports.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmReports.dbgrdReportsTitleClick(Column: TColumn);
var
  i : integer;
begin
  for i := 0 to dbgrdReports.Columns.Count - 1 do begin
      dbgrdReports.Columns[i].Title.Color := RGB(28, 54, 72);
  end;

  for i := 0 to dbgrdReports.Columns.Count - 1 do begin
    if Column.FieldName = dbgrdReports.Columns[i].FieldName then begin
      Column.Title.Color := RGB(28, 54, 120);
      if not sortByToggle then begin
        qryReports.Sort := dbgrdReports.Columns[i].FieldName + ' ASC';
        sortByToggle := true;
      end
    else begin
      qryReports.Sort := dbgrdReports.Columns[i].FieldName + ' DESC';
      sortByToggle := false;
    end;
  end
  end;
end;

procedure TfrmReports.dtpDateModifiedChange(Sender: TObject);
var
  inputDate : string;
begin
  inputDate := DateToStr(TDateTimePicker(Sender).Date);
  qryReports.Locate('dateModified', inputDate, []);
end;

procedure TfrmReports.dbredtReportKeyPress(Sender: TObject; var Key: Char);
var
  sqlStatement : string;
begin
  if dbgrdReports.SelectedField.Text = '' then
    exit;

  sqlStatement := ' UPDATE Reports SET dateModified = ' + QuotedStr(DateToStr(Now())) + ' WHERE studentID = ' + dbgrdReports.SelectedField.Text;

  with qryUpdate do begin
    SQL.Clear;
    SQL.Add(sqlStatement);
    ExecSQL;
  end;
end;

procedure TfrmReports.HideTextPrompt(textEdit : TEdit; var hidden : Boolean);
begin
  if not hidden then begin
    textEdit.Text := '';
    textEdit.Font.Color := clBlack;
    hidden := true;
  end;
end;

procedure TfrmReports.edtSearchFullNameClick(Sender: TObject);
begin
  HideTextPrompt(TEdit(Sender), searchFullNamePromptHidden);
end;

procedure TfrmReports.edtSearchFullNameKeyPress(Sender: TObject; var Key: Char);
begin
  HideTextPrompt(TEdit(Sender), searchFullNamePromptHidden);
end;

procedure TfrmReports.edtSearchFullNameChange(Sender: TObject);
var
  inputText : string;
  searchOptions : TLocateOptions;
begin
  inputText := TEdit(Sender).Text;
  searchOptions := [loPartialKey];
  qryReports.Locate('firstName', inputText, searchOptions);
  qryReports.Locate('lastName', inputText, searchOptions);
end;

procedure TfrmReports.edtSearchIDClick(Sender: TObject);
begin
  HideTextPrompt(TEdit(Sender), searchIDPromptHidden);
end;

procedure TfrmReports.edtSearchIDKeyPress(Sender: TObject; var Key: Char);
begin
  HideTextPrompt(TEdit(Sender), searchIDPromptHidden);
end;

procedure TfrmReports.edtSearchIDChange(Sender: TObject);
var
  inputText: string;
  value : integer;
begin
  inputText := TEdit(Sender).Text;
  if (TryStrToInt(inputText, value)) then
    qryReports.Locate('studentID', value, [])
end;

end.
