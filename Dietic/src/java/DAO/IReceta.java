/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Modelos.Receta;
import java.util.List;

/**
 *
 * @author clan-
 */
public interface IReceta {
    
    public boolean setReceta(Receta rec);
    
    public boolean updateReceta(Receta rec);
    
    public boolean deleteReceta(Receta rec);
    
    public List<Receta> getReceta();
    
}
