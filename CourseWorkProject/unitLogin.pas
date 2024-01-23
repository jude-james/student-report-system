unit unitLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, DB, ADODB, unitHomePage, unitSignUp;

type
  TfrmLogin = class(TForm)
  
    imgLogo: TImage;
    edtUsername: TEdit;
    edtPassword: TEdit;
    btnLogin: TButton;
    lblSignUp: TLabel;
    lblSignUpButton: TLabel;
    lblErrorMessage: TLabel;
    qryLogin: TADOQuery;

    procedure edtUsernameKeyPress(Sender: TObject; var Key: Char);
    procedure edtPasswordKeyPress(Sender: TObject; var Key: Char);
    procedure edtUsernameClick(Sender: TObject);
    procedure edtPasswordClick(Sender: TObject);
    procedure lblSignUpButtonClick(Sender: TObject);
    procedure lblSignUpButtonMouseEnter(Sender: TObject);
    procedure lblSignUpButtonMouseLeave(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  public
    StaffID : string;

  private
    usernamePromptHidden : boolean;
    passwordPromptHidden : Boolean;
    
    procedure HideTextPrompt(textEdit : TEdit; var hidden : boolean);
    procedure DisplayError(errorMessage : string);
    procedure GetUsernamePassword;
    procedure Login;
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  lblErrorMessage.Visible := false;
  
  usernamePromptHidden := false;
  passwordPromptHidden := false;

  edtUsername.Text := 'Username';
  edtPassword.Text := 'Password';
  edtUsername.Font.Color := clGray;
  edtPassword.Font.Color := clGray;
  edtPassword.PasswordChar := #0;
end;

procedure TfrmLogin.edtUsernameKeyPress(Sender: TObject; var Key: Char);
begin
  HideTextPrompt(TEdit(Sender), usernamePromptHidden);
end;

procedure TfrmLogin.edtPasswordKeyPress(Sender: TObject; var Key: Char);
begin
  HideTextPrompt(TEdit(Sender), passwordPromptHidden);
  TEdit(Sender).PasswordChar := '*';
end;

procedure TfrmLogin.edtUsernameClick(Sender: TObject);
begin
  HideTextPrompt(TEdit(Sender), usernamePromptHidden);
end;

procedure TfrmLogin.edtPasswordClick(Sender: TObject);
begin
  HideTextPrompt(TEdit(Sender), passwordPromptHidden);
  TEdit(Sender).PasswordChar := '*';
end;

procedure TfrmLogin.lblSignUpButtonClick(Sender: TObject);
begin
  Hide;
  frmSignUp.Show;
end;

procedure TfrmLogin.lblSignUpButtonMouseEnter(Sender: TObject);
begin
  TLabel(Sender).Font.Color := clMaroon;
end;

procedure TfrmLogin.lblSignUpButtonMouseLeave(Sender: TObject);
begin
  TLabel(Sender).Font.Color := clWhite;
end;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
begin
  GetUsernamePassword;
end;

procedure TFrmLogin.HideTextPrompt(textEdit : TEdit; var hidden : Boolean);
begin
  if not hidden then begin
    textEdit.Text := '';
    textEdit.Font.Color := clBlack;
    hidden := true;
  end;
end;

procedure TfrmLogin.DisplayError(errorMessage : string);
begin
  lblErrorMessage.Caption := errorMessage;
  lblErrorMessage.Visible := true;
end;

procedure TfrmLogin.GetUsernamePassword;
var
  sqlStatement : string;
begin
  sqlStatement := 'SELECT * FROM Login WHERE Username = ' + QuotedStr(edtUsername.Text);

  with qryLogin do begin
    Close;
    SQL.Clear;
    SQL.Add(sqlStatement);
    Open;

    if RecordCount = 0 then
      DisplayError('Incorrect Username')
    else if FieldByName('password').AsString <> edtPassword.Text then
      DisplayError('Incorrect Password')
    else begin
      StaffID := FieldByName('staffID').AsString;
      Login;
    end;
  end;
end;

procedure TfrmLogin.Login;
begin
  Hide;
  frmHomePage.Show;
end;

end.
