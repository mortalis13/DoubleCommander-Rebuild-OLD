unit uAdbFileSource;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,
  uFile,
  uMultiListFileSource,
  uFileSourceOperation,
  uFileSourceProperty;

type

  IAdbFileSource = interface(IMultiListFileSource)
    ['{5076D4C2-3AB8-4029-9318-0AF115F7FDDD}']
  end;

  {en
     File source for search results.
  }

  { TAdbFileSource }

  TAdbFileSource = class(TMultiListFileSource, IAdbFileSource)
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

function TAdbFileSource.GetRootDir(sPath: String): String;
begin
  Result:=  PathDelim + PathDelim + PathDelim + 'ADB' + PathDelim;
end;

function TAdbFileSource.GetProperties: TFileSourceProperties;
begin
  Result := inherited GetProperties + [fspLinksToLocalFiles];
end;

function TAdbFileSource.SetCurrentWorkingDirectory(NewDir: String): Boolean;
begin
  // Only Root dir allowed (for flat mode).
  Result := IsPathAtRoot(NewDir);
end;

class function TAdbFileSource.CreateFile(const APath: String): TFile;
begin
  Result:= TFileSystemFileSource.CreateFile(APath);
end;

function TAdbFileSource.CreateListOperation(TargetPath: String): TFileSourceOperation;
begin
  Result := TSearchResultListOperation.Create(Self, TargetPath);
end;

function TAdbFileSource.GetLocalName(var aFile: TFile): Boolean;
begin
  if (fspLinksToLocalFiles in FileSource.Properties) then
    Result:= FileSource.GetLocalName(aFile)
  else
    Result:= True;
end;

end.
