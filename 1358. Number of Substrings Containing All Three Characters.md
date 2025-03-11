# Number of Substrings Containing All Three Characters

This repository contains a solution to the LeetCode problem **1358. Number of Substrings Containing All Three Characters**.

## Problem Statement
Given a string `s` consisting only of characters `a`, `b`, and `c`, return the number of substrings containing at least one occurrence of all these characters `a`, `b`, and `c`.

### Example 1:
**Input:** `s = "abcabc"`  
**Output:** `10`  
**Explanation:** The substrings containing all three characters are:
- "abc", "abca", "abcab", "abcabc", "bca", "bcab", "bcabc", "cab", "cabc", and "abc" (again).

### Example 2:
**Input:** `s = "aaacb"`  
**Output:** `3`  
**Explanation:** The substrings containing all three characters are:
- "aaacb", "aacb", and "acb".

### Example 3:
**Input:** `s = "abc"`  
**Output:** `1`  

## Constraints
- `3 <= s.length <= 5 x 10^4`
- `s` only consists of `a`, `b`, or `c` characters.

---

## Solution
The solution uses the **sliding window technique** to efficiently count valid substrings.

### Code Implementation
```java
class Solution {

    public int numberOfSubstrings(String s) {
        int len = s.length();
        int left = 0, right = 0;
        // Track frequency of a, b, c
        int[] freq = new int[3];
        int total = 0;

        while (right < len) {
            // Add character at right pointer to frequency array
            char curr = s.charAt(right);
            freq[curr - 'a']++;

            // While we have all required characters
            while (hasAllChars(freq)) {
                // All substrings from current window to end are valid
                total += len - right;

                // Remove leftmost character and move left pointer
                char leftChar = s.charAt(left);
                freq[leftChar - 'a']--;
                left++;
            }

            right++;
        }

        return total;
    }

    private boolean hasAllChars(int[] freq) {
        // Check if we have at least one of each character
        return freq[0] > 0 && freq[1] > 0 && freq[2] > 0;
    }
}
```

---

## Explanation
### Algorithm
1. **Initialize Pointers:** Start with two pointers, `left` and `right` at the beginning of the string.
2. **Frequency Array:** Create an array `freq` to track the count of `a`, `b`, and `c`.
3. **Expand the Window:** Iterate with the `right` pointer, adding characters to the frequency array.
4. **Check for Valid Substrings:** Whenever the frequency array contains all three characters, count all valid substrings starting from `left` to the end of the string.
5. **Shrink the Window:** Move the `left` pointer forward to check for additional combinations.
6. **Return Result:** The `total` count will be the number of valid substrings.

### Complexity Analysis
- **Time Complexity:** `O(n)` — Each character is processed at most twice (once when added and once when removed).
- **Space Complexity:** `O(1)` — Only a fixed-size frequency array is used.

---

## How to Run
1. Clone the repository:
```bash
git clone https://github.com/your-username/number-of-substrings.git
```
2. Navigate to the project directory:
```bash
cd number-of-substrings
```
3. Compile and run the code:
```bash
javac Solution.java
java Solution
```

---

## Contribution
Feel free to fork the repository, open an issue, or submit a pull request for improvements and additional features.

---

## License
This project is licensed under the MIT License.

