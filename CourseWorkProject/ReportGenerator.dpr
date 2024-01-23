program ReportGenerator;

uses
  Forms,
  unitLogin in 'unitLogin.pas' {frmLogin},
  unitHomePage in 'unitHomePage.pas' {frmHomePage},
  unitSignUp in 'unitSignUp.pas' {frmSignUp},
  unitStudentsPage in 'unitStudentsPage.pas' {frmStudentsPage},
  unitClassesPage in 'unitClassesPage.pas' {frmClassesPage},
  unitReports in 'unitReports.pas' {frmReports},
  unitGradesPage in 'unitGradesPage.pas' {frmGradesPage},
  unitGenerateReport in 'unitGenerateReport.pas' {frmGenerateReportPage},
  unitStudentPerformancePage in 'unitStudentPerformancePage.pas' {frmStudentPerformancePage},
  unitEditDetailsPage in 'unitEditDetailsPage.pas' {frmEditDetails},
  unitReportGeneratorPage in 'unitReportGeneratorPage.pas' {frmReportGeneratorPage},
  unitFinalParagraphPage in 'unitFinalParagraphPage.pas' {frmFinalParagraphPage};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmHomePage, frmHomePage);
  Application.CreateForm(TfrmSignUp, frmSignUp);
  Application.CreateForm(TfrmStudentsPage, frmStudentsPage);
  Application.CreateForm(TfrmClassesPage, frmClassesPage);
  Application.CreateForm(TfrmReports, frmReports);
  Application.CreateForm(TfrmGradesPage, frmGradesPage);
  Application.CreateForm(TfrmGenerateReportPage, frmGenerateReportPage);
  Application.CreateForm(TfrmStudentPerformancePage, frmStudentPerformancePage);
  Application.CreateForm(TfrmEditDetails, frmEditDetails);
  Application.CreateForm(TfrmReportGeneratorPage, frmReportGeneratorPage);
  Application.CreateForm(TfrmFinalParagraphPage, frmFinalParagraphPage);
  Application.Run;
end.
