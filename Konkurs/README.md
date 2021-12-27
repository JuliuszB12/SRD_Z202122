## Zasady konkursu SRD
### Zespoły
Należy dobrać się w zespoły złożone z 1-3 osób. Proszę nazwać zespół (nazwa pojawi się w tabeli z wynikami). 

### Zbiór danych i cel konkursu
Celem konkursu jest uzyskanie jak największego [F1-score](https://en.wikipedia.org/wiki/F-score) w klasyfikacji zmiennej celu **IsIPA**. Do stworzenia i walidacji modelu proszę wykorzystać zbiór danych **IPA.csv**, natomiast finalną predykcję należy wykonać na zbiorze **IPA_test.csv**. Opis zbioru znajduje się w pliku **IPA_description.txt**.

### Wyniki
Wyniki należy przesłać na adres lkrain@sgh.waw.pl do godziny:
- 17:30 - grupa 5
- 19:20 - grupa 3
- 21:10 - grupa 4

Wiadomości otrzymane po określonych godzinach nie będą przyjmowane. W treści maila należy podać nazwę grupy oraz imiona i nazwiska członków. Jako załączniki należy zamieścić:
1. Skrypt ze stworzonym kodem (w dowolnym języku programowania)
2. Plik CSV o nazwie **[nazwa_grupy]_IPA_prediction.csv** zawierający jedną kolumnę z 5000 obserwacji (i opcjonalnym nagłówkiem) z wartościami 1/0 lub TRUE/FALSE oznaczających predykcję dla kolejnych wierszy ze zbioru testowego **IPA_test.csv**. 

Proszę dokładnie sprawdzić czy kolejność predykcji zgadza się z kolejnością obserwacji w zbiorze testowym.

Tabela z rankingiem zespołów pojawi się na GitHubie w poniższym pliku README. Najlepszy zespół w każdej grupie otrzyma dodatkowe 5 punktów, kolejny 4 punkty, itd.

Życzę powodzenia. 

## Wyniki

Zajęcia Grupy 3 (17:10-18:50)

| Zespół            | F1-score | Punkty | Język  | Model                  |
|-------------------|----------|--------|--------|------------------------|
| cvtchk            | 78,95%   | 5      | Python | Las losowy             |
| Pingwiny          | 78,55%   | 4      | Python | Las losowy             |
| Modelarskie Świry | 78,54%   | 3      | Python | Las losowy             |
| Inkub             | 78,32%   | 2      | R      | Gradient Boosted Trees |
| Han Solo          | 78,19%   | 1      | R      | Gradient Boosted Trees |
| GBM enjoyer       | 78,05%   | 0      | R      | Gradient Boosted Trees |
| Atomówki          | 29,93%   | 0      | Python | Regresja logistyczna   |

Zajęcia Grupy 4 (19:00-20:30)

| Zespół             | F1-score | Punkty | Język  | Model                  |
|--------------------|----------|--------|--------|------------------------|
| Stanczyki          | 78,90%   | 5      | R      | Las losowy             |
| Dżupajter          | 77,98%   | 4      | R      | Las losowy             |
| Tachimetry         | 77,96%   | 3      | R      | Las losowy             |
| Grupa KM           | 77,67%   | 2      | R      | Las losowy             |
| DELLWITHIT         | 76,90%   | 1      | R      | Las losowy             |
| Statystyczne Kotki | 76,76%   | 0      | R      | Gradient Boosted Trees |
| AloneInTheDark     | 76,38%   | 0      | R      | Gradient Boosted Trees |
| Grupa Cokolwiek    | 47,66%   | 0      | Python | Głęboka Sieć Neuronowa |

Zajęcia Grupy 5 (15:20-17:00)

| Zespół       | F1-score | Punkty | Język | Model                  |
|--------------|----------|--------|-------|------------------------|
| Choinki      | 78,80%   | 5      | R     | Gradient Boosted Trees |
| R-owe świrki | 63,37%   | 4      | R     | Las losowy             |

Gratulacje dla wszystkich zespołów 👏
