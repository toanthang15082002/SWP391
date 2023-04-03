/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Thang
 */
public class Plo {
    private int ploid;
    private String ploName;
    private String ploDescription;
    private int curid;

    public Plo() {
    }

    public Plo(int ploid, String ploName, String ploDescription, int curid) {
        this.ploid = ploid;
        this.ploName = ploName;
        this.ploDescription = ploDescription;
        this.curid = curid;
    }

    public int getPloid() {
        return ploid;
    }

    public void setPloid(int ploid) {
        this.ploid = ploid;
    }

    public String getPloName() {
        return ploName;
    }

    public void setPloName(String ploName) {
        this.ploName = ploName;
    }

    public String getPloDescription() {
        return ploDescription;
    }

    public void setPloDescription(String ploDescription) {
        this.ploDescription = ploDescription;
    }

    public int getCurid() {
        return curid;
    }

    public void setCurid(int curid) {
        this.curid = curid;
    }

    @Override
    public String toString() {
        return "Plo{" + "ploid=" + ploid + ", ploName=" + ploName + ", ploDescription=" + ploDescription + ", curid=" + curid + '}';
    }
    
    
}
