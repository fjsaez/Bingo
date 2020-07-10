object DMod: TDMod
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 197
  Width = 284
  object AbsDB: TABSDatabase
    CurrentVersion = '7.80 '
    DatabaseFileName = 'MiBingo.ABS'
    DatabaseName = 'DB'
    Exclusive = False
    MaxConnections = 500
    MultiUser = False
    SessionName = 'Default'
    Left = 72
    Top = 24
  end
  object Query: TABSQuery
    CurrentVersion = '7.80 '
    DatabaseName = 'DB'
    InMemory = False
    ReadOnly = False
    Left = 152
    Top = 24
  end
end
