unit unitReportGeneratorPage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, ADODB, ComCtrls;

type
  TSentences = class
    public
      excellent : array of string;
      good : array of string;
      improvements : array of string;
      unsatisfactory : array of string;
      causeOfConcern : array of string;

      function GetArray(value : integer) : string;
  end;

type
  TfrmReportGeneratorPage = class(TForm)

    btnGoBack: TButton;
    lblMainText: TLabel;
    lblText1: TLabel;
    grpInclude: TGroupBox;
    chkIncludeIntroduction: TCheckBox;
    chkIncludeConclusion: TCheckBox;
    chkMentionGrades: TCheckBox;
    chkMentionAttendancePunctuality: TCheckBox;
    chkMentionAchievementBehaviour: TCheckBox;
    qryStudent: TADOQuery;
    rgWorkCompletion: TRadioGroup;
    rgHomeworkCompletion: TRadioGroup;
    rgWorkQuality: TRadioGroup;
    rgLessonInvolvement: TRadioGroup;
    rgBehaviour: TRadioGroup;
    lblText2: TLabel;
    rgHomeworkQuality: TRadioGroup;
    btnGenerate: TButton;
    lblErrorMessage: TLabel;

    procedure btnGoBackClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnGenerateClick(Sender: TObject);

  public
    procedure RegenerateReport;
    
  private
    firstName : string;
    lastName : string;
    yearGroup : string;
    formGroup : string;
    gender : string;
    attendance : integer;
    punctuality : integer;
    behaviourPoints : integer;
    achievementPoints : integer;

    averageAttendance : integer;
    averagePunctuality : integer;
    averageBehaviourPoints : integer;
    averageAchievementPoints : integer;

    workingAtGrades : array of string;
    subjects : array of string;

    heShePronoun : string;
    himHerPronoun : string;
    hisHerPronoun : string;
    
    workCompletion : integer;
    workQuality : integer;
    homeworkCompletion : integer;
    homeworkQuality : integer;
    behaviour : integer;
    lessonInvolvement : integer;

    overallWeight : Integer;

    finalParagraph : string;

    procedure SetAllSentences;
    procedure GetStudentInformation;
    procedure Grades;
    procedure AttendancePunctuality;
    procedure BehaviourAchievementPoints;
    procedure SchoolYear;
    procedure GenerateReport;
  end;

var
  frmReportGeneratorPage: TfrmReportGeneratorPage;

implementation

uses unitGenerateReport, unitFinalParagraphPage;

{$R *.dfm}

var
  introductionSentences : TSentences;
  conclusionSentences : TSentences;
  workQualitySentences : TSentences;
  workCompletionSentences : TSentences;
  homeworkQualitySentences : TSentences;
  homeworkCompletionSentences : TSentences;
  behaviourSentences : TSentences;
  lessonInvolvementSentences : TSentences;
  HowToImproveSentences : TSentences;

function TSentences.GetArray(value : integer) : string;
begin
  Randomize;
  if value = 1 then begin
    GetArray := causeOfConcern[Random(length(causeOfConcern))];
  end
  else if value = 2 then begin
    GetArray := unsatisfactory[Random(length(unsatisfactory))];
  end
  else if value = 3 then begin
    GetArray := improvements[Random(length(improvements))];
  end
  else if value = 4 then begin
    GetArray := good[Random(length(good))];
  end
  else if value = 5 then begin
    GetArray := excellent[Random(length(excellent))];
  end;
end;

procedure TfrmReportGeneratorPage.btnGoBackClick(Sender: TObject);
begin
  Hide;
  frmGenerateReportPage.Show;
end;

procedure TfrmReportGeneratorPage.FormShow(Sender: TObject);
begin
  GetStudentInformation;
  lblText1.Caption := 'Generate report for ' + firstName + ' ' + lastName;
  lblErrorMessage.Visible := false;
end;

procedure TfrmReportGeneratorPage.btnGenerateClick(Sender: TObject);
begin
  GenerateReport;
end;

procedure TfrmReportGeneratorPage.GetStudentInformation;
var
  sqlStatementStudent : string;
  sqlStatementPerformance : string;
  i : integer;
begin

  sqlStatementStudent := 'SELECT * FROM Students WHERE studentID = ' + frmGenerateReportPage.StudentID;
  sqlStatementPerformance := 'SELECT * FROM Performance WHERE studentID = ' + frmGenerateReportPage.StudentID;

  with qryStudent do begin
    Close;
    SQL.Clear;
    SQL.Add(sqlStatementStudent);
    Open;

    firstName := FieldByName('firstName').AsString;
    lastName := FieldByName('lastName').AsString;
    yearGroup := FieldByName('yearGroup').AsString;
    formGroup := FieldByName('formGroup').AsString;
    gender := FieldByName('gender').AsString;

    if gender = 'M' then begin
      heShePronoun := 'he';
      himHerPronoun := 'him';
      hisHerPronoun := 'his';
    end
    else if gender = 'F' then begin
      heShePronoun := 'she';
      himHerPronoun := 'her';
      hisHerPronoun := 'her';
    end;

    Close;
    SQL.Clear;
    SQL.Add(sqlStatementPerformance);
    Open;

    attendance := FieldByName('attendance').AsInteger;
    punctuality := FieldByName('punctuality').AsInteger;
    behaviourPoints := FieldByName('behaviourPoints').AsInteger;
    achievementPoints := FieldByName('achievementPoints').AsInteger;

    Close;
    SQL.Clear;
    SQL.Add('SELECT AVG(attendance) FROM Performance');
    Open;

    averageAttendance := Fields[0].AsInteger;

    Close;
    SQL.Clear;
    SQL.Add('SELECT AVG(punctuality) FROM Performance');
    Open;

    averagePunctuality := Fields[0].AsInteger;

    Close;
    SQL.Clear;
    SQL.Add('SELECT AVG(behaviourPoints) FROM Performance');
    Open;

    averageBehaviourPoints := Fields[0].AsInteger;

    Close;
    SQL.Clear;
    SQL.Add('SELECT AVG(achievementPoints) FROM Performance');
    Open;

    averageAchievementPoints := Fields[0].AsInteger;

    Close;
    SQL.Clear;
    SQL.Add('SELECT subject, workingAt FROM Grades WHERE studentID = ' + frmGenerateReportPage.StudentID);
    Open;

    SetLength(workingAtGrades, RecordCount);
    SetLength(subjects, RecordCount);
    
    First;
    i := 0;
    while not Eof do begin
      workingAtGrades[i] := Fields[1].AsString;
      subjects[i] := Fields[0].AsString;
      i := i + 1;
      Next;
    end;
  end;
end;

procedure TfrmReportGeneratorPage.SetAllSentences;
begin
  introductionSentences := TSentences.Create;

  SetLength(introductionSentences.excellent, 2);
  introductionSentences.excellent[0] := firstName + ' is an excellent student.';
  introductionSentences.excellent[1] := firstName + ' is an excellent student, ' + heShePronoun + ' is always interested in ' + hisHerPronoun + ' work and works very hard.';

  SetLength(introductionSentences.good, 2);
  introductionSentences.good[0] := firstName + ' has been good.';
  introductionSentences.good[1] := firstName + ' has been good.';

  SetLength(introductionSentences.improvements, 2);
  introductionSentences.improvements[0] := firstName + ' has room for improvement.';
  introductionSentences.improvements[1] := firstName + ' has room for improvement.';

  SetLength(introductionSentences.unsatisfactory, 2);
  introductionSentences.unsatisfactory[0] := firstName + ' has been unsatisfactory.';
  introductionSentences.unsatisfactory[1] := firstName + ' has been unsatisfactory.';

  SetLength(introductionSentences.causeOfConcern, 2);
  introductionSentences.causeOfConcern[0] := firstName + ' has been a cause of concern.';
  introductionSentences.causeOfConcern[1] := firstName + ' has been a cause of concern.';

  conclusionSentences := TSentences.Create;

  SetLength(conclusionSentences.excellent, 2);
  conclusionSentences.excellent[0] := 'To conclude, ' + firstName + ' has been excellent.';
  conclusionSentences.excellent[1] := 'To conclude, ' + firstName + ' has been excellent.';

  SetLength(conclusionSentences.good, 2);
  conclusionSentences.good[0] := 'To conclude, ' + firstName + ' has been good.';
  conclusionSentences.good[1] := 'To conclude, ' + firstName + ' has been good.';

  SetLength(conclusionSentences.improvements, 2);
  conclusionSentences.improvements[0] := 'To conclude, ' + firstName + ' has been improvements.';
  conclusionSentences.improvements[1] := 'To conclude, ' + firstName + ' has been improvements.';

  SetLength(conclusionSentences.unsatisfactory, 2);
  conclusionSentences.unsatisfactory[0] := 'To conclude, ' + firstName + ' has been unsatisfactory.';
  conclusionSentences.unsatisfactory[1] := 'To conclude, ' + firstName + ' has been unsatisfactory.';

  SetLength(conclusionSentences.causeOfConcern, 2);
  conclusionSentences.causeOfConcern[0] := 'To conclude, ' + firstName + ' has been cause of concern.';
  conclusionSentences.causeOfConcern[1] := 'To conclude, ' + firstName + ' has been cause of concern.';

  workQualitySentences := TSentences.Create;
                                   
  SetLength(workQualitySentences.excellent, 2);
  workQualitySentences.excellent[0] := firstName + ' is a highly capable student who has performed consistently well since the beginning of term. The quality of ' + hisHerPronoun + ' work has been nothing short of excellent, ' + heShePronoun + ' shows a clear understanding of the concepts being taught and it''s great to see this.';
  workQualitySentences.excellent[1] := firstName + ' is a hard working student, ' + heShePronoun + ' works well with friends in class and picks up new concepts and skills quickly, applying them confidently to exam questions. The quality of ' + hisHerPronoun + ' work is to a high standard which shows ' + firstName + ' is paying attention in class and working correctly.';

  SetLength(workQualitySentences.good, 2);
  workQualitySentences.good[0] := 'The work I''ve seen from ' + firstName + ' has been good. They write good notes and when it''s time to answer questions they show a great understanding.';
  workQualitySentences.good[1] := firstName + ' works hard and does well, ' + heShePronoun + ' has a really good understanding of what''s begin taught and ' + heShePronoun + ' can get to the challenging questions quickly.'; 

  SetLength(workQualitySentences.improvements, 2);
  workQualitySentences.improvements[0] := 'The quality of work from ' + firstName + ' has been okay, however I feel there is room for improvement. I know if ' + firstName + ' pushes further ' + hisHerPronoun + ' ability to answer questions will improve and ' + hisHerPronoun + ' work will improve greatly.';
  workQualitySentences.improvements[1] := firstName + ' needs to make some adjustments to ' + hisHerPronoun + ' work, I think ' + heShePronoun + ' has the capability of becoming a top student if ' + heShePronoun + ' spends more time revising and practising questions.';

  SetLength(workQualitySentences.unsatisfactory, 2);
  workQualitySentences.unsatisfactory[0] := 'The quality of work from ' + firstName + ' has been unsatisfactory, ' + heShePronoun + ' is not working as hard as ' + heShePronoun + ' could be, this is a problem and if ' + heShePronoun + ' is struggling remember ' + heShePronoun + ' can always come and talk to me for work advice.';
  workQualitySentences.unsatisfactory[1] := firstName + ' has not been working well at all, ' + hisHerPronoun + ' understanding is weak and ' + heShePronoun + ' is not putting much time into learning and improving.';

  SetLength(workQualitySentences.causeOfConcern, 2);
  workQualitySentences.causeOfConcern[0] := 'Painfully poor work from ' + firstName + '. The standard is very poor and not acceptable at all, ' + heShePronoun + ' really needs to get a grip and start focusing in lesson, making better notes and answering questions properly. This is really concerning and I am not impressed.';
  workQualitySentences.causeOfConcern[1] := 'The quality of work from ' + firstName + ' has been a major cause of concern, it is really worrying seeing such poor understanding of the topics and level of answering questions. Something needs to change fast or it is not looking good for ' + firstName + '.';

  workCompletionSentences := TSentences.Create;

  SetLength(workCompletionSentences.excellent, 2);
  workCompletionSentences.excellent[0] := firstName + ' has excellent completion of work, ' + heShePronoun + ' completes all ' + hisHerPronoun + ' work in lesson and keeps up with what is being taught.';
  workCompletionSentences.excellent[1] := 'The completion of work has been amazing, ' + firstName + ' always finishes the work I hand out and hardly ever needs help.';

  SetLength(workCompletionSentences.good, 2);
  workCompletionSentences.good[0] := firstName + ' has good completion of work. Any work that needs to be done during lesson gets done and I am happy with the amount ' + heShePronoun + ' completes in a lesson.';
  workCompletionSentences.good[1] := 'Work has been finished every lesson which is great to see, unlike many students ' + firstName + ' does not sit around doing nothing and actually gets on with all ' + hisHerPronoun + ' work.';

  SetLength(workCompletionSentences.improvements, 2);
  workCompletionSentences.improvements[0] := firstName + ' has been improvements in work completion.';
  workCompletionSentences.improvements[1] := firstName + ' has been improvements in work completion.';

  SetLength(workCompletionSentences.unsatisfactory, 2);
  workCompletionSentences.unsatisfactory[0] := firstName + ' has been unsatisfactory in work completion.';
  workCompletionSentences.unsatisfactory[1] := firstName + ' has been unsatisfactory in work completion.';

  SetLength(workCompletionSentences.causeOfConcern, 2);
  workCompletionSentences.causeOfConcern[0] := firstName + ' has been causeOfConcern in work completion.';
  workCompletionSentences.causeOfConcern[1] := firstName + ' has been causeOfConcern in work completion.';

  homeworkQualitySentences := TSentences.Create;

  SetLength(homeworkQualitySentences.excellent, 2);
  homeworkQualitySentences.excellent[0] := firstName + ' has been excellent in homework quality.';
  homeworkQualitySentences.excellent[1] := firstName + ' has been excellent in homework quality.';

  SetLength(homeworkQualitySentences.good, 2);
  homeworkQualitySentences.good[0] := firstName + ' has been good in homework quality.';
  homeworkQualitySentences.good[1] := firstName + ' has been good in homework quality.';

  SetLength(homeworkQualitySentences.improvements, 2);
  homeworkQualitySentences.improvements[0] := firstName + ' has been improvements in homework quality.';
  homeworkQualitySentences.improvements[1] := firstName + ' has been improvements in homework quality.';

  SetLength(homeworkQualitySentences.unsatisfactory, 2);
  homeworkQualitySentences.unsatisfactory[0] := firstName + ' has been unsatisfactory in homework quality.';
  homeworkQualitySentences.unsatisfactory[1] := firstName + ' has been unsatisfactory in homework quality.';

  SetLength(homeworkQualitySentences.causeOfConcern, 2);
  homeworkQualitySentences.causeOfConcern[0] := firstName + ' has been causeOfConcern in homework quality.';
  homeworkQualitySentences.causeOfConcern[1] := firstName + ' has been causeOfConcern in homework quality.';

  homeworkCompletionSentences := TSentences.Create;

  SetLength(homeworkCompletionSentences.excellent, 2);
  homeworkCompletionSentences.excellent[0] := firstName + ' has been excellent in homework completion.';
  homeworkCompletionSentences.excellent[1] := firstName + ' has been excellent in homework completion.';

  SetLength(homeworkCompletionSentences.good, 2);
  homeworkCompletionSentences.good[0] := firstName + ' has been good in homework completion.';
  homeworkCompletionSentences.good[1] := firstName + ' has been good in homework completion.';

  SetLength(homeworkCompletionSentences.improvements, 2);
  homeworkCompletionSentences.improvements[0] := firstName + ' has been improvements in homework completion.';
  homeworkCompletionSentences.improvements[1] := firstName + ' has been improvements in homework completion.';

  SetLength(homeworkCompletionSentences.unsatisfactory, 2);
  homeworkCompletionSentences.unsatisfactory[0] := firstName + ' has been unsatisfactory in homework completion.';
  homeworkCompletionSentences.unsatisfactory[1] := firstName + ' has been unsatisfactory in homework completion.';

  SetLength(homeworkCompletionSentences.causeOfConcern, 2);
  homeworkCompletionSentences.causeOfConcern[0] := firstName + ' has been causeOfConcern in homework completion.';
  homeworkCompletionSentences.causeOfConcern[1] := firstName + ' has been causeOfConcern in homework completion.';

  behaviourSentences := TSentences.Create;

  SetLength(behaviourSentences.excellent, 2);
  behaviourSentences.excellent[0] := firstName + ' has been excellent in behaviour.';
  behaviourSentences.excellent[1] := firstName + ' has been excellent in behaviour.';

  SetLength(behaviourSentences.good, 2);
  behaviourSentences.good[0] := firstName + ' has been good in behaviour.';
  behaviourSentences.good[1] := firstName + ' has been good in behaviour.';

  SetLength(behaviourSentences.improvements, 2);
  behaviourSentences.improvements[0] := firstName + ' has been improvements in behaviour.';
  behaviourSentences.improvements[1] := firstName + ' has been improvements in behaviour.';

  SetLength(behaviourSentences.unsatisfactory, 2);
  behaviourSentences.unsatisfactory[0] := firstName + ' has been unsatisfactory in behaviour.';
  behaviourSentences.unsatisfactory[1] := firstName + ' has been unsatisfactory in behaviour.';

  SetLength(behaviourSentences.causeOfConcern, 2);
  behaviourSentences.causeOfConcern[0] := firstName + ' has been causeOfConcern in behaviour.';
  behaviourSentences.causeOfConcern[1] := firstName + ' has been causeOfConcern in behaviour.';

  lessonInvolvementSentences := TSentences.Create;

  SetLength(lessonInvolvementSentences.excellent, 2);
  lessonInvolvementSentences.excellent[0] := firstName + ' has been excellent in lesson involvement.';
  lessonInvolvementSentences.excellent[1] := firstName + ' has been excellent in lesson involvement.';

  SetLength(lessonInvolvementSentences.good, 2);
  lessonInvolvementSentences.good[0] := firstName + ' has been good in lesson involvement.';
  lessonInvolvementSentences.good[1] := firstName + ' has been good in lesson involvement.';

  SetLength(lessonInvolvementSentences.improvements, 2);
  lessonInvolvementSentences.improvements[0] := firstName + ' has been improvements in lesson involvement.';
  lessonInvolvementSentences.improvements[1] := firstName + ' has been improvements in lesson involvement.';

  SetLength(lessonInvolvementSentences.unsatisfactory, 2);
  lessonInvolvementSentences.unsatisfactory[0] := firstName + ' has been unsatisfactory in lesson involvement.';
  lessonInvolvementSentences.unsatisfactory[1] := firstName + ' has been unsatisfactory in lesson involvement.';

  SetLength(lessonInvolvementSentences.causeOfConcern, 2);
  lessonInvolvementSentences.causeOfConcern[0] := firstName + ' has been causeOfConcern in lesson involvement.';
  lessonInvolvementSentences.causeOfConcern[1] := firstName + ' has been causeOfConcern in lesson involvement.';

  HowToImproveSentences := TSentences.Create;

  SetLength(HowToImproveSentences.excellent, 2);
  HowToImproveSentences.excellent[0] := firstName + ' needs to continue their excellent revision and work ethic.';
  HowToImproveSentences.excellent[1] := firstName + ' needs to continue their excellent revision and work ethic.';

  SetLength(HowToImproveSentences.good, 2);
  HowToImproveSentences.good[0] := firstName + ' needs to use the resources available to them to continue revising.';
  HowToImproveSentences.good[1] := firstName + ' needs to use the resources available to them to continue revising.';

  SetLength(HowToImproveSentences.improvements, 2);
  HowToImproveSentences.improvements[0] := 'I highly suggest ' + firstName + ' uses the revision resources available as it will help them greatly.';
  HowToImproveSentences.improvements[1] := 'I highly suggest ' + firstName + ' uses the revision resources available as it will help them greatly.';

  SetLength(HowToImproveSentences.unsatisfactory, 2);
  HowToImproveSentences.unsatisfactory[0] := firstName + ' has been unsatisfactory in how to improve.';
  HowToImproveSentences.unsatisfactory[1] := firstName + ' has been unsatisfactory in how to improve.';

  SetLength(HowToImproveSentences.causeOfConcern, 2);
  HowToImproveSentences.causeOfConcern[0] := firstName + ' has been causeOfConcern in how to improve.';
  HowToImproveSentences.causeOfConcern[1] := firstName + ' has been causeOfConcern in how to improve.';
end;

procedure TfrmReportGeneratorPage.Grades;
  var i : integer;
begin
  for i := 0 to length(workingAtGrades) - 1 do begin
    finalParagraph := finalParagraph + firstName + ' is working at ' + workingAtGrades[i] + ' in ' + subjects[i] + '. ';
    if (workingAtGrades[i] = 'A*') or (workingAtGrades[i] = 'A') then begin
      finalParagraph := finalParagraph + workingAtGrades[i] + ' is a really good grade. ';
    end;
    if (workingAtGrades[i] = 'B') then begin
      finalParagraph := finalParagraph + workingAtGrades[i] + ' is a solid grade. ';
    end;

    if (workingAtGrades[i] = 'C') or (workingAtGrades[i] = 'D') or (workingAtGrades[i] = 'E') then begin
      finalParagraph := finalParagraph + workingAtGrades[i] + ' is a poor grade and ' + heShePronoun + ' should try to improve this. ';
    end
  end;
end;

procedure TfrmReportGeneratorPage.AttendancePunctuality;
begin
  finalParagraph := finalParagraph + 'This year ' + firstName + ' has reached an attendance of ' + IntToStr(attendance) + '%.';
  
  if attendance > averageAttendance then begin
    finalParagraph := finalParagraph + ' The average attendace is currently ' + IntToStr(averageAttendance) + '% so ' + heShePronoun + ' is above average and doing well.';
  end;
  
  if attendance = averageAttendance then begin
    finalParagraph := finalParagraph + ' The average attendace is currently ' + IntToStr(averageAttendance) + '% so ' + heShePronoun + ' has equal attendance which is good.';
  end;

  if attendance < averageAttendance then begin
    finalParagraph := finalParagraph + ' The average attendace is currently ' + IntToStr(averageAttendance) + '% so ' + heShePronoun + ' is below average, this is concerning and ' + heShePronoun + ' needs to make sure ' + heShePronoun + ' turns up more regularly.';
  end;
end;

procedure TfrmReportGeneratorPage.BehaviourAchievementPoints;
begin
  finalParagraph := finalParagraph + firstName + ' currently has ' + IntToStr(achievementPoints) + ' achievement points and ' + IntToStr(behaviourPoints) + ' behaviour points.';

  if achievementPoints > averageAchievementPoints then begin
    finalParagraph := finalParagraph + ' The average amount of achievement points is currently ' + IntToStr(averageAchievementPoints) + ' so I''m happy to report ' + firstName + ' is above average.'
  end;

  if achievementPoints = averageAchievementPoints then begin
    finalParagraph := finalParagraph + ' The average amount of achievement points is currently ' + IntToStr(averageAchievementPoints) + ' so ' + firstName + ' has exactly the average.'
  end;

  if achievementPoints < averageAchievementPoints then begin
    finalParagraph := finalParagraph + ' The average amount of achievement points is currently ' + IntToStr(averageAchievementPoints) + ' which means ' + firstName + ' is below average and should try and improve this.'
  end;

  if behaviourPoints > averageBehaviourPoints then begin
    finalParagraph := finalParagraph + ' Furthermore, the average amount of behaviour points is currently ' + IntToStr(averageBehaviourPoints) + ' so I''m happy to report ' + firstName + ' is above average.'
  end;

  if behaviourPoints = averageBehaviourPoints then begin
    finalParagraph := finalParagraph + ' Furthermore, the average amount of behaviour points is currently ' + IntToStr(averageBehaviourPoints) + ' so ' + firstName + ' has exactly the average.'
  end;

  if behaviourPoints < averageBehaviourPoints then begin
    finalParagraph := finalParagraph + ' Furthermore, the average amount of behaviour points is currently ' + IntToStr(averageBehaviourPoints) + ' which means ' + firstName + ' is below average and should aim to increase this.'
  end;
end;

procedure TfrmReportGeneratorPage.SchoolYear;
var
  year7Sentences : array of string;
  year8Sentences : array of string;
  year9Sentences : array of string;
  year10Sentences : array of string;
  year11Sentences : array of string;
  year12Sentences : array of string;
  year13Sentences : array of string;
begin
  Randomize;
  
  SetLength(year7Sentences, 2);
  year7Sentences[0] := 'Settling into year 7 can be a challenge, the increased level of work and large number of new students can be intimidating. This is why I''m happy to say ' + firstName + ' has settled in extremely well.';
  year7Sentences[1] := 'As this is the first year of secondary school for ' + firstName + ', it can be difficult and there is a lot to get used to. ' + firstName + ' has began the year exceedingly well which is great to see.';

  SetLength(year8Sentences, 2);
  year8Sentences[0] := firstName + ' is of course well into year 8, the level of work remains similar and ' + hisHerPronoun + ' classes remain the same.';
  year8Sentences[1] := 'Year 8 students have a slight increase in the difficult of work so ' + firstName + ' needs to be aware of this. They must also learn to be good role models for the year 7''s.';

  SetLength(year9Sentences, 2);
  year9Sentences[0] := 'It is important to do well at this stage, with GCSE''s beginning next year they should focus in lessons and it will make revising far easier when the real exams come.';
  year9Sentences[1] := 'Being in year 9, ' + heShePronoun + ' needs to be a good role model for the younger years. Also, GCSE''s are starting next year and the work they do now will come in handy later on.';

  SetLength(year10Sentences, 2);
  year10Sentences[0] := 'These two years happen very quickly, if students don''t revise consistently now they will stuggle next year, I suggest ' + firstName + ' revises early to ensure a good GCSE performance.';
  year10Sentences[1] := firstName + ' has now started their GCSE''s, the difficulty in the work increases significantly and many students stuggle. If ' + heShePronoun + ' works hard I''m sure ' + heShePronoun + ' will do very well.';

  SetLength(year11Sentences, 2);
  year11Sentences[0] := 'Year 11 is a stressful year for many students. ' + firstName + ' has to take many subjects and it''s definately challenging, work as hard as you can.';
  year11Sentences[1] := firstName + ' is now doing ' + hisHerPronoun + ' GCSE''s, they can be stressful for many students but if they focus they call all get through with a good result.';

  SetLength(year12Sentences, 2);
  year12Sentences[0] := 'Year 12 is very difficult and the jump from GCSE''s is huge. It is really important ' + firstName + ' works hard this year for A-Levels next year.';
  year12Sentences[1] := firstName + ' has of course started A-Levels now, they are difficult and the work will be frequent so ' + heShePronoun + ' must keep on top of it all.';

  SetLength(year13Sentences, 2);
  year13Sentences[0] := 'As you know ' + firstName + ' is in year 13, this year is shorter and the final exams approach quickly. I hope ' + firstName + ' is revising regularly and going over year 12 content.';
  year13Sentences[1] := firstName + ' has made it to year 13, it is important to start looking beyond at University or Aprentiships but it is also important to focus on the A-Level exams and work hard!';
    
  if yearGroup = '07' then
    finalParagraph := finalParagraph + year7Sentences[Random(Length(year7Sentences))];
  if yearGroup = '08' then
    finalParagraph := finalParagraph + year8Sentences[Random(Length(year8Sentences))];
  if yearGroup = '09' then
    finalParagraph := finalParagraph + year9Sentences[Random(Length(year9Sentences))];
  if yearGroup = '10' then
    finalParagraph := finalParagraph + year10Sentences[Random(Length(year10Sentences))];
  if yearGroup = '11' then
    finalParagraph := finalParagraph + year11Sentences[Random(Length(year11Sentences))];
  if yearGroup = '12' then
    finalParagraph := finalParagraph + year12Sentences[Random(Length(year12Sentences))];
  if yearGroup = '13' then
    finalParagraph := finalParagraph + year13Sentences[Random(Length(year13Sentences))];
end;

procedure TfrmReportGeneratorPage.GenerateReport;
begin
  if (rgWorkCompletion.ItemIndex = -1) or (rgHomeworkCompletion.ItemIndex = -1) or (rgWorkQuality.ItemIndex = -1)
  or (rgHomeworkQuality.ItemIndex = -1) or (rgLessonInvolvement.ItemIndex = -1) or (rgBehaviour.ItemIndex = -1) then begin
    lblErrorMessage.Caption := 'You must fill in each section';
    lblErrorMessage.Visible := true;
    exit;
  end;
  lblErrorMessage.Visible := false;

  finalParagraph := '';
  
  SetAllSentences;

  workCompletion := rgWorkCompletion.ItemIndex + 1;
  workQuality := rgWorkQuality.ItemIndex + 1;
  homeworkCompletion := rgHomeworkCompletion.ItemIndex + 1;
  homeworkQuality := rgHomeworkQuality.ItemIndex + 1;
  behaviour := rgBehaviour.ItemIndex + 1;
  lessonInvolvement := rgLessonInvolvement.ItemIndex + 1;

  overallWeight := (workCompletion + workQuality + homeworkCompletion + homeworkQuality + behaviour + lessonInvolvement) DIV 6;
  
  if chkIncludeIntroduction.Checked then begin
    finalParagraph := finalParagraph + introductionSentences.GetArray(overallWeight);
    finalParagraph := finalParagraph + ' ';
  end;

  finalParagraph := finalParagraph + workQualitySentences.GetArray(workQuality);
  finalParagraph := finalParagraph + ' ';
  finalParagraph := finalParagraph + workCompletionSentences.GetArray(workCompletion);
  finalParagraph := finalParagraph + ' ';
  finalParagraph := finalParagraph + homeworkQualitySentences.GetArray(homeworkQuality);
  finalParagraph := finalParagraph + ' ';
  finalParagraph := finalParagraph + homeworkCompletionSentences.GetArray(homeworkCompletion);
  finalParagraph := finalParagraph + ' ';
  finalParagraph := finalParagraph + behaviourSentences.GetArray(behaviour);
  finalParagraph := finalParagraph + ' ';
  finalParagraph := finalParagraph + lessonInvolvementSentences.GetArray(lessonInvolvement);
  finalParagraph := finalParagraph + ' ';

  if chkMentionGrades.Checked then begin
    if (Length(subjects) > 1) then begin
      Grades;
      finalParagraph := finalParagraph + ' ';
    end;
  end;

  if chkMentionAttendancePunctuality.Checked then begin
    AttendancePunctuality;
    finalParagraph := finalParagraph + ' ';
  end;

  if chkMentionAchievementBehaviour.Checked then begin
    BehaviourAchievementPoints;
    finalParagraph := finalParagraph + ' ';
  end;

  SchoolYear;
  finalParagraph := finalParagraph + ' ';

  finalParagraph := finalParagraph + HowToImproveSentences.GetArray(workQuality);
  finalParagraph := finalParagraph + ' ';

  if chkIncludeConclusion.Checked then begin
    finalParagraph := finalParagraph + conclusionSentences.GetArray(overallWeight);
  end;

  Hide;
  frmFinalParagraphPage.Show;
  frmFinalParagraphPage.redtFinalParagraph.Text := finalParagraph;
end;

procedure TfrmReportGeneratorPage.RegenerateReport;
begin
  GenerateReport;
end;

end.
