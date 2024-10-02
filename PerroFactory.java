/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Patrones2;

/**
 *
 * @author familia
 */
public class PerroFactory implements AnimalFactory {
    @Override
    public Animal crearAnimal() {
        return new Perro();
    }
    
    @Override
    public Cuidados crearCuidados() {
        return new CuidadosPerro();
    }
}
