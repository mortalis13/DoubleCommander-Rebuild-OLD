unit fStatistics;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, uDebug;

type

  { TfrmStatistics }

  TfrmStatistics = class(TForm)
    btnCopy: TButton;
    btnClose: TButton;
    lblStatistics: TLabel;
    Panel1: TPanel;
    procedure btnCloseClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: char);
  private

  public
    procedure ShowForm;
  end;

var
  frmStatistics: TfrmStatistics;

implementation

{$R *.lfm}

uses uClipboard;


procedure TfrmStatistics.FormKeyPress(Sender: TObject; var Key: char);
begin
  inherited;

  if Key=#27 then
  begin
   Close;
   Key := #0;
  end;
end;

procedure TfrmStatistics.btnCopyClick(Sender: TObject);
var StatText: String;
begin
  StatText := lblStatistics.Caption;
  ClipboardSetText(StatText);
end;

procedure TfrmStatistics.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmStatistics.ShowForm;
begin
  Show;
end;

end.
