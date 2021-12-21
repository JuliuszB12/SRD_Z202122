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