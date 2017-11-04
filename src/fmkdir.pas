unit fMkDir;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, Classes, Controls, Forms, StdCtrls, Buttons, ExtCtrls, LCLType, Dialogs, strutils, uDebug;

type

  { TfrmMkDir }

  TfrmMkDir = class(TForm)
    btnCancel: TBitBtn;
    btnOK: TBitBtn;
    cbMkDir: TComboBox;
    lblMakeDir: TLabel;
    mDirList: TMemo;
    pnlButtons: TPanel;
    pnlBottom: TPanel;

    procedure cbMkDirKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
      );
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure mDirListKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
      );
  public
   function ShowMkDir(var sPath:String; var sPathList: TStringList):Boolean;  // 21.05.2009 - перенес в public
  end;

var  frmMkDir: TfrmMkDir;  // 21.05.2009  - создаем из файла проекта

implementation

{$R *.lfm}

procedure TfrmMkDir.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key=#27 then
  begin
    ModalResult:=mrCancel;
    Key := #0;
  end
  //else if Key=#13 then
  //begin
  //  ModalResult:=mrOK;
  //  Key:=#0;
  //end;
end;

procedure TfrmMkDir.mDirListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssCtrl in Shift) and (Key = VK_RETURN) then
  begin
    ModalResult:=mrOK;
    Key:=0;
  end;
end;

procedure TfrmMkDir.cbMkDirKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  i: Integer;
  sText, TextBefore, TextAfter: String;
  CursorPos, wPos, wCount, wPosTemp, wNum, wLen, sTextLen, DeletedChars: Integer;
begin
   if (ssCtrl in Shift) and (Key = VK_BACK) then
   begin
     sText := cbMkDir.Text;
     CursorPos := cbMkDir.SelStart + cbMkDir.SelLength + 1;
     sTextLen := Length(sText);
     
     wPos := 0;
     wCount := WordCount(sText, StdWordDelims);
     
     if wCount > 0 then
     begin
       for i := 1 to wCount do
       begin
         wPosTemp := WordPosition(i, sText, StdWordDelims);
         if wPosTemp >= CursorPos then break;
         wPos := wPosTemp;
       end;
     end;
     
     TextBefore := Copy(sText, 1, wPos-1);
     TextAfter := Copy(sText, CursorPos, sTextLen);
     sText := TextBefore + TextAfter;

     cbMkDir.Text := sText;
     cbMkDir.SelStart := wPos-1;

     Key := 0;
   end;
end;

Function TfrmMkDir.ShowMkDir(var sPath:String; var sPathList: TStringList):Boolean;
var Index, i: Integer;
    dirListItem: String;
const
  MAX_LINES = 20;
begin
  ActiveControl := cbMkDir;
  if (sPath <> '..') then
    cbMkDir.Text := sPath
  else
    cbMkDir.Text := '';
  cbMkDir.SelectAll;
  Result := (ShowModal = mrOK);
  sPath := cbMkDir.Text;

  if mDirList.Lines.Count = 0 then
  begin
    sPathList.Add(sPath);
  end
  else
  begin
    for i:=0 to mDirList.Lines.Count-1 do
    begin
      dirListItem := mDirList.Lines[i].Trim;
      if Length(dirListItem) <> 0 then
        sPathList.Add(dirListItem);
    end;
  end;

  If Result then
   begin
     Index := cbMkDir.Items.IndexOf(cbMkDir.Text);
     if (Index = -1) then
       cbMkDir.Items.Insert(0, cbMkDir.Text)
     else
       cbMkDir.Items.Move(Index, 0);

     if (cbMkDir.Items.Count > MAX_LINES) then
       cbMkDir.Items.Delete(cbMkDir.Items.Count - 1);
   end;
end;

end.
