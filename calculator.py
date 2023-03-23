import math

def add(num1, num2):
    return num1 + num2

def subtract(num1, num2):
    return num1 - num2

def multiply(num1, num2):
    return num1 * num2

def divide(num1, num2):
    return num1 / num2

def square(num):
    return num ** 2

def square_root(num):
    return math.sqrt(num)

def cube(num):
    return num ** 3

def power(num, exponent):
    return num ** exponent

def main():
    while True:
        print("Select operation:")
        print("1. Add")
        print("2. Subtract")
        print("3. Multiply")
        print("4. Divide")
        print("5. Square")
        print("6. Square root")
        print("7. Cube")
        print("8. Power")
        print("0. Exit")

        choice = int(input("Enter choice (0-8): "))

        if choice == 0:
            break

        if choice < 1 or choice > 8:
            print("Invalid choice")
            continue

        if choice in [5, 6, 7]:
            num = float(input("Enter a number: "))
        else:
            num1 = float(input("Enter the first number: "))
            num2 = float(input("Enter the second number: "))

        if choice == 1:
            result = add(num1, num2)
        elif choice == 2:
            result = subtract(num1, num2)
        elif choice == 3:
            result = multiply(num1, num2)
        elif choice == 4:
            result = divide(num1, num2)
        elif choice == 5:
            result = square(num)
        elif choice == 6:
            result = square_root(num)
        elif choice == 7:
            result = cube(num)
        elif choice == 8:
            exponent = float(input("Enter exponent: "))
            result = power(num1, exponent)

        print("Result: ", result)
        print("")

if __name__ == "__main__":
    main()



"""def calculate(num1, num2, operation):
    if operation == "+":
        result = add(num1, num2)
    elif operation == "-":
        result = subtract(num1, num2)
    elif operation == "*":
        result = multiply(num1, num2)
    elif operation == "/":
        if num2 != 0:
            result = divide(num1, num2)
        else:
            result = "Error: division by zero"
    else:
        result = "Error: invalid operation"
    return result

def main():
    try:
        num1 = float(input("Enter the first number: "))
        num2 = float(input("Enter the second number: "))
        operation = input("Enter the operation (+, -, *, /): ")
        result = calculate(num1, num2, operation)
        print("Result: ", result)
    except ValueError:
        print("Error: invalid input")"""
