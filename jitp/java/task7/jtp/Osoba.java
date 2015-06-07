package jtp;

import java.io.Serializable;

/**
 * Klasa reprezentująca osobę
 *
 * @author Mateusz Starzec
 */
public class Osoba implements Comparable<Osoba>, Serializable {

    private String _imie;
    private String _nazwisko;
    private Zawod _zawod;
    private Long _pesel;

    /**
     * Konstruktor tworzący osobę
     *
     * @param imie Imię
     * @param nazwisko Nazwisko
     * @param zawod Wykonywany zawód
     * @param pesel Pesel (11 cyfr)
     */
    public Osoba(String imie, String nazwisko, Zawod zawod, Long pesel) {
        _imie = imie;
        _nazwisko = nazwisko;
        _zawod = zawod;
        _pesel = pesel;
    }

    /**
     * Zwraca tekstową reprezentację przechowywanych danych
     *
     * @return Tekstowa reprezentacja obiektu klasy Osoba
     */
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(_imie);
        sb.append(" ");
        sb.append(_nazwisko);
        sb.append(" - ");
        sb.append(_zawod);
        sb.append(" - ");
        sb.append(_pesel);
        sb.append("\n");
        return sb.toString();
    }

    /**
     * Porównuje obiekt z innym obiektem klasy Osoba
     *
     * @param t Obiekt do porównania
     * @return Wynik porównania
     */
    @Override
    public int compareTo(Osoba t) {
        return t._pesel.compareTo(_pesel);
    }

    /**
     * Metoda dostępowa do imienia
     *
     * @return Imię
     */
    public String getImie() {
        return _imie;
    }

    /**
     * Metoda dostępowa do nazwiska
     *
     * @return Nazwisko
     */
    public String getNazwisko() {
        return _nazwisko;
    }

    /**
     * Metoda dostępowa do zawodu
     *
     * @return Zawód
     */
    public Zawod getZawod() {
        return _zawod;
    }

    /**
     * Metoda dostępowa do peselu
     *
     * @return Pasel
     */
    public Long getPesel() {
        return _pesel;
    }

    public static void main(String args[]) {
        Osoba o = new Osoba("Mateusz", "Starzec", Zawod.SPAWACZ, 93090311532L);
        System.out.println(o);
        Osoba o2 = new Osoba("Sylwia", "Rogala", Zawod.LEKARZ, 93042212345L);
        System.out.println(o2);

        System.out.println(o.compareTo(o2));
        System.out.println(o2.compareTo(o));
        System.out.println(o.compareTo(o));
    }

    public String toCsv() {
        return _imie + "," + _nazwisko + "," + _zawod + "," + _pesel;
    }
}