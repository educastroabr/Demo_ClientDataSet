object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Demo'
  ClientHeight = 475
  ClientWidth = 682
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 682
    Height = 153
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 830
    object Label1: TLabel
      Left = 800
      Top = 120
      Width = 27
      Height = 13
      Caption = 'Teste'
    end
    object BitBtn1: TBitBtn
      Left = 24
      Top = 17
      Width = 75
      Height = 25
      Caption = 'BitBtn1'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object Memo1: TMemo
      Left = 232
      Top = 1
      Width = 449
      Height = 151
      Align = alRight
      TabOrder = 1
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 153
    Width = 682
    Height = 322
    Align = alClient
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 24
    Top = 64
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    DisableStringTrim = True
    FieldDefs = <
      item
        Name = 'FUN_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'FUN_PESSOA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'PES_APELIDO'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 80
      end
      item
        Name = 'FUN_CARGO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CRG_DESCRICAO'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 100
      end
      item
        Name = 'FUN_DEPARTAMENTO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DPR_DESCRICAO'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 100
      end
      item
        Name = 'FUN_DT_INI'
        Attributes = [faRequired]
        DataType = ftDate
      end
      item
        Name = 'FUN_DT_FIM'
        DataType = ftDate
      end
      item
        Name = 'FUN_COMISSAO'
        Attributes = [faReadonly]
        DataType = ftLargeint
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    StoreDefs = True
    OnCalcFields = ClientDataSet1CalcFields
    Left = 112
    Top = 64
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = FDQuery1
    Left = 224
    Top = 64
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM DEMO')
    Left = 328
    Top = 64
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 552
    Top = 72
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=D:\Projetos\Teste\ClientDataSet\BD\demo.db'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 416
    Top = 64
  end
end
