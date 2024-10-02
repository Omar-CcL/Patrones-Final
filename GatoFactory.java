/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Patrones2;

/**
 *
 * @author familia
 */
public class GatoFactory implements AnimalFactory {
    @Override
    public Animal crearAnimal() {
        return new Gato();
    }

    @Override
    public Cuidados crearCuidados() {
        return new CuidadosGato();
    }
}
