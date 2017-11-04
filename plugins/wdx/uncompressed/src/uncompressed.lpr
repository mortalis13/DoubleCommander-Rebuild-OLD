library uncompressed;

{$mode objfpc}{$H+}
{$include calling.inc}

uses
  FPCAdds, SysUtils, Classes, LazUTF8, WdxPlugin, DCOSUtils, Process, RegExpr;

const
  DETECT_STRING: String = '(EXT="ZIP")';

const
  FIELD_COUNT = 1;

  FIELD_NAME: array[0..Pred(FIELD_COUNT)] of String = (
    'Uncomp Size'
  );

  FIELD_TYPE: array[0..Pred(FIELD_COUNT)] of Integer = (
    ft_stringw
  );

  FIELD_UNIT: array[0..Pred(FIELD_COUNT)] of String = ('');

var
  // DataAudio: TAudioData;
  CurrentFileName: String;

function ContentGetSupportedField(FieldIndex: Integer;
  FieldName, Units: PAnsiChar; MaxLen: Integer): Integer; dcpcall;
begin
  if (FieldIndex < 0) or (FieldIndex >= FIELD_COUNT) then
  begin
    Result := FT_NOMOREFIELDS;
    Exit;
  end;

  Result := FIELD_TYPE[FieldIndex];
  StrPLCopy(Units, FIELD_UNIT[FieldIndex], MaxLen - 1);
  StrPLCopy(FieldName, FIELD_NAME[FieldIndex], MaxLen - 1);
end;

function ContentGetValue(FileName: PAnsiChar; FieldIndex, UnitIndex: Integer;
  FieldValue: PByte; MaxLen, Flags: Integer): Integer; dcpcall;
begin
  Result:= ft_nosuchfield;
end;

function ContentGetValueW(FileName: PWideChar; FieldIndex, UnitIndex: Integer;
  FieldValue: PByte; MaxLen, Flags: Integer): Integer; dcpcall;
var
  Value: String;
  FileNameU: String;
  FullText: UnicodeString;
  ValueI: PInteger absolute FieldValue;
  Time: ptimeformat absolute FieldValue;
  
  cmd, UncompSize, output: string;
  ilen: integer;
  rePatSplitSpace: string;
  re: TRegExpr;
  
  itemsList: TStringArray;
  itemParts: TStringList;
  item, itemPart: string;
begin
  if (FieldIndex < 0) or (FieldIndex >= FIELD_COUNT) then
  begin
    Result:= ft_nosuchfield;
    Exit;
  end;

  FileNameU:= UTF16ToUTF8(UnicodeString(FileName));

  if not mbFileExists(FileNameU) then
  begin
    Result:= ft_fileerror;
    Exit;
  end;

  if CurrentFileName <> FileNameU then
  try
    CurrentFileName:= FileNameU;
    
    UncompSize := '';
    
    cmd := '7z l ' + CurrentFileName;
    RunCommand(cmd, output);
    
    if Length(output) > 0 then
    begin
      itemsList := output.split([#13#10]);
      ilen := length(itemsList);
      
      if ilen > 0 then
      begin
        item := itemsList[ilen-1].trim;
        itemParts := TStringList.Create;
        
        rePatSplitSpace := '([^ ]+)';
        re := TRegExpr.Create(rePatSplitSpace);
        if re.Exec(item) then
        begin
          itemParts.Add(re.Match[1]);
          while re.ExecNext do
          begin
            itemParts.Add(re.Match[1]);
          end;
        end;
      end;
      
      UncompSize := itemParts[2];
    end;
    
  except
    Exit(ft_fileerror);
  end;

  Result:= FIELD_TYPE[FieldIndex];
  
  Value := UncompSize;
  
  case Result of
    ft_string,
    ft_stringw,
    ft_multiplechoice:
      begin
        if Length(Value) = 0 then
          Result:= ft_fieldempty
        else begin
          if Result <> ft_stringw then
            StrPLCopy(PAnsiChar(FieldValue), Value, MaxLen - 1)
          else begin
            MaxLen:= MaxLen div SizeOf(WideChar) - 1;
            StrPLCopy(PWideChar(FieldValue), UTF8ToUTF16(Value), MaxLen);
          end;
        end;
      end;
    ft_numeric_32:
      if ValueI^ = 0 then Result:= ft_fieldempty;
  end;
end;

procedure ContentSetDefaultParams(dps: PContentDefaultParamStruct); dcpcall;
begin
end;

procedure ContentPluginUnloading; dcpcall;
begin
end;

procedure ContentGetDetectString(DetectString: PAnsiChar; MaxLen: Integer); dcpcall;
begin
  StrPLCopy(DetectString, DETECT_STRING, MaxLen - 1);
end;

exports
  ContentGetSupportedField,
  ContentGetValue,
  ContentGetValueW,
  ContentGetDetectString,
  ContentSetDefaultParams,
  ContentPluginUnloading;

begin

end.
