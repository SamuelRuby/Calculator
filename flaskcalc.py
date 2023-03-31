import math
import speech_recognition #this converts our audio into text

def add(a,b):
    return a+b
def sub(a,b):
    return a-b

def mul(a, b):
    return a * b
def div(a, b):
    return a / b

def mod(a, b): #remainder when a is divided by b
    return a % b

def lcm(a,b):
    l=math.lcm(a,b)
    return l

def hcf(a,b):
    h=math.gcd(a,b)
    return h

operations = {
    'ADD': lambda a, b: a + b,
    'ADDITION': lambda a, b: a + b,
    'SUM': lambda a, b: a + b,
    'PLUS': lambda a, b: a + b,
    'SUBTRACTION': lambda a, b: a - b,
    'DIFFERENCE': lambda a, b: a - b,
    'MINUS': lambda a, b: a - b,
    'SUBTRACT': lambda a, b: a - b,
    'PRODUCT': lambda a, b: a * b,
    'MULTIPLICATION': lambda a, b: a * b,
    'MULTIPLY': lambda a, b: a * b,
    'DIVISION': lambda a, b: a / b,
    'DIV': lambda a, b: a / b,
    'DIVIDE': lambda a, b: a / b,
    'LCM': math.lcm,
    'HCF': math.gcd,
    'MOD': lambda a, b: a % b,
    'REMAINDER': lambda a, b: a % b,
    'MODULUS': lambda a, b: a % b
}


def findNumbers(t):
    l=[]
    for num in t:
        try:
            l.append(int(num))
        except ValueError:
            pass
    return l

def calculate(text):
    text_list = text.split(' ')
    for word in text_list:
        if word.upper() in operations.keys():
            l = findNumbers(text_list)
            result = operations[word.upper()](l[0], l[1])
            return result
        
def audio():
    sr = speech_recognition.Recognizer()
    with speech_recognition.Microphone()as m:
        try:
            sr.adjust_for_ambient_noise(m, duration=0.2)
            voice = sr.listen(m)
            text = sr.recognize_google(voice)
            result = calculate(text)
            print(result)
        except:
            pass

audio()


button_text_list = ["C", "CE", "√", "+", "π", "cosθ", "tanθ", "sinθ",
                    "1", "2", "3", "-", "2π", "cosh", "tanh", "sinh",
                    "4", "5", "6", "*", chr(8731), "x\u02b8", "x\u00B3", "x\u00B2",
                    "7", "8", "9", chr(247), "ln", "deg", "rad", "e",
                    "0", ".", "%", "=", "log₁₀", "(", ")", "x!"]