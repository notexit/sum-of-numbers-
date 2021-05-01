unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    StringGrid1: TStringGrid;
    procedure Button1Click(Sender: TObject);

  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  i,j,n,m, sums, sums_odd, even_numbers, no_even_numbers: integer;
  mas: array[1..10,1..10] of integer;             //масив 10 на 10

begin
  StringGrid1.Clean([]);                           //Чистимо таблицю
     n:=StrToInt(Edit1.Text);                      //присвоюємо змінній дані введені з клавіатури
     m:=StrToInt(Edit2.Text);
     sums:=0;                                       //В цій змінній будемо зберігати суму всіх парних стопчиків
     sums_odd:=0;                                   //В цій змінній будемо зберігати суму всіх не парних стопчиків
     even_numbers := 0;                             //В цій змінній будемо зберігати суму всіх парних чисел в таблиці
     no_even_numbers:=0;                            //В цій змінній будемо зберігати суму всіх не парних чисел в таблиці

  Randomize;                                        //Команда для генерації випалкових чисел

  for i := 0 to n do
     StringGrid1.Cells[0,i] := IntToStr(i);         //Номеруємо таблицю по вертикалі
  for j := 0 to m do
     StringGrid1.Cells[j,0] := IntToStr(j);         //Номеруємо таблицю по горизонталі



  for i:=1 to n do                                           //Створюємо цикл для заповнення по вертикалі
     for j:=1 to m do                                        //Створюємо цикл для заповнення по горизонталі
        begin
          mas[i,j] := Random(100);                            //Заповнюємо таблицю випадковими числами до 100
          stringgrid1.cells[j,i] := IntToStr(mas[i, j]);      //Відображаємо в таблиці згенеровані дані
          if (j mod 2=0) then                                 //Перевіряємо, чи стопчик має парне число
             sums:= sums+mas[i,j]                         //При істиності додаємо число
          Else begin
             sums_odd:= sums_odd+mas[i,j];
             end;
          if mas[i,j] mod 2=0 then                             // Перевірка на парність числа в комірці
             even_numbers:= even_numbers+mas[i,j]         //Якщо істино то додаємо
          Else begin
               no_even_numbers:=no_even_numbers+mas[i,j];
          end;
        end;
    label1.Caption:=IntToStr(sums);                           //Відображаємо отриманий результат (суму всіх чисел парних стопців)
    label7.Caption:=IntToStr(even_numbers);                  //Відображення суми всіх парних чисел в таблиці
    label9.Caption:=IntToStr(no_even_numbers);
    label12.Caption:=IntToStr(sums_odd);
        end;
    //При кожному кліку на кнопку "Почати" генерується новий список
    //У програми немає перевірки на вірність введеня даних, тому при введені інших даних чи більшого числа ніж потрібно (більше 9) буде виникати помилка
    //Фотографії програми буде в папці в архіві. В мене все працює.


end.

