**Statystyczne reguły decyzyjne [223490-D], zima 2021/2022**

### Organizacja zajęć

Prowadzący zajęcia:

- _Wykład_: Bogumił Kamiński, [http://bogumilkaminski.pl](http://bogumilkaminski.pl/)
- _Ćwiczenia_: 
  * Gr 1,6 - Daniel Kaszyński
  * Gr 2,3,4,5 - Łukasz Kraiński

Godziny i lokalizacja zajęć:

- _Wykład_:  wtorki, 8:00-9:40, Aula II
- _Ćwiczenia_: zgodnie z przypisaną grupą

### Wykłady

| Data       | Temat                                                                                                                     |
|------------|---------------------------------------------------------------------------------------------------------------------------|
| 05.10.2021 | Wprowadzenie do   uczenia maszynowego                                                                                     |
| 12.10.2021 | Konfiguracja   środowiska do pracy z językiem Julia; wprowadzenie do programowania w języku   Julia                       |
| 19.10.2021 | Zarządzanie projektem   analitycznym przy wykorzystaniu środowiska git i GitHub                                           |
| 26.10.2021 | Praca z kolekcjami   danych w języku Julia                                                                                |
| 02.11.2021 | Praca z ramkami   danych w języku Julia                                                                                   |
| 09.11.2021 | Wizualizacja danych w   języku Julia                                                                                      |
| 16.11.2021 | Zapis i odczytywanie   danych w różnych standardowych formatach                                                           |
| 23.11.2021 | Podstawowe koncepcje   w budowie modeli predykcyjnych                                                                     |
| 30.11.2021 | Metody oceny   klasyfikatorów                                                                                             |
| 07.12.2021 | Metody   regularyzacyjne                                                                                                  |
| 14.12.2021 | Wprowadzenie do deep   learning                                                                                           |
| 21.12.2021 | Machine learning in   estimating Heterogeneous Treatment Effects of a marketing campaign (in   cooperation with McKinsey) |
| 04.01.2022 | Wprowadzenie do   analizy danych grafowych                                                                                |
| 11.01.2022 | Modelowanie   predykcyjne dla danych grafowych                                                                            |
| 18.01.2022 | Podsumowanie wykładu;   Kolokwium zaliczeniowe                                                                            |

### Ćwiczenia

| Numer ćwiczeń | Tematyka zajęć |
| --- | --- |
| 1 | Zajęcia organizacyjne; wprowadzenie do narzędzia Jupyter Notebook i uczenia maszynowego w R/Python |
| 2 | Metody oceny jakości modeli klasyfikacyjnych |
| 3 | Nieparametryczne modele regresyjne: smoothing spline, LOESS, GAM |
| 4 | Modele oparte na drzewach (CART, Random Forest, XGBoost) |
| 5 | Deep Learning|
| 6 | Konkurs modelarski|
| 7 | Zaliczenie komputerowe |
| 8 | Termin dodatkowy |

### Literatura

- Materiały udostępniane na wykładzie
- Gareth J., Witten D., Hastie T., Tibshirani R. (2021), An Introduction to Statistical Learning with Applications in R (https://web.stanford.edu/~hastie/ISLR2/ISLRv2_website.pdf)
- Hastie T., Tibshirani R., Friedman J. (2017), The Elements of Statistical Learning
(http://www-stat.stanford.edu/~tibs/ElemStatLearn/)
- Mykel J. Kochenderfer, Tim A. Wheeler, And Kyle H. Wray (2022), Algorithms for Decision Making (https://algorithmsbook.com/)
- Stephen Boyd and Lieven Vandenberghe, Introduction to Applied Linear Algebra (http://vmls-book.stanford.edu/)
- Kamiński B., Zawisza M. (2012), Receptury w R. Podręcznik dla ekonomisty, Oficyna Wydawnicza SGH (http://bogumilkaminski.pl/projekty/)


### Zaliczenie ćwiczeń (50 punktów)
* Pisemne kolokwium na ostatnich ćwiczeniach
* Każdy z Państwa otrzyma spersonalizowany zestaw zadań w pliku `.R`. Zadania będą obejmować przykłady praktyczne wymagające wykorzystanie kodu omawianego na ćwiczeniach oraz zadania teoretyczne sprawdzające znajomość zagadnień i koncepcji poruszonych w trakcie semestru. Jest wymagana tylko znajomość kodu R, zagadnienia omawiane przy materiałach w Pythonie mogą pojawić się w części teoretycznej.
* Wypełniony plik z odpowiedziami należy wysłać na _lkrain@sgh.waw.pl_ do końca zajęć

---

### Dodatkowe punkty
 * Praca domowa - max `5pkt`
  1. Przeczytaj artykuł [Assessment of the size of VaR backtests for small samples](https://ps.stat.gov.pl/Article/2020/2/114-151)
  2. Przygotuj kod źródłowy w języku **Julia** lub **R** dla jednego z przedstawionych w tekście testów walidacyjnych (`Backtest`) modeli Wartości Zagrożonej (`Value at Risk - VaR`)
  3. Przeprowadź ocenę rozmiaru tego testu, przygotowując odpowiedni wykres (analogiczny jak na stronach 16-29 artykułu) oraz tabelę z wynikami (parametry: To, Tu, Ao, Au, A)
  4. Finalny raport powinien zawierać informacje o wybranym teście, wykres z wynikami, tabelę z wynikami, wykorzystany kod źródłowy. Raport może być przygotowany w dowolnym narzędziu, np. Jupyter, Word, etc. Raport należy wysłać na adres _lkrain@sgh.waw.pl_. Pracę domową można wysyłać do końca semestru.

 * Konkurs modelarski - max `5pkt`
   * Konkurs będzie przeprowadzony na szóstych zajęciach
   * Zadaniem będzie optymalizacja określonej miary jakości modelu np. accuracy w klasyfikacji zadanej zmiennej na udostępnionym zbiorze danych
   * Praca będzie przebiegać w grupach 2-3 osobowych, do końca zajęć będzie możliwość wysyłania kodu i predykcji na danych testowych na _lkrain@sgh.waw.pl_
   * Zespół, który osiągnie najlepszy wynik miary jakości otrzyma 5pkt, kolejny 4pkt, itd.
 * Realizacja kursu https://juliaacademy.com/p/introduction-to-dataframes-jl1 `5pkt` - proszę przesyłać certyfikaty ukończenia kursu na _lkrain@sgh.waw.pl_
 * Przedstawienie 4 zaakceptowanych Pull Requestów do projektów Open Source - `10pkt`

---

Na podstawie sumy punktów (maksymalnie 100) wyznaczana jest ocena końcowa:

| Od | Do | Ocena końcowa |
| --- | --- | --- |
| 0 | 49 | niedostateczny |
| 50 | 59 | dostateczny |
| 60 | 69 | dostateczny plus |
| 70 | 79 | dobry |
| 80 | 89 | dobry plus |
| 90 | 100 | bardzo dobry |
