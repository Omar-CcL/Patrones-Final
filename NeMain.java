/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package Patrones2;

/**
 *
 * @author familia
 */
public class NeMain {
    public static void main(String[] args) {
        // Creamos una instancia para Perro
        AnimalFactory perroFactory = new PerroFactory();
        Karelife veterinariaPerro = new Karelife(perroFactory);
        System.out.println("Perro:");
        veterinariaPerro.mostrarInfo();
        
        System.out.println("------------------------");

        // Creamos una instancia para Gato
        AnimalFactory gatoFactory = new GatoFactory();
        Karelife veterinariaGato = new Karelife(gatoFactory);
        System.out.println("Gato:");
        veterinariaGato.mostrarInfo();
    }
}
