import math

def calc(last_days,k):
    avg = sum(last_days) / len(last_days)
    p = ((math.e ** (-avg)) * avg ** k) / math.factorial(k)
    return p

