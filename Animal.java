/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Patrones3;

/**
 *
 * @author familia
 */
public class Animal {
    private String nombre;
    private String especie;
    private String raza;
    private int edad;
    private double peso;
    private String color;

    private Animal(AnimalBuilder builder) {
        this.nombre = builder.nombre;
        this.especie = builder.especie;
        this.raza = builder.raza;
        this.edad = builder.edad;
        this.peso = builder.peso;
        this.color = builder.color;
    }
 public static class AnimalBuilder {
        private String nombre;
        private String especie;
        private String raza;
        private int edad;
        private double peso;
        private String color;

        public AnimalBuilder setNombre(String nombre) {
            this.nombre = nombre;
            return this;
        }

        public AnimalBuilder setEspecie(String especie) {
            this.especie = especie;
            return this;
        }

        public AnimalBuilder setRaza(String raza) {
            this.raza = raza;
            return this;
        }

        public AnimalBuilder setEdad(int edad) {
            this.edad = edad;
            return this;
        }

        public AnimalBuilder setPeso(double peso) {
            this.peso = peso;
            return this;
        }

        public AnimalBuilder setColor(String color) {
            this.color = color;
            return this;
        }

        public Animal build() {
            return new Animal(this);
        }
    }

    @Override
    public String toString() {
        return "Animal [nombre=" + nombre + ", especie=" + especie + ", raza=" + raza + ", edad=" + edad + ", peso=" + peso + ", color=" + color + "]";
    }
}