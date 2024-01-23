unit unitClassesPage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmClassesPage = class(TForm)
    btnGoBack: TButton;
    procedure btnGoBackClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClassesPage: TfrmClassesPage;

implementation

uses unitHomePage;

{$R *.dfm}

procedure TfrmClassesPage.btnGoBackClick(Sender: TObject);
begin
  Hide;
  frmHomePage.Show;
end;

end.
