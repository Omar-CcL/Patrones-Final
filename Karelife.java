/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Patrones2;

/**
 *
 * @author familia
 */
public class Karelife {
    private Animal animal;
    private Cuidados cuidados;

    public Karelife(AnimalFactory factory) {
        this.animal = factory.crearAnimal();
        this.cuidados = factory.crearCuidados();
    }

    public void mostrarInfo() {
        animal.mostrarDetalles();
        cuidados.mostrarCuidados();
    }
}