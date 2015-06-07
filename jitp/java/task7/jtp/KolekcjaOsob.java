package jtp;

import com.sun.istack.internal.*;

import java.io.*;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;
import java.util.Set;
import java.util.zip.GZIPInputStream;

/**
 * Zbiór osób
 *
 * @author Mateusz Starzec
 */
public class KolekcjaOsob implements Iterable<Osoba>,Serializable {

    static String imionaMeskie[] = {"Jakub", "Kacper", "Filip", "Szymon",
            "Jan", "Michał", "Antoni", "Mateusz", "Bartosz", "Wojciech", "Adam"};
    static String imionaZenskie[] = {"Oliwia", "Aleksandra", "Sylwia", "Elżbieta",
            "Aleksandra", "Katarzyna"};
    static String nazwiskaMeskie[] = {"Nowak", "Kowalski", "Wiśniewski",
            "Dąbrowski", "Lewandowski", "Wójcik", "Kamiński", "Zieliński"};
    static String nazwiskaZenskie[] = {"Nowak", "Kowalska", "Wiśniewska",
            "Dąbrowska", "Lewandowska", "Wójcik", "Kamińska", "Zielińska"};
    private List<Osoba> _kolekcja;

    /**
     * Konstruktor tworzący losowo podaną ilość osób
     *
     * @param size Ilość osób do utworzenia
     */
    public KolekcjaOsob(int size) {
        _kolekcja = new LinkedList<Osoba>();
        Set<Long> pesele = new HashSet<Long>();

        for (int i = 0; i < size; ++i) {
            Random r = new Random();

            String imie, nazwisko;
            if (r.nextInt(2) == 0) {
                imie = imionaMeskie[r.nextInt(imionaMeskie.length)];
                nazwisko = nazwiskaMeskie[r.nextInt(nazwiskaMeskie.length)];
            } else {
                imie = imionaZenskie[r.nextInt(imionaZenskie.length)];
                nazwisko = nazwiskaZenskie[r.nextInt(nazwiskaZenskie.length)];
            }

            Zawod zaw = Zawod.losuj();

            long pesel;
            do {
                pesel = _losujPesel(r);
            } while (pesele.contains(pesel));
            pesele.add(pesel);

            _kolekcja.add(new Osoba(imie, nazwisko, zaw, pesel));
        }
    }

    /**
     * Losuje pesel
     *
     * @param r Generator liczb losowych
     * @return Pesel składający się z 11 cyfr, bez zer wiodących
     */
    private Long _losujPesel(Random r) {
        long pesel = r.nextInt(9) + 1;
        for (int j = 0; j < 10; ++j) {
            pesel *= 10;
            pesel += r.nextInt(10);
        }
        return pesel;
    }

    /**
     * Wypisuje zawartość kolekcji osób
     *
     * @return Tekstowa reprezentacja zawartości
     */
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(_kolekcja);
        return sb.toString();
    }

    /**
     * Udostępnia iterator
     *
     * @return Iterator kolekcji osób
     */
    @Override
    public Iterator<Osoba> iterator() {
        return _kolekcja.iterator();
    }

    /**
     * Zapisuje zawartosc kolekcji do pliku w formacie CSV.
     * @param nazwaPliku nazwa pliku
     */
    public void zapiszDoPliku(String nazwaPliku) {
        BufferedWriter bufferedWriter;
        try {
            bufferedWriter = new BufferedWriter(
                    new OutputStreamWriter(
                            new FileOutputStream(
                                    new File(nazwaPliku))));
        } catch(Exception e) {
            System.out.println("Nie udało się utworzyć pliku.");
            return;
        }

        Iterator<Osoba> it = this.iterator();
        Osoba osoba;

        try {
            while(it.hasNext()) {
                osoba = it.next();
                bufferedWriter.append(osoba.toCsv());
                if(it.hasNext()) {
                    bufferedWriter.newLine();
                }
            }
            bufferedWriter.close();
        } catch(Exception e) {
            System.out.println("Nie udało się dokonać zapisu.");
        }
    }

    /**
     * Wczytuje kolekcje z pliku w formacie CSV lub CSV skompresowanym GZipem.
     * @param nazwaPliku nazwa pliku
     */
    public void odczytajZPliku(String nazwaPliku){
        BufferedReader bufferedReader;
        InputStreamReader inputReader;

        try {
            if (nazwaPliku.endsWith(".gz")) {
                inputReader = new InputStreamReader(
                        new GZIPInputStream(
                                new FileInputStream(
                                        new File(nazwaPliku))));
            } else {
                inputReader = new InputStreamReader(
                        new FileInputStream(
                                new File(nazwaPliku)));
            }
        } catch(Exception e) {
            System.out.println("Nie udało sie otworzyc pliku.");
            return;
        }

        bufferedReader = new BufferedReader(inputReader);
        String linia;
        _kolekcja.clear();

        try {
            while ((linia = bufferedReader.readLine()) != null) {
                String[] tab = linia.split(",");
                if(tab.length != 4) {
                    throw new Exception("Tablica powinna mieć 4 elementy.");
                }

                Osoba osoba = new Osoba(tab[0], tab[1], Zawod.valueOf(tab[2]), Long.parseLong(tab[3]));
                _kolekcja.add(osoba);
            }

            bufferedReader.close();

        } catch(Exception e){
            System.out.println("Nie udało się zapisać pliku");
        }
    }

    /**
     * Wypisuje z kolekcji osoby o podanym w konsoli nazwisku.
     */
    public void wypiszNazwisko() {
        BufferedReader bufferedReader = new BufferedReader(
                new InputStreamReader(System.in));

        String imie = "";

        try {
            imie = bufferedReader.readLine();
        } catch(Exception e){
            System.out.println("Nie udało się wczytać imienia z konsoli.");
        }

        for(Osoba osoba : _kolekcja) {
            if(osoba.getNazwisko().equals(imie)) {
                System.out.println(osoba);
            }
        }

    }

    /**
     * Zapisuje kolekcje do pliku korzystajac z mechanizmu serializacji.
     * @param nazwaPliku nazwa pliku
     */
    public void zapiszKolekcje(String nazwaPliku){
        ObjectOutputStream objectOutputStream;

        try {
            objectOutputStream = new ObjectOutputStream(
                    new FileOutputStream(
                            new File(nazwaPliku)));

        } catch(Exception e) {
            System.out.println("Nie udało się utworzyć pliku.");
            return;
        }

        try {
            objectOutputStream.writeObject(this);
            objectOutputStream.close();
        } catch(Exception e){
            System.out.println("Nie udało się zapisać.");
        }
    }

    /**
     * Wczytuje kolekcje z pliku.
     * @param nazwaPliku nazwa pliku
     */
    public static KolekcjaOsob wczytajKolekcje(String nazwaPliku){
        ObjectInputStream objectInputStream;

        try {
            objectInputStream = new ObjectInputStream(
                    new FileInputStream(
                            new File(nazwaPliku)));
        } catch(Exception e){
            System.out.println("Nie udało się otworzył pliku.");
            return null;
        }

        KolekcjaOsob kolekcjaOsob;

        try {
            kolekcjaOsob = (KolekcjaOsob)objectInputStream.readObject();
            objectInputStream.close();
        } catch(Exception e) {
            System.out.println("Nie udało się odczytać obiektu.");
            return null;
        }

        return kolekcjaOsob;
    }

    /**
     * Udostępnia iterator umożliwiający poruszanie po osobach o podanym imieniu
     *
     * @param imie Imię osób po jakich chcemy iterować
     * @return Iterator kolekcji osób
     */
    public Iterator<Osoba> iteratorImie(final String imie) {
        return new Iterator<Osoba>() {
            private Iterator<Osoba> _it = _kolekcja.iterator();
            private String _imie = imie;
            private Osoba _next = null, _last = null;

            /**
             * @return Czy iterator może zwrócić kolejny element
             */
            @Override
            public boolean hasNext() {
                if (_next != null) return true;
                findNext();
                return (_next != null);
            }

            /**
             * @return Kolejny element z kolekcji
             */
            @Override
            public Osoba next() {
                if (_next == null)
                    findNext();
                _last = _next;
                _next = null;
                return _last;
            }

            /**
             * Usuwa ostatnio zwrócony element
             */
            @Override
            public void remove() {
                _kolekcja.remove(_last);
            }

            /**
             * Znajduje kolejny element w kolekcji spełniający warunki i
             * zapamietuje go w _next, jeśli nie znaleziono _next ustawia na
             * null
             */
            private void findNext() {
                if (!_it.hasNext()) {
                    _next = null;
                    return;
                }
                _next = _it.next();
                while (_it.hasNext() && !_next.getImie().equals(_imie)) {
                    _next = _it.next();
                }

                if (!_next.getImie().equals(_imie)) {
                    _next = null;
                }
            }
        };
    }

    public static void main(String args[]) {

        KolekcjaOsob kolekcjaOsob = new KolekcjaOsob(5);
        for (Osoba osoba : kolekcjaOsob) {
            System.out.print(osoba);
        }

        kolekcjaOsob.zapiszDoPliku("zapisanakolekcja.csv");

        KolekcjaOsob kolekcjaOsob2 = new KolekcjaOsob(0);
        kolekcjaOsob2.odczytajZPliku("zapisanakolekcja.csv");

        System.out.println();

        for(Osoba osoba: kolekcjaOsob2) {
            System.out.print(osoba);
        }

        kolekcjaOsob.zapiszKolekcje("obiekt.bin");

        KolekcjaOsob kolekcjaOsob3 = KolekcjaOsob.wczytajKolekcje("obiekt.bin");

        System.out.println();

        if(kolekcjaOsob3 != null){
            for(Osoba osoba: kolekcjaOsob3) {
                System.out.print(osoba);
            }
        }

        System.out.println();
    }
}