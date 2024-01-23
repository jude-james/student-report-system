unit unitSignUp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, StrUtils, DB, ADODB;
  
type
  TfrmSignUp = class(TForm)
  
    lblLoginButton: TLabel;
    btnSignUp: TButton;
    lbledtFirstName: TLabeledEdit;
    lblLogin: TLabel;
    lbledtLastName: TLabeledEdit;
    lbledtEmail: TLabeledEdit;
    lbledtUsername: TLabeledEdit;
    lbledtPassword: TLabeledEdit;
    chkConfirm: TCheckBox;
    lblErrorMessage: TLabel;
    qrySignUp: TADOQuery;

    procedure FormShow(Sender: TObject);
    procedure lblLoginButtonMouseEnter(Sender: TObject);
    procedure lblLoginButtonMouseLeave(Sender: TObject);
    procedure lblLoginButtonClick(Sender: TObject);
    procedure btnSignUpClick(Sender: TObject);
    procedure lbledtAllClick(Sender: TObject);

  private
    canSignUp : Boolean;

    procedure CheckFirstName;
    procedure CheckLastName;
    procedure CheckEmail;
    procedure CheckUsername;
    procedure CheckPassword;
    procedure CheckSQL;

    procedure DisplayError(errorMessage : string);
  end;

var
  frmSignUp: TfrmSignUp;

implementation

uses unitLogin;

{$R *.dfm}

procedure TfrmSignUp.FormShow(Sender: TObject);
begin
  lblErrorMessage.Visible := false;
end;

procedure TfrmSignUp.lblLoginButtonMouseEnter(Sender: TObject);
begin
  TLabel(Sender).Font.Color := clMaroon;
end;

procedure TfrmSignUp.lblLoginButtonMouseLeave(Sender: TObject);
begin
  TLabel(Sender).Font.Color := clWhite;
end;

procedure TfrmSignUp.lbledtAllClick(Sender: TObject);
begin
  TLabeledEdit(Sender).Font.Color := clBlack;
end;

procedure TfrmSignUp.lblLoginButtonClick(Sender: TObject);
begin
  Hide;
  frmLogin.Show;
end;

procedure TfrmSignUp.btnSignUpClick(Sender: TObject);
begin
  canSignUp := true;
  
  CheckFirstName;

  if canSignUp then begin
    if chkConfirm.Checked then begin
      if MessageDlg('Confirm Sign Up - Are you sure these details are correct?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
        CheckSQL;
      end;
    end
    else begin
      DisplayError('Fill in all fields');
    end;
  end;

end;

procedure TfrmSignUp.CheckFirstName;
const
  letters = ['A'..'Z', 'a'..'z'];
var
  i : integer;
  errorMessage : string;
begin
  if Length(lbledtFirstName.Text) = 0 then begin
    canSignUp := false;
    errorMessage := 'Enter a first name';
  end;

  for i := 1 to Length(lbledtFirstName.Text) do begin
    if not (lbledtFirstName.Text[i] in letters) then begin
      canSignUp := false;
      errorMessage := 'First name must only contain letters';
    end;
  end;

  if canSignUp then
    CheckLastName
  else begin
    DisplayError(errorMessage);
    lbledtFirstName.Font.Color := clRed;
  end;

end;

procedure TfrmSignUp.CheckLastName;
const
  letters = ['A'..'Z', 'a'..'z'];
var
  i : integer;
  errorMessage : string;
begin
  if Length(lbledtLastName.Text) = 0 then begin
    canSignUp := false;
    errorMessage := 'Enter a last name';
  end;

  for i := 1 to Length(lbledtLastName.Text) do begin
    if not (lbledtLastName.Text[i] in letters) then begin
      canSignUp := false;
      errorMessage := 'Last name must only contain letters';
    end;
  end;

  if canSignUp then
    CheckEmail
  else begin
    DisplayError(errorMessage);
    lbledtLastName.Font.Color := clRed;
  end;
end;

procedure TfrmSignUp.CheckEmail;
const
  illegalCharacters = ['!', '#', '$', '&', '*', '+', '/', '=', '?', '^', '_', '`', '{', '|', '}', '~'];
  maxEmailLength = 320;
var
  i, j: integer;
  containsCommercialAt : boolean;
  indexOfCommercialAt : integer;
  dotAfterCommercialAt : boolean;
begin
  for i := 1 to Length(lbledtEmail.Text) do begin
    if lbledtEmail.Text[i] = '@' then begin
      indexOfCommercialAt := i;
      containsCommercialAt := true;
    end
  end;

  if not containsCommercialAt then begin
    canSignUp := false;
  end;

  if canSignUp then begin
    if (indexOfCommercialAt = 1) or (indexOfCommercialAt = Length(lbledtEmail.Text)) then begin
      canSignUp := false;
    end
    else begin
      for j := indexOfCommercialAt + 1 to Length(lbledtEmail.Text) do begin
        if lbledtEmail.Text[j] = '.' then begin
          dotAfterCommercialAt := true;
        end;

        if lbledtEmail.Text[j] in illegalCharacters then begin
          canSignUp := false;
        end;
      end;
    end;

    if lbledtEmail.Text[1] = '.' then begin
      canSignUp := false;
    end;

    if AnsiContainsText(lbledtEmail.Text, '..') then begin
      canSignUp := false;
    end;
  end;

  if not dotAfterCommercialAt then begin
    canSignUp := false;
  end
  else begin
    if (lbledtEmail.Text[indexOfCommercialAt + 1] = '.') or (lbledtEmail.Text[Length(lbledtEmail.Text)] = '.') then begin
      canSignUp := false;
    end;

    if (lbledtEmail.Text[indexOfCommercialAt + 1] = '-') then begin
      canSignUp := false;
    end;
  end;

  if Length(lbledtEmail.Text) > maxEmailLength then begin
    canSignUp := false;
  end;

  if canSignUp then begin
    CheckUsername;
  end
  else begin
    DisplayError('Invalid email format');
    lbledtEmail.Font.Color := clRed;
  end;
end;

procedure TfrmSignUp.CheckUsername;
const
  illegalCharacters = ['&', '=', '_', '-', '+', ',', '<', '>', ''''];
var
  errorMessage : string;
  i : integer;
begin
  if (Length(lbledtUsername.Text) < 6) or (Length(lbledtUsername.Text) > 30) then begin
    canSignUp := false;
    errorMessage := 'Username between 6 and 30 characters';
  end;

  for i := 1 to Length(lbledtUsername.Text) do begin
    if lbledtUsername.Text[i] in illegalCharacters then begin
      canSignUp := false;
      errorMessage := 'Username has illegal characters';
    end;
  end;

  if canSignUp then begin
    CheckPassword;
  end
  else begin
    DisplayError(errorMessage);
    lbledtUsername.Font.Color := clRed;
  end;
end;

procedure TfrmSignUp.CheckPassword;
const
  requiredCharacters = ['!', '#', '$', '%', '&', '(', ')', '*', '+', ',', '-', '.', '/', ':', ';', '>', '<', '=', '@', '[', ']', '\', '^', '_'];
var
  i : integer;
  hasRequiredCharacter : boolean;
  errorMessage : string;
begin
  if Length(lbledtPassword.Text) < 8 then begin
    canSignUp := false;
    errorMessage := 'Password must be at least 8 characters';
  end;

  for i := 1 to Length(lbledtPassword.Text) do begin
    if lbledtPassword.Text[i] in requiredCharacters then begin
      hasRequiredCharacter := true;
    end;
  end;

  if not hasRequiredCharacter then begin
    canSignUp := false;
    errorMessage := 'Password must contain a special character';
  end;

  if not canSignUp then begin
    DisplayError(errorMessage);
    lbledtPassword.Font.Color := clRed;
  end;
end;

procedure TfrmSignUp.DisplayError(errorMessage : string);
begin
  lblErrorMessage.Caption := errorMessage;
  lblErrorMessage.Visible := true;
end;

procedure TfrmSignUp.CheckSQL;
var
  sqlStatement : string;
  staffID : string;
begin
  sqlStatement := 'SELECT * FROM Login WHERE Username = ' + QuotedStr(lbledtUsername.Text);

  with qrySignUp do begin
    Close;
    SQL.Clear;
    SQL.Add(sqlStatement);
    Open;

    if RecordCount = 0 then begin
      sqlStatement := 'INSERT INTO Staff (firstName, lastName, email) VALUES (' + QuotedStr(lbledtFirstName.Text) + ', ' + QuotedStr(lbledtLastName.Text) + ', ' + QuotedStr(lbledtEmail.Text) + ')';

      with qrySignUp do begin
        Close;
        SQL.Clear;
        SQL.Add(sqlStatement);
        ExecSQL;
      end;

      sqlStatement := 'SELECT * FROM Staff WHERE firstName = ' + QuotedStr(lbledtFirstName.Text);

      with qrySignUp do begin
        Close;
        SQL.Clear;
        SQL.Add(sqlStatement);
        Open;

        staffID := FieldByName('staffID').AsString;
      end;

      sqlStatement := 'INSERT INTO Login VALUES (' + QuotedStr(lbledtUsername.Text) + ', ' + QuotedStr(lbledtPassword.Text) + ', ' + staffID + ')';

      with qrySignUp do begin
        Close;
        SQL.Clear;
        SQL.Add(sqlStatement);
        ExecSQL;
      end;

      ShowMessage('Congratulations, you''re account has been created');
      Hide;
      frmLogin.Show;
    end
    else begin
      DisplayError('Username already exists');
    end;
  end;
end;

end.
