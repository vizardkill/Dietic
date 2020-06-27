/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import DAO.DAO_Cita;
import DAO.ICita;
import Modelos.Cita;
import java.util.List;

/**
 *
 * @author clan-
 */
public class controller_Cita {

    public boolean setCita(Cita c) {
        ICita ic = new DAO_Cita();
        return ic.setCita(c);
    }

    public List<Cita> getCitas() {
        ICita ic = new DAO_Cita();
        return ic.getCitas();
    }

    public boolean updateCita(Cita c) {
        ICita ic = new DAO_Cita();
        return ic.updateCita(c);
    }

    public boolean deleteCita(Cita c) {
        ICita ic = new DAO_Cita();
        return ic.deleteCita(c);
    }
}
