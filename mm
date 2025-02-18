# Construct Smallest Number From DI String (LeetCode 2375)

## Problem Statement
You are given a 0-indexed string `pattern` of length `n` consisting of the characters 'I' (increasing) and 'D' (decreasing).

A 0-indexed string `num` of length `n + 1` is created using the following conditions:
- `num` consists of the digits '1' to '9', where each digit is used at most once.
- If `pattern[i] == 'I'`, then `num[i] < num[i + 1]`.
- If `pattern[i] == 'D'`, then `num[i] > num[i + 1]`.

Return the lexicographically smallest possible string `num` that meets the conditions.

## Examples

### Example 1:
**Input:**
```plaintext
pattern = "IIIDIDDD"
```
**Output:**
```plaintext
"123549876"
```
**Explanation:**
- Indices 0, 1, 2, and 4 must have `num[i] < num[i+1]`.
- Indices 3, 5, 6, and 7 must have `num[i] > num[i+1]`.
- The smallest valid number satisfying the conditions is `"123549876"`.

### Example 2:
**Input:**
```plaintext
pattern = "DDD"
```
**Output:**
```plaintext
"4321"
```
**Explanation:**
- The smallest valid number is `"4321"`.

## Constraints
- `1 <= pattern.length <= 8`
- `pattern` consists only of 'I' and 'D'.

---

## Solution Approach
This solution uses **backtracking with bit masking** to recursively generate the smallest possible valid number.

### Algorithm:
1. **Recursive Function**:
   - Maintain `currentPosition`, `usedDigitsMask`, and `currentNum`.
   - Base case: If `currentPosition > pattern.length`, return `currentNum`.
2. **Digit Selection**:
   - Try all digits `1` to `9` that haven't been used.
   - Ensure the current digit follows the pattern (`I` or `D`).
3. **Minimization**:
   - Track the smallest valid number recursively.

### Code Implementation:
```java
class Solution {
    public String smallestNumber(String pattern) {
        return String.valueOf(findSmallestNumber(pattern, 0, 0, 0));
    }

    private int findSmallestNumber(String pattern, int currentPosition, int usedDigitsMask, int currentNum) {
        if (currentPosition > pattern.length()) return currentNum;

        int result = Integer.MAX_VALUE;
        int lastDigit = currentNum % 10;
        boolean shouldIncrement = currentPosition == 0 || pattern.charAt(currentPosition - 1) == 'I';

        for (int currentDigit = 1; currentDigit <= 9; ++currentDigit) {
            if ((usedDigitsMask & (1 << currentDigit)) == 0 && (currentDigit > lastDigit == shouldIncrement)) {
                result = Math.min(result, findSmallestNumber(
                    pattern, currentPosition + 1, usedDigitsMask | (1 << currentDigit), currentNum * 10 + currentDigit
                ));
            }
        }
        return result;
    }
}
```

## Complexity Analysis
- **Time Complexity:** `O(9!)` (Factorial time due to permutations of digits).
- **Space Complexity:** `O(n)`, for recursive call stack.

## Usage
1. Clone the repository.
2. Compile and run the Java file.
3. Modify the input pattern and test different cases.

## Contributions
Feel free to contribute by optimizing the algorithm or providing alternative approaches!

## License
This project is licensed under the MIT License.

