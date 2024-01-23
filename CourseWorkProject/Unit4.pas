unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm4 = class(TForm)
    lblMain: TLabel;
    btnGoBack: TButton;
    btnContinue: TButton;
    lbledtFirstName: TLabeledEdit;
    lbledtLastName: TLabeledEdit;
    lbledtEmail: TLabeledEdit;
    lbledtAddress: TLabeledEdit;
    lbledt1: TLabeledEdit;
    lbledt2: TLabeledEdit;
    lbledtFullName: TLabeledEdit;
    lstStudents: TListBox;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

end.
