/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package Patrones3;

/**
 *
 * @author familia
 */
public class Main {
    public static void main(String[] args) {
        Animal perro = new Animal.AnimalBuilder()
            .setNombre("Fido")
            .setEspecie("Perro")
            .setRaza("Labrador")
            .setEdad(3)
            .setPeso(25.50)
            .setColor("Marrón")
            .build();

        System.out.println(perro);
    }
}
