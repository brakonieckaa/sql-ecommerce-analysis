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

-- Struktura projektu
- `schema/` – definicje tabel (CREATE TABLE)
- `data/` – dane testowe (INSERT)
- `analysis/` – zapytania analityczne SQL
- `results/` – wnioski z analizy danych

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

-- Autor
Anna Brakoniecka