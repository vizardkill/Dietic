/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import DAO.DAO_Receta;
import DAO.IReceta;
import Modelos.Receta;
import java.util.List;

/**
 *
 * @author clan-
 */
public class controller_Receta {
    public boolean setReceta(Receta rec){
        IReceta irec = new DAO_Receta();
        return irec.setReceta(rec);
    }
    
    public boolean updateReceta(Receta rec) {
        IReceta irec = new DAO_Receta();
        return irec.updateReceta(rec);
    
    }
    
    public boolean deleteReceta(Receta rec){
        IReceta irec = new DAO_Receta();
        return irec.deleteReceta(rec);   
    }
    
    public List<Receta> getReceta(){
        IReceta irec = new DAO_Receta();
        return irec.getReceta();   
    }
}
