SQL – analiza danych sprzedażowych (PostgreSQL)

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
- Techniki: CTE, funkcje okienkowe (RANK()), agregacje, podzapytania, JOINy)

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

-- Autor
Anna Brakoniecka
