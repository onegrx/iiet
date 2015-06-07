package jtp;

import java.util.Random;

/**
 * Typ wyliczeniowy z dostępnymi zawodami
 *
 * @author Mateusz Starzec
 */
public enum Zawod {

    KOMINIARZ(1), LEKARZ(15), ŚLUSARZ(20), SPAWACZ(21);
    private int _id;

    /**
     * Konstruktor zapamietujacy id zawodu
     *
     * @param id Identyfikator zawodu
     */
    Zawod(int id) {
        _id = id;
    }

    /**
     * Udostępnia identyfikator zawodu
     *
     * @return Identyfikator zawodu
     */
    public int getId() {
        return _id;
    }

    /**
     * Losuje zawód
     *
     * @return Wylosowany zawód
     */
    public static Zawod losuj() {
        return Zawod.values()[(new Random()).nextInt(Zawod.values().length)];
    }
}