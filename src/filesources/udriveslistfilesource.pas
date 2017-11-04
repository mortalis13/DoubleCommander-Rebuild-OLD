unit uDrivesListFileSource;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,
  uFile,
  uMultiListFileSource,
  uFileSourceOperation,
  uFileSourceProperty;

type

  IDrivesListFileSource = interface(IMultiListFileSource)
    ['{5076D4C2-3AB8-4029-9318-0AF115F7FDDD}']
  end;

  {en
     File source for search results.
  }

  { TDrivesListFileSource }

  TDrivesListFileSource = class(TMultiListFileSource, IDrivesListFileSource)
  public

    function GetRootDir(sPath : String): String; override;
    function GetProperties: TFileSourceProperties; override;
    function SetCurrentWorkingDirectory(NewDir: String): Boolean; override;

    class function CreateFile(const APath: String): TFile; override;

    function CreateListOperation(TargetPath: String): TFileSourceOperation; override;

    function GetLocalName(var aFile: TFile): Boolean; override;
  end;

implementation

uses
  uFileSystemFileSource, uSearchResultListOperation, uLng;

function TDrivesListFileSource.GetRootDir(sPath: String): String;
begin
  // Result:=  PathDelim + PathDelim + PathDelim + rsSearchResult + PathDelim;
  Result:=  PathDelim + PathDelim + PathDelim + 'Drives' + PathDelim;
end;

function TDrivesListFileSource.GetProperties: TFileSourceProperties;
begin
  Result := inherited GetProperties + [fspLinksToLocalFiles];
end;

function TDrivesListFileSource.SetCurrentWorkingDirectory(NewDir: String): Boolean;
begin
  // Only Root dir allowed (for flat mode).
  Result := IsPathAtRoot(NewDir);
end;

class function TDrivesListFileSource.CreateFile(const APath: String): TFile;
begin
  Result:= TFileSystemFileSource.CreateFile(APath);
end;

function TDrivesListFileSource.CreateListOperation(TargetPath: String): TFileSourceOperation;
begin
  Result := TSearchResultListOperation.Create(Self, TargetPath);
end;

function TDrivesListFileSource.GetLocalName(var aFile: TFile): Boolean;
begin
  if (fspLinksToLocalFiles in FileSource.Properties) then
    Result:= FileSource.GetLocalName(aFile)
  else
    Result:= True;
end;

end.
