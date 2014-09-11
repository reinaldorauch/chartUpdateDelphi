unit Princ;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VCLTee.TeEngine, Vcl.ExtCtrls,
  VCLTee.TeeProcs, VCLTee.Chart, Vcl.ComCtrls, Vcl.StdCtrls, VCLTee.Series;

type
  TRegTime = record
    val: Integer;
    time: String;
  end;

  TFmPrinc = class(TForm)
    ChUpdate: TChart;
    EdMax: TEdit;
    UpDown: TUpDown;
    Series1: TAreaSeries;
    Timer: TTimer;
    Button1: TButton;
    procedure TimerTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmPrinc: TFmPrinc;
  VOC: Array of TRegTime;

implementation

{$R *.dfm}

procedure TFmPrinc.TimerTimer(Sender: TObject);
var
  I, Aux: Integer;
begin

  // Se o array estiver vazio, somente adiciona um elemento
  if(Length(VOC) = 0) then
    begin
      SetLength(VOC, 1);
      VOC[0].val := Round(Random() * 100);
      VOC[0].time := TimeToStr(Time());
    end
  else
    // Se o tamanho do array for do tamanho do limite, somente adiciona o novo
    // elemento ao inícic do vetor, descartando o último valor
    if(Length(VOC) = StrToInt(EdMax.Text)) then
      begin
        for I := Length(VOC) - 2 downto 0 do
          VOC[i + 1] := VOC[i];
        VOC[0].val := Round(Random() * 100);
        VOC[0].time := TimeToStr(Time());
      end
    else
      // Se o tamanho do array for maior que o limite, adiciona o novo elemento
      // ao início dele e descarta os elementos do final, ajustando o tamanho
      // do vetor ao tamanho máximo
      if(Length(VOC) > StrToInt(EdMax.Text)) then
        begin
          for I := Length(VOC) - 2 downto 0 do
            VOC[i + 1] := VOC[i];
          VOC[0].val := Round(Random() * 100);
          VOC[0].time := TimeToStr(Time());
          SetLength(VOC, StrToInt(EdMax.Text));
        end
      else
        // Se for menor que o tamanho máximo e maior que zero, aumenta em 1 o
        // tamanho do array e adiciona o novo elemento ao início do array,
        // emputtando os elementos anteriores para tráz
        begin
          SetLength(VOC, Length(VOC) + 1);
          for I := Length(VOC) - 2 downto 0 do
            VOC[i + 1] := VOC[i];
          VOC[0].val := Round(Random() * 100);
          VOC[0].time := TimeToStr(Time());
        end;

  // Atualiza o gráfico com o os novos valores do array
  with ChUpdate.Series[0] do
  begin
    Clear;
    for I := 0 to Length(VOC) - 1 do
        Add(VOC[i].val, VOC[i].time);
  end;
end;

end.
