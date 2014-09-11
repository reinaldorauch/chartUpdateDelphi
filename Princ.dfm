object FmPrinc: TFmPrinc
  Left = 0
  Top = 0
  Caption = 'UpdateChart'
  ClientHeight = 365
  ClientWidth = 762
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ChUpdate: TChart
    Left = 8
    Top = 8
    Width = 553
    Height = 349
    Title.Font.Color = clBlack
    Title.Text.Strings = (
      'Random values')
    View3D = False
    TabOrder = 0
    ColorPaletteIndex = 13
    object Series1: TAreaSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Visible = False
      Title = 'Random'
      AreaChartBrush.Color = clGray
      AreaChartBrush.BackColor = clDefault
      DrawArea = True
      Pointer.Brush.Gradient.EndColor = 10708548
      Pointer.Gradient.EndColor = 10708548
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      Data = {0000000000}
    end
  end
  object EdMax: TEdit
    Left = 576
    Top = 24
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 1
    Text = '10'
  end
  object UpDown: TUpDown
    Left = 697
    Top = 24
    Width = 15
    Height = 21
    Associate = EdMax
    Min = 1
    Position = 10
    TabOrder = 2
  end
  object Button1: TButton
    Left = 616
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 3
  end
  object Timer: TTimer
    Interval = 500
    OnTimer = TimerTimer
    Left = 720
    Top = 312
  end
end
