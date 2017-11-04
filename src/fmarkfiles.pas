unit fMarkFiles;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Buttons;

type

  { TfrmMarkFiles }

  TfrmMarkFiles = class(TForm)
    btnCancel: TBitBtn;
    btnOK: TBitBtn;
    cbFilesCount: TEdit;
    lblFilesCount: TLabel;
    pnlBottom: TPanel;
    pnlButtons: TPanel;
    
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private

  public
    function ShowForm(var sCount:String):Boolean;
  end;

var frmMarkFiles: TfrmMarkFiles;

implementation

{$R *.lfm}

{ TfrmMarkFiles }

procedure TfrmMarkFiles.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key=#27 then
  begin
    ModalResult:=mrCancel;
    Key := #0;
  end
  else if Key=#13 then
  begin
    ModalResult:=mrOK;
    Key:=#0;
  end;
end;

function TfrmMarkFiles.ShowForm(var sCount:String):Boolean; var Index: Integer;
begin
  ActiveControl := cbFilesCount;
  if (sCount <> '') then
    cbFilesCount.Text := sCount
  else
    cbFilesCount.Text := '';

  cbFilesCount.SelectAll;
  Result := (ShowModal = mrOK);
  sCount := cbFilesCount.Text;
end;

end.
