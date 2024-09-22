
package main

import (
    "fmt"
)

// Define a struct
type Animal struct {
    Name string
}

// Method to get the animal's sound (implementation)
func (a Animal) Speak() string {
    return fmt.Sprintf("%s says: Woof!", a.Name)
}

// Function to get a reference to an Animal
func GetAnimalReference(name string) *Animal {
    return &Animal{Name: name}
}

// Function to demonstrate type definition and usage
func DescribeAnimal(a Animal) {
    fmt.Printf("This is %s. %s\n", a.Name, a.Speak())
}

// Main function
func main() {
    // Create an animal using a reference
    dog := GetAnimalReference("Buddy")

    // Describe the animal
    DescribeAnimal(*dog)
}
