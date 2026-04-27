## Część 1 — PostgreSQL

-- Opis projektu
Projekt analityczny SQL polegający na analizie danych sprzedażowych sklepu e-commerce.
Celem projektu było zaprojektowanie relacyjnej bazy danych, uzupełnienie jej danymi testowymi oraz przeprowadzenie analiz sprzedaży, klientów i produktów.

-- Zakres danych
- Klienci: 49
- Zamówienia: 200
- Pozycje zamówień: 648
- Produkty: 51
- Kategorie produktów: 8
- Dostawcy: 10
- Okres danych: 2024

-- Technologie
- PostgreSQL
- SQL
- Git / GitHub
- Techniki: CTE, funkcje okienkowe (RANK(), agregacje, podzapytania, JOINy)

-- Struktura projektu
- `schema/` – definicje tabel (CREATE TABLE)
- `data/` – dane testowe (INSERT)
- `analysis/` – zapytania analityczne SQL
- `results/` – wnioski z analizy danych
- `erd.png` – diagram relacji między tabelami (ERD)

-- Zakres analiz
- Walidacja i spójność danych
- Analiza sprzedaży (przychód, trendy czasowe, rabaty)
- Analiza klientów (aktywni i nieaktywni klienci, koncentracja przychodu)
- Analiza produktów (TOP produkty, produkty bez sprzedaży, kategorie)

-- Kluczowe wnioski
1. Całkowity przychód w analizowanym okresie wyniósł 303979.33 zł.
2. Największa część przychodu pochodzi z zamówień wysyłanych do Polski, następnie do USA i UK.
3. Klienci z USA generują najwyższy przychód, nawet jeśli nie stanowią najliczniejszej grupy.
4. Sprzedaż opiera się głównie na kilku najlepiej sprzedających się produktach, które generują nieproporcjonalnie wysoki przychód.

-- Jak uruchomić projekt
1. Zainstaluj PostgreSQL (wersja 14+)
2. Utwórz nową bazę danych
3. Wykonaj skrypt: schema/01_create_tables.sql
4. Wykonaj skrypt: data/01_insert_data.sql
5. Uruchom zapytania analityczne z folderu analysis/

## Część 2 — Excel

-- Opis
Analiza danych sprzedażowych w Excelu oparta na tych samych danych co część SQL.
Celem było stworzenie przejrzystego, interaktywnego raportu demonstrującego 
umiejętności pracy z danymi w Excelu.

-- Technologie
- Microsoft Excel
- Power Query (import danych z CSV)

-- Struktura pliku
- `00_INFO` – strona tytułowa i opis projektu
- `01_DANE` – dane źródłowe: zamówienia, klienci, produkty (import przez Power Query)
- `02_OBLICZENIA` – formuły i funkcje analityczne
- `03_TABELE` – tabele przestawne
- `04_DASHBOARD` – interaktywny dashboard z KPI i wykresami

-- Zastosowane funkcje
JEŻELI, WARUNKI, LUB, WYSZUKAJ.PIONOWO, INDEKS, 
TEKST, SUMA.WARUNKÓW, UNIKATOWE

-- Kluczowe elementy
- Segmentacja klientów (Nieaktywny / Niski / Średni / Wysoki)
- Kategoryzacja produktów według przychodu
- Analiza wysyłek krajowych vs zagranicznych
- Interaktywny wykres przychodu miesięcznego z filtrem kraju (pole kombi)
- Dashboard z 4 wskaźnikami KPI i 4 wykresami

-- Kluczowe wnioski
1. Polska generuje największy przychód spośród wszystkich krajów wysyłki.
2. 78% przychodu pochodzi od klientów z segmentu "Wysoki".
3. Mountain Bike Helmet to produkt z najwyższym przychodem.
4. Prawie 20% zamówień jest wysyłanych za granicę kraju klienta.

-- Autor
Anna Brakoniecka
