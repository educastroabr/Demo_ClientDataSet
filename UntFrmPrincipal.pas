unit UntFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.Phys.SQLiteDef, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, FireDAC.Comp.DataSet,
  Datasnap.Provider, Datasnap.DBClient;

type
  TFrmPrincipal = class(TForm)
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    FDQuery1: TFDQuery;
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    Memo1: TMemo;
    DBGrid1: TDBGrid;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDConnection1: TFDConnection;
    procedure ClientDataSet1CalcFields(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
    procedure DataGetText(Sender: TField; var Text: string; DisplayText: Boolean);
  private

  public
    destructor Destroy; override;
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

procedure TFrmPrincipal.BitBtn1Click(Sender: TObject);
const
  cSQL = 'SELECT * ' + #13 +
         '  FROM DEMO ' + #13 +
         ' WHERE 1 = 1 ';
var
  nIndex : Integer;
  FTeste : TStringField;
begin
  try
    ClientDataSet1.Close;
    for nIndex := ClientDataSet1.Fields.Count - 1 downto 0 do
      ClientDataSet1.Fields[nIndex].Free;
    FDQuery1.SQL.Clear;
    FDQuery1.SQL.Add(cSQL);
    FDQuery1.SQL.Add(' AND 1 = 2 ');
    FDQuery1.Open;
    for nIndex := 0 to FDQuery1.Fields.Count - 1 do
    begin
      case FDQuery1.Fields[nIndex].DataType of
        ftDate :
          begin
            with TDateField.Create(ClientDataSet1) do
            begin
              FieldName     := FDQuery1.Fields[nIndex].FieldName;
              FieldKind     := FDQuery1.Fields[nIndex].FieldKind;
              DisplayWidth  := TDateField(FDQuery1.Fields[nIndex]).DisplayWidth;
              Alignment     := taCenter;
              OnGetText     := DataGetText;
              DataSet       := ClientDataSet1;
            end;
          end;
        ftDateTime,
        ftTimeStamp :
          begin
            with TDateField.Create(ClientDataSet1) do
            begin
              FieldName     := FDQuery1.Fields[nIndex].FieldName;
              FieldKind     := FDQuery1.Fields[nIndex].FieldKind;
              DisplayLabel  := FDQuery1.Fields[nIndex].DisplayLabel;
              DisplayWidth  := TDateTimeField(FDQuery1.Fields[nIndex]).DisplayWidth;
              Alignment     := TDateTimeField(FDQuery1.Fields[nIndex]).Alignment;
              AutoGenerateValue := TDateTimeField(FDQuery1.Fields[nIndex]).AutoGenerateValue;
              OnGetText     := DataGetText;
              DataSet       := ClientDataSet1;
            end;
          end;
        ftAutoInc :
          begin
            with TAutoIncField.Create(ClientDataSet1) do
            begin
              FieldName     := FDQuery1.Fields[nIndex].FieldName;
              FieldKind     := FDQuery1.Fields[nIndex].FieldKind;
              Alignment     := FDQuery1.Fields[nIndex].Alignment;
              DisplayFormat := ',0';
              DataSet       := ClientDataSet1;
            end;
          end;
        ftInteger :
          begin
            with TIntegerField.Create(ClientDataSet1) do
            begin
              FieldName     := FDQuery1.Fields[nIndex].FieldName;
              FieldKind     := FDQuery1.Fields[nIndex].FieldKind;
              Alignment     := FDQuery1.Fields[nIndex].Alignment;
              DisplayFormat := ',0';
              DataSet       := ClientDataSet1;
            end;
          end;
        ftLargeint :
          begin
            with TLargeintField.Create(ClientDataSet1) do
            begin
              FieldName     := FDQuery1.Fields[nIndex].FieldName;
              FieldKind     := FDQuery1.Fields[nIndex].FieldKind;
              Alignment     := FDQuery1.Fields[nIndex].Alignment;
              DataSet       := ClientDataSet1;
              DisplayFormat := ',0';
            end;
          end;
        ftFloat :
          begin
            with TFloatField.Create(ClientDataSet1) do
            begin
              FieldName     := FDQuery1.Fields[nIndex].FieldName;
              FieldKind     := FDQuery1.Fields[nIndex].FieldKind;
              Alignment     := FDQuery1.Fields[nIndex].Alignment;
              Precision     := TFloatField(FDQuery1.Fields[nIndex]).Precision;
              Size          := TFloatField(FDQuery1.Fields[nIndex]).Size;
              DisplayWidth  := TFloatField(FDQuery1.Fields[nIndex]).DisplayWidth;
              DisplayFormat := ',0.00';
              DataSet       := ClientDataSet1;
            end;
          end;
        ftBCD :
          begin
            with TBCDField.Create(ClientDataSet1) do
            begin
              FieldName     := FDQuery1.Fields[nIndex].FieldName;
              FieldKind     := FDQuery1.Fields[nIndex].FieldKind;
              Alignment     := FDQuery1.Fields[nIndex].Alignment;
              Precision     := TBCDField(FDQuery1.Fields[nIndex]).Precision;
              Size          := TBCDField(FDQuery1.Fields[nIndex]).Size;
              DisplayWidth  := TBCDField(FDQuery1.Fields[nIndex]).DisplayWidth;
              DisplayFormat := ',0.00';
              DataSet       := ClientDataSet1;
            end;
          end;
        ftSingle :
          begin
            with TSingleField.Create(ClientDataSet1) do
            begin
              FieldName     := FDQuery1.Fields[nIndex].FieldName;
              FieldKind     := FDQuery1.Fields[nIndex].FieldKind;
              Alignment     := FDQuery1.Fields[nIndex].Alignment;
              Precision     := TSingleField(FDQuery1.Fields[nIndex]).Precision;
              DisplayWidth  := TSingleField(FDQuery1.Fields[nIndex]).DisplayWidth;
              DisplayFormat := ',0.00';
              DataSet       := ClientDataSet1;
            end;
          end;
        ftString :
          begin
            with TStringField.Create(ClientDataSet1) do
            begin
              FieldName    := FDQuery1.Fields[nIndex].FieldName;
              FieldKind    := FDQuery1.Fields[nIndex].FieldKind;
              Alignment    := FDQuery1.Fields[nIndex].Alignment;
              Size         := FDQuery1.Fields[nIndex].Size;
              DisplayWidth := FDQuery1.Fields[nIndex].DisplayWidth;
              DataSet      := ClientDataSet1;
            end;
          end;
      end;
    end;
    FTeste := TStringField.Create(ClientDataSet1);
    FTeste.FieldName    := 'Teste';
    FTeste.FieldKind    := fkCalculated;
    FTeste.Alignment    := taLeftJustify;
    FTeste.Size         := 10;
    FTeste.DisplayWidth := 10;
    FTeste.DataSet      := ClientDataSet1;
    //*)
    FDQuery1.Close;
    FDQuery1.SQL.Clear;
    FDQuery1.SQL.Add(cSQL);
    ClientDataSet1.Open;

    Memo1.Lines.Clear;
    Memo1.Lines.Add('Fields = ' + ClientDataSet1.Fields.Count.ToString);
    for nIndex := 0 to ClientDataSet1.Fields.Count - 1 do
      Memo1.Lines.Add('  ' + ClientDataSet1.Fields[nIndex].FieldName);

    Memo1.Lines.Add('');
    Memo1.Lines.Add('FieldDefs = ' + ClientDataSet1.FieldDefs.Count.ToString);
    for nIndex := 0 to ClientDataSet1.FieldDefs.Count - 1 do
      Memo1.Lines.Add('  ' + ClientDataSet1.FieldDefs[nIndex].Name);
  except
    on E : Exception do
      ShowMessage(E.Message)
  end;
end;

procedure TFrmPrincipal.ClientDataSet1CalcFields(DataSet: TDataSet);
begin
  ClientDataSet1.FieldByName('Teste').AsString := 'XPTO';
end;

procedure TFrmPrincipal.DataGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if (Sender.AsDateTime) <= EncodeDate(1900, 1, 1) then
    Text := EmptyStr
  else
    Text := Sender.AsString;
end;

destructor TFrmPrincipal.Destroy;
var
  nIndex: Integer;
begin
  for nIndex := ClientDataSet1.Fields.Count - 1 downto 0 do
    ClientDataSet1.Fields[nIndex].Free;
  inherited;
end;

end.
