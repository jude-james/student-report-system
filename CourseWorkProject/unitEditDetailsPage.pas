unit unitEditDetailsPage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, ADODB;

type
  TfrmEditDetails = class(TForm)

    btnGoBack: TButton;
    lblMainText: TLabel;
    btnSave: TButton;
    btnCancel: TButton;
    lbledtFirstName: TLabeledEdit;
    lbledtLastName: TLabeledEdit;
    lbledtEmail: TLabeledEdit;
    lbledtAddress: TLabeledEdit;
    lbledtPhoneNumber: TLabeledEdit;
    lbledtNIN: TLabeledEdit;
    lbledtUsername: TLabeledEdit;
    lbledtPassword: TLabeledEdit;
    qryEditDetailsPage: TADOQuery;
    lblErrorMessage: TLabel;

    procedure btnGoBackClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    procedure FillEditBoxes;
    procedure UpdateSQL;

  end;

var
  frmEditDetails: TfrmEditDetails;

implementation

uses unitHomePage, unitLogin;

{$R *.dfm}

procedure TfrmEditDetails.FormShow(Sender: TObject);
begin
  FillEditBoxes;
end;

procedure TfrmEditDetails.btnGoBackClick(Sender: TObject);
begin
  Hide;
  frmHomePage.Show;
end;

procedure TfrmEditDetails.btnSaveClick(Sender: TObject);
var
  sqlStatementStaff : string;
  sqlStatementLogin : string;
  confirmationMessage : string;
  hasChangedDetails : Boolean;
begin
  sqlStatementStaff := 'SELECT * FROM Staff WHERE staffID = ' + frmLogin.StaffID;
  sqlStatementLogin := 'SELECT * FROM Login WHERE staffID = ' + frmLogin.StaffID;
  
  hasChangedDetails := false;
  lblErrorMessage.Visible := False;
  
  with qryEditDetailsPage do begin
    Close;
    SQL.Clear;
    SQL.Add(sqlStatementStaff);
    Open;

    confirmationMessage := 'Are you sure you want to update your details? The changes are as follows: ';

    if FieldByName('firstName').AsString <> lbledtFirstName.Text then begin
      confirmationMessage := confirmationMessage + #13'Current First Name: ' + FieldByName('firstName').AsString + ' --> New First Name: ' + lbledtFirstName.Text;
      hasChangedDetails := true;
    end;
    if FieldByName('lastName').AsString <> lbledtLastName.Text then begin
      confirmationMessage := confirmationMessage + #13'Current Last Name: ' + FieldByName('lastName').AsString + ' --> New Last Name: ' + lbledtLastName.Text;
      hasChangedDetails := true;
    end;
    if FieldByName('email').AsString <> lbledtEmail.Text then begin
      confirmationMessage := confirmationMessage + #13'Current Email: ' + FieldByName('email').AsString + ' --> New Email: ' + lbledtEmail.Text;
      hasChangedDetails := true;
    end;
    if FieldByName('address').AsString <> lbledtAddress.Text then begin
      confirmationMessage := confirmationMessage + #13'Current Address: ' + FieldByName('address').AsString + ' --> New Address: ' + lbledtAddress.Text;
      hasChangedDetails := true;
    end;
    if FieldByName('phoneNumber').AsString <> lbledtPhoneNumber.Text then begin
      confirmationMessage := confirmationMessage + #13'Current Phone Number: ' + FieldByName('phoneNumber').AsString + ' --> New Phone Number: ' + lbledtPhoneNumber.Text;
      hasChangedDetails := true;
    end;
    if FieldByName('nationalInsuranceNumber').AsString <> lbledtNIN.Text then begin
      confirmationMessage := confirmationMessage + #13'Current National Insurance Number: ' + FieldByName('nationalInsuranceNumber').AsString + ' --> New National Insurance Number: ' + lbledtNIN.Text;
      hasChangedDetails := true;
    end;

    Close;
    SQL.Clear;
    SQL.Add(sqlStatementLogin);
    Open;

    if FieldByName('username').AsString <> lbledtUsername.Text then begin
      confirmationMessage := confirmationMessage + #13'Current Username: ' + FieldByName('username').AsString + ' --> New Username: ' + lbledtUsername.Text;
      hasChangedDetails := true;
    end;
    if FieldByName('password').AsString <> lbledtPassword.Text then begin
      confirmationMessage := confirmationMessage + #13'Current Password: ' + FieldByName('password').AsString + ' --> New Password: ' + lbledtPassword.Text;
      hasChangedDetails := true;
    end;

  end;

  if hasChangedDetails then begin
    if MessageDlg(confirmationMessage, mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      UpdateSQL;
    end;
  end
  else begin
    lblErrorMessage.Caption := 'You have not changed your details, cannot save';
    lblErrorMessage.Visible := true;
  end;

end;

procedure TfrmEditDetails.btnCancelClick(Sender: TObject);
begin
  FillEditBoxes;
  lblErrorMessage.Visible := false;
end;

procedure TfrmEditDetails.FillEditBoxes;
var
  sqlStatementStaff : string;
  sqlStatementLogin : string;
begin
  sqlStatementStaff := 'SELECT * FROM Staff WHERE staffID = ' + frmLogin.StaffID;
  sqlStatementLogin := 'SELECT * FROM Login WHERE staffID = ' + frmLogin.StaffID;

  with qryEditDetailsPage do begin
    Close;
    SQL.Clear;
    SQL.Add(sqlStatementStaff);
    Open;

    if RecordCount <> 0 then begin
      lbledtFirstName.Text := FieldByName('firstName').AsString;
      lbledtLastName.Text := FieldByName('lastName').AsString;
      lbledtEmail.Text := FieldByName('email').AsString;
      lbledtAddress.Text := FieldByName('address').AsString;
      lbledtPhoneNumber.Text := FieldByName('phoneNumber').AsString;
      lbledtNIN.Text := FieldByName('nationalInsuranceNumber').AsString;
    end;

    Close;
    SQL.Clear;
    SQL.Add(sqlStatementLogin);
    Open;

    if RecordCount <> 0 then begin
      lbledtUsername.Text := FieldByName('username').AsString;
      lbledtPassword.Text := FieldByName('password').AsString;
    end;
  end;
end;

procedure TfrmEditDetails.UpdateSQL;
var
  sqlStatementStaff : string;
  sqlStatementLogin : string;
begin
  sqlStatementStaff :=
  'UPDATE Staff SET ' +
  'firstName = ' + QuotedStr(lbledtFirstName.Text) +
  ', lastName = ' + QuotedStr(lbledtLastName.Text) +
  ', email = ' + QuotedStr(lbledtEmail.Text) +
  ', address = ' + QuotedStr(lbledtAddress.Text) +
  ', phoneNumber = ' + QuotedStr(lbledtPhoneNumber.Text) +
  ', nationalInsuranceNumber = ' + QuotedStr(lbledtNIN.Text) +
  ' WHERE staffID = ' + frmLogin.StaffID;

  sqlStatementLogin := 'SELECT * FROM Login WHERE Username = ' + QuotedStr(lbledtUsername.Text) + ' AND staffID <> ' + frmLogin.StaffID;

  with qryEditDetailsPage do begin
    Close;
    SQL.Clear;
    SQL.Add(sqlStatementStaff);
    ExecSQL;

    Close;
    SQL.Clear;
    SQL.Add(sqlStatementLogin);
    Open;

    if RecordCount = 0 then begin
      sqlStatementStaff :=
      'UPDATE Login SET ' +
      'username = ' + QuotedStr(lbledtUsername.Text) +
      ', [password] = ' + QuotedStr(lbledtPassword.Text) +
      ' WHERE staffID = ' + frmLogin.StaffID;

      with qryEditDetailsPage do begin
        Close;
        SQL.Clear;
        SQL.Add(sqlStatementStaff);
        ExecSQL;
      end;

    end
    else begin
      lblErrorMessage.Caption := 'Username already exists';
      lblErrorMessage.Visible := true;
    end;
  end;
end;
end.
