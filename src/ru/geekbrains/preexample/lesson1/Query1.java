package ru.geekbrains.preexample.lesson1;

/*Задание 1
Создать builder для класса Person со следующими полями:
String firstName,
String lastName,
String middleName,
String country,
String address,
String phone,
int age,
String gender.
*/


public class Query1 {
    public static void main(String[] args) {
        Person p = new Person.Builder().addFirstName( "Ivanov" ).addLastName( "Ivan" ).addMiddleName( "Ivanovich" ).addCountry( "Russia" ).build();
    }
}

class Person{
    private String firstName;
    private String lastName;
    private String middleName;
    private String country;
    private String address;
    private String phone;
    private int age;
    private String gender;

    public static class Builder  {
        private String firstName;
        private String lastName;
        private String middleName;
        private String country;
        private String address;
        private String phone;
        private int age;
        private String gender;

        public Builder addFirstName(String  firstName) {
            this.firstName = firstName;
            return this;
        }

        public Builder addLastName(String  lastName) {
            this.lastName = lastName;
            return this;
        }
        public Builder addMiddleName(String  middleName) {
            this.middleName = middleName;
            return this;
        }
        public Builder addCountry(String  country) {
            this.country = country;
            return this;
        }
        public Builder addAddress(String  address) {
            this.address = address;
            return this;
        }
        public Builder addPhone(String  phone) {
            this.phone = phone;
            return this;
        }

        public Builder addAge(int  age) {
            this.age = age;
            return this;
        }
        public Builder addGender(String  gender) {
            this.gender = gender;
            return this;
        }
        protected Person build(){
            return new Person();
        }
    }

}


