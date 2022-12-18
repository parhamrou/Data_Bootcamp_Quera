from scipy.stats import norm

def calc(numbers, k):
    sigma = (.07 * .93 * len(numbers)) ** (.5)
    avg = len(numbers) * .93
    expected = ((sigma  * norm.ppf((1 - k) / 2)) / ((len(numbers)) ** .5)) + avg
    ones = numbers.count(1)
    if ones >= expected:
        return "ACCEPT"
    else:
        return "REJECT"


if __name__ == '__main__':
    string_input = input()
    string_input = string_input.split()
    numbers = []
    for number in string_input:
        numbers.append(int(number))
    k = float(input())
    print(calc(numbers, k))
