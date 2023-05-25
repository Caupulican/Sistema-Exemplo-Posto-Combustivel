unit DFP.Model.Utils.RTTI;

interface

uses
  System.RTTI,
  System.TypInfo,
  System.Classes,
  System.SysUtils,
  Data.DB, System.Variants, System.Generics.Collections;

type
  TCustomBase = class(TCustomAttribute)
  private
    FName: string;
  public
    constructor Create(const aName: string);
    property Name: string read FName;
  end;

  TableMap = class(TCustomBase);
  ColumnMap = class(TCustomBase);
  PrimaryKey = class(TCustomBase);

  TSQLGenerator = class
  public
    class function GenerateInsertSQL(aEntity: TObject): string;
    class function GenerateUpdateSQL(aEntity: TObject): string;
    class function GenerateDeleteSQL(aEntity: TObject): string;
    class function GenerateSelectSQL(aEntity: TObject): string;
    class function RetrievePrimaryKeyField(aEntity: TObject): string;
    class procedure MapObjectFromQuery<T: class, constructor>(Query: TDataSet; Obj: T);
  end;

implementation

{ TColumnMap }

constructor TCustomBase.Create(const aName: string);
begin
  FName := aName;
end;

class function TSQLGenerator.GenerateInsertSQL(aEntity: TObject): string;
var
  RttiContext: TRttiContext;
  RttiType: TRttiType;
  RttiField: TRttiField;
  Attribute: TCustomAttribute;
  TableName: string;
  ColumnList: TStringList;
  ColumnListValue : TStringList;
  Dictionary : TDictionary<string,variant>;
  ColumnName: string;
  ColumnValue: string;
  FieldNames: string;
  FieldValues: string;
begin
  RttiContext := TRttiContext.Create;
  try
    RttiType := RttiContext.GetType(aEntity.ClassType);

    for Attribute in RttiType.GetAttributes do
    begin
      if Attribute is TableMap then
      begin
        TableName := TableMap(Attribute).Name;
        Break;
      end;
    end;

    ColumnList := TStringList.Create;
    ColumnListValue := TStringList.Create;
    try
      for RttiField in RttiType.GetFields do
      begin
        for Attribute in RttiField.GetAttributes do
        begin
          if Attribute is PrimaryKey then
            Continue;
          if Attribute is ColumnMap then
          begin
            ColumnName := ColumnMap(Attribute).Name;


            ColumnValue := '';
            case RttiField.FieldType.TypeKind of
              tkString, tkUString, tkWString, tkLString:
                ColumnValue := QuotedStr(RttiField.GetValue(aEntity).ToString);
              tkInteger, tkInt64, tkEnumeration:
                ColumnValue := RttiField.GetValue(aEntity).ToString;
              tkFloat:
              begin
                if RttiField.FieldType.QualifiedName = 'System.TDate' then
                  ColumnValue := QuotedStr(FormatDateTime('dd.mm.yyyy', RttiField.GetValue(aEntity).AsExtended))
                else
                  ColumnValue := StringReplace(RttiField.GetValue(aEntity).ToString, ',', '.', []);
              end;
            end;
            ColumnList.Add(ColumnName);
            ColumnListValue.Add(ColumnValue);
            Break;
          end;
        end;
      end;

      FieldNames := ColumnList.CommaText;
      FieldValues := ColumnListValue.CommaText; // Placeholder for values

     Result := Format('INSERT INTO %s (%s) VALUES (%s)', [TableName,FieldNames, StringReplace(FieldValues, '"', '', [rfReplaceAll])]);
    finally
      ColumnList.Free;
      ColumnListValue.Free;
    end;
  finally
    RttiContext.Free;
  end;
end;

class function TSQLGenerator.GenerateUpdateSQL(aEntity: TObject): string;
var
  RttiContext: TRttiContext;
  RttiType: TRttiType;
  RttiField: TRttiField;
  Attribute: TCustomAttribute;
  TableName,PrimaryKeyField,PrimaryKeyValue,ColumnName,ColumnValue,FieldNames,FieldValues,UpdateFields: string;
  ColumnList: TStringList;
  ColumnListValue : TStringList;
  i : integer;
begin
  RttiContext := TRttiContext.Create;
  try
    RttiType := RttiContext.GetType(aEntity.ClassType);

    for Attribute in RttiType.GetAttributes do
    begin
      if Attribute is TableMap then
      begin
        TableName := TableMap(Attribute).Name;
        Break;
      end;
    end;

    ColumnList := TStringList.Create;
    ColumnListValue := TStringList.Create;
    try
      for RttiField in RttiType.GetFields do
      begin
        for Attribute in RttiField.GetAttributes do
        begin
          if Attribute is PrimaryKey then
          begin
            PrimaryKeyField := PrimaryKey(Attribute).Name+'='+RttiField.GetValue(aEntity).ToString;
            Continue;
          end;
          if Attribute is ColumnMap then
          begin
            ColumnName := ColumnMap(Attribute).Name;
            ColumnValue := '';
            case RttiField.FieldType.TypeKind of
              tkString, tkUString, tkWString, tkLString:
                ColumnValue := QuotedStr(RttiField.GetValue(aEntity).ToString);
              tkInteger, tkInt64, tkEnumeration:
                ColumnValue := RttiField.GetValue(aEntity).ToString;
              tkFloat:
              begin
                if RttiField.FieldType.QualifiedName = 'System.TDate' then
                  ColumnValue := QuotedStr(FormatDateTime('dd.mm.yyyy', RttiField.GetValue(aEntity).AsExtended))
                else
                  ColumnValue := StringReplace(RttiField.GetValue(aEntity).ToString, ',', '.', []);
              end;
            end;
            ColumnList.Add(ColumnName);
            ColumnListValue.Add(ColumnValue);
            Break;
          end;
        end;
      end;

      for I := 0 to Pred(ColumnList.Count) do
      begin
        if i<Pred(ColumnList.Count) then
          UpdateFields := UpdateFields + ColumnList[i]+'='+ColumnListValue[i]+','
        else
          UpdateFields := UpdateFields + ColumnList[i]+'='+ColumnListValue[i];
      end;
     Result := Format('UPDATE %s SET %s WHERE %s', [TableName,UpdateFields,PrimaryKeyField]);
    finally
      ColumnList.Free;
      ColumnListValue.Free;
    end;
  finally
    RttiContext.Free;
  end;
end;

class procedure TSQLGenerator.MapObjectFromQuery<T>(Query: TDataSet; Obj: T);
var
  Ctx: TRttiContext;
  RttiType: TRttiType;
  Field: TRttiField;
  Attribute: TCustomAttribute;
  FieldName: string;
  Value: TValue;
  FieldValue: Variant;
begin

  Ctx := TRttiContext.Create;
  try
    RttiType := Ctx.GetType(TypeInfo(T));

    for Field in RttiType.GetFields do
    begin
      FieldName := '';
      for Attribute in Field.GetAttributes do
      begin
        if Attribute is PrimaryKey then
        begin
          FieldName := PrimaryKey(Attribute).Name;
          break;
        end;
        if Attribute is ColumnMap then
        begin
          FieldName := ColumnMap(Attribute).Name;
          break;
        end;
      end;

      if FieldName = '' then
        Continue;

      FieldValue := Query.FieldByName(FieldName).Value;

      if VarIsNull(FieldValue) then
        Value := TValue.Empty
      else
      begin
        try
          case Field.FieldType.TypeKind of
            tkUnknown, tkInteger, tkChar, tkEnumeration, tkWChar, tkLString,
            tkWString, tkString, tkInt64:
              Value := TValue.FromVariant(FieldValue);

            tkFloat:
              begin
                if Field.FieldType.Handle = TypeInfo(Single) then
                  Value := TValue.From<Single>(FieldValue)
                else if Field.FieldType.Handle = TypeInfo(Double) then
                  Value := TValue.From<Double>(FieldValue)
                else if Field.FieldType.Handle = TypeInfo(Extended) then
                  Value := TValue.From<Extended>(FieldValue)
                else if Field.FieldType.Handle = TypeInfo(Currency) then
                  Value := TValue.From<Currency>(FieldValue)
                else if Field.FieldType.Handle = TypeInfo(TDate) then
                  Value := TValue.From<TDate>(FieldValue);
              end;

            tkClass, tkClassRef, tkPointer, tkProcedure, tkInterface,
            tkMethod, tkVariant, tkArray, tkRecord, tkDynArray:
              Value := TValue.FromVariant(FieldValue);

            tkUString:
              Value := TValue.From<UnicodeString>(FieldValue);
          end;
        except
          Value := TValue.Empty;
        end;
      end;

      Field.SetValue(TObject(Obj), Value);
    end;
  finally
    Ctx.Free;
  end;
end;

class function TSQLGenerator.RetrievePrimaryKeyField(aEntity: TObject): string;
var
  RttiContext: TRttiContext;
  RttiType: TRttiType;
  RttiProperty: TRttiProperty;
  Attribute: TCustomAttribute;
  LPrimaryKey: string;
begin
  RttiContext := TRttiContext.Create;
  try
    RttiType := RttiContext.GetType(aEntity.ClassType);

    for RttiProperty in RttiType.GetProperties do
    begin
      for Attribute in RttiProperty.GetAttributes do
      begin
        if Attribute is PrimaryKey then
        begin
          LPrimaryKey := Format('%s =', [PrimaryKey(Attribute).Name]);
          Break;
        end;
      end;
    end;

    Result := LPrimaryKey;
  finally
    RttiContext.Free;
  end;
end;

class function TSQLGenerator.GenerateDeleteSQL(aEntity: TObject): string;
var
  RttiContext: TRttiContext;
  RttiType: TRttiType;
  RttiProperty: TRttiProperty;
  PrimaryKeyField: TRttiField;
  Attribute: TCustomAttribute;
  TableName: string;
  PrimaryKeyName: string;
  PrimaryKeyValue: TValue;
begin
  RttiContext := TRttiContext.Create;
  try
    RttiType := RttiContext.GetType(aEntity.ClassType);

    for Attribute in RttiType.GetAttributes do
    begin
      if Attribute is TableMap then
      begin
        TableName := TableMap(Attribute).Name;
        Break;
      end;
    end;

    for RttiProperty in RttiType.GetProperties do
    begin
      for PrimaryKeyField in RttiType.GetFields do
      begin
        for Attribute in PrimaryKeyField.GetAttributes do
        begin
          if Attribute is PrimaryKey then
          begin
            PrimaryKeyName := PrimaryKey(Attribute).Name;
            PrimaryKeyValue := PrimaryKeyField.GetValue(aEntity);
            Break;
          end;
        end;
      end;
    end;

    Result := Format('DELETE FROM %s WHERE %s = %s', [TableName, PrimaryKeyName, PrimaryKeyValue.ToString]);
  finally
    RttiContext.Free;
  end;
end;

class function TSQLGenerator.GenerateSelectSQL(aEntity: TObject): string;
var
  RttiContext: TRttiContext;
  RttiType: TRttiType;
  Attribute: TCustomAttribute;
  TableName: string;
begin
  RttiContext := TRttiContext.Create;
  try
    RttiType := RttiContext.GetType(aEntity.ClassType);

    for Attribute in RttiType.GetAttributes do
    begin
      if Attribute is TableMap then
      begin
        TableName := TableMap(Attribute).Name;
        Break;
      end;
    end;

    Result := Format('SELECT * FROM %s', [TableName]);
  finally
    RttiContext.Free;
  end;
end;

end.
