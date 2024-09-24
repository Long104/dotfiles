
package main

import (
    "fmt"
)

// Calculator struct
type Calculator struct{}

// Method for addition
func (c Calculator) Add(a, b float64) float64 {
    return a + b
}

// Method for subtraction
func (c Calculator) Subtract(a, b float64) float64 {
    return a - b
}

// Method for multiplication
func (c Calculator) Multiply(a, b float64) float64 {
    return a * b
}

// Method for division
func (c Calculator) Divide(a, b float64) (float64, error) {
    if b == 0 {
        return 0, fmt.Errorf("cannot divide by zero")
    }
    return a / b, nil
}

// Complex function that uses Calculator methods
func PerformCalculations(a, b float64, operation string) (float64, error) {
    calc := Calculator{}

    switch operation {
    case "add":
        return calc.Add(a, b), nil
    case "subtract":
        return calc.Subtract(a, b), nil
    case "multiply":
        return calc.Multiply(a, b), nil
    case "divide":
        return calc.Divide(a, b)
    default:
        return 0, fmt.Errorf("unsupported operation: %s", operation)
    }
}

func main() {
    var a, b float64
    var operation string

    // User input
    fmt.Print("Enter first number: ")
    fmt.Scanln(&a)
    fmt.Print("Enter second number: ")
    fmt.Scanln(&b)
    fmt.Print("Enter operation (add, subtract, multiply, divide): ")
    fmt.Scanln(&operation)

    // Call PerformCalculations
    result, err := PerformCalculations(a, b, operation)
    if err != nil {
        fmt.Println("Error:", err)
    } else {
        fmt.Printf("Result: %.2f\n", result)
    }
}
