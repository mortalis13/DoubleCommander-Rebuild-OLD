{
   Double Commander
   -------------------------------------------------------------------------
   Auto-refresh options page

   Copyright (C) 2006-2016 Alexander Koblov (alexx2000@mail.ru)

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License along
   with this program; if not, write to the Free Software Foundation, Inc.,
   51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
}

unit fOptionsExtended;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  fOptionsFrame, fMain;

type

  { TfrmOptionsExtended }

  TfrmOptionsExtended = class(TOptionsEditor)
    cbFreeSorting: TCheckBox;
    cbAliasCommands: TCheckBox;
  protected
    procedure Load; override;
    function Save: TOptionsEditorSaveFlags; override;
  public
    class function GetIconIndex: Integer; override;
    class function GetTitle: String; override;
  end;

implementation

{$R *.lfm}

uses
  uGlobs, uLng;

{ TfrmOptionsExtended }


class function TfrmOptionsExtended.GetIconIndex: Integer;
begin
  Result := 14;
end;

class function TfrmOptionsExtended.GetTitle: String;
begin
  Result := 'Extended';
end;

procedure TfrmOptionsExtended.Load;
begin
  cbFreeSorting.Checked:= gFreeSorting;
  cbAliasCommands.Checked:= gUseAliasCommands;
end;

function TfrmOptionsExtended.Save: TOptionsEditorSaveFlags;
begin
  Result := [];
  
  gFreeSorting := cbFreeSorting.Checked;
  gUseAliasCommands := cbAliasCommands.Checked;
  frmMain.actToggleFreeSorting.Checked := uGlobs.gFreeSorting;
  frmMain.actToggleAliasMode.Checked := uGlobs.gUseAliasCommands;
end;

end.

