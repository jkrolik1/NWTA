package com.JAMgroup.NWTA;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity 
public class Dzial {

    @Id
    @Column(name="NumerDzialu")
    private int numerDzialu;
    
    @Column(name="Nazwa")
    private String nazwa;
    
    @Column(name="Opis")
    private String opis;
    
    @Column(name="ZoologicznyPunktSprzedazyIdPunktuSprzedazy")
    private int idPunktuSprzedazy;

    public int getNumerDzialu() {
        return numerDzialu;
    }

    public void setNumerDzialu(int numerDzialu) {
        this.numerDzialu = numerDzialu;
    }

    public String getNazwa() {
        return nazwa;
    }

    public void setNazwa(String nazwa) {
        this.nazwa = nazwa;
    }

    public String getOpis() {
        return opis;
    }

    public void setOpis(String opis) {
        this.opis = opis;
    }

    public int getIdPunktuSprzedazy() {
        return idPunktuSprzedazy;
    }

    public void setIdPunktuSprzedazy(int idPunktuSprzedazy) {
        this.idPunktuSprzedazy = idPunktuSprzedazy;
    }

}
