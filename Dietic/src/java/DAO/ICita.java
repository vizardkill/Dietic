/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Modelos.Cita;
import java.util.List;

/**
 *
 * @author clan-
 */
public interface ICita {
    public boolean setCita(Cita c);
    
    public List<Cita> getCitas();
}
