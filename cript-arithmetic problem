from itertools import permutations

def is_valid_solution(words, result, letter_to_digit):
    def word_to_number(word):
        return int(''.join(str(letter_to_digit[letter]) for letter in word))
    
    sum_words = sum(word_to_number(word) for word in words)
    return sum_words == word_to_number(result)

def solve_crypt_arithmetic(words, result):
    letters = set(''.join(words) + result)
    if len(letters) > 10:
        print("Too many unique letters for a valid solution.")
        return None
    
    for perm in permutations(range(10), len(letters)):
        letter_to_digit = dict(zip(letters, perm))
        if all(letter_to_digit[word[0]] != 0 for word in words + [result]):
            if is_valid_solution(words, result, letter_to_digit):
                return letter_to_digit
    return None

def main():
    words = ["SEND", "MORE"]
    result = "MONEY"
    
    solution = solve_crypt_arithmetic(words, result)
    
    if solution:
        print("Solution found:")
        for letter, digit in solution.items():
            print(f"{letter} = {digit}")
    else:
        print("No solution exists.")

if __name__ == "__main__":
    main()
