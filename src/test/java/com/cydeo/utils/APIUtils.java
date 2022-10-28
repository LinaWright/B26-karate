package com.cydeo.utils;

import com.github.javafaker.Faker;

public class APIUtils {
public static String getRandomName(){
    Faker faker = new Faker();
    String randomName = faker.name().firstName();
    System.out.println("randomName = " + randomName);
    return randomName;
}
    public static String getRandomName() {
        Faker faker = new Faker();
        String name = faker.name().firstName();
        System.out.println("random name = " + name);
        return name;
    }

}
