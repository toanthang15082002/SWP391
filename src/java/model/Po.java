/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Thang
 */
public class Po {
    private int poid;
    private String poName;
    private String poDescription;
    private int curid;

    public Po() {
    }

    public Po(int poid, String poName, String poDescription, int curid) {
        this.poid = poid;
        this.poName = poName;
        this.poDescription = poDescription;
        this.curid = curid;
    }

    public int getPoid() {
        return poid;
    }

    public void setPoid(int poid) {
        this.poid = poid;
    }

    public String getPoName() {
        return poName;
    }

    public void setPoName(String poName) {
        this.poName = poName;
    }

    public String getPoDescription() {
        return poDescription;
    }

    public void setPoDescription(String poDescription) {
        this.poDescription = poDescription;
    }

    public int getCurid() {
        return curid;
    }

    public void setCurid(int curid) {
        this.curid = curid;
    }

    @Override
    public String toString() {
        return "Plo{" + "poid=" + poid + ", poName=" + poName + ", poDescription=" + poDescription + ", curid=" + curid + '}';
    }
    
    
}
