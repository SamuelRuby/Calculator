from flask import Flask, render_template, request
from calculator import add, subtract, multiply, divide


app = Flask(__name__)

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/calculate', methods=['POST'])
def calculate():
    num1 = float(request.form['num1'])
    num2 = float(request.form['num2'])
    operation = request.form['operation']

    if operation == '+':
        result = add(num1, num2)
        operation_symbol = '+'
    elif operation == '-':
        result = subtract(num1, num2)
        operation_symbol = '-'
    elif operation == '*':
        result = multiply(num1, num2)
        operation_symbol = '*'
    elif operation == '/':
        result = divide(num1, num2)
        operation_symbol = '/'

    return render_template('result.html', num1=num1, num2=num2, operation=operation_symbol, result=result)
  
if __name__ == "__main__":
    app.run(debug=True)
