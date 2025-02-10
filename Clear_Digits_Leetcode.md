# Clear Digits (LeetCode 3174)

## Problem Statement

You are given a string `s`.

Your task is to remove all digits by doing this operation repeatedly:

- Delete the first digit and the closest non-digit character to its left.

Return the resulting string after removing all digits.

### Example 1:

**Input:**

```
s = "abc"
```

**Output:**

```
"abc"
```

**Explanation:** There is no digit in the string.

### Example 2:

**Input:**

```
s = "cb34"
```

**Output:**

```
""
```

**Explanation:**

- First, we apply the operation on `s[2]`, and `s` becomes `"c4"`.
- Then we apply the operation on `s[1]`, and `s` becomes `""`.

## Constraints:

- `1 <= s.length <= 100`
- `s` consists only of lowercase English letters and digits.
- The input is generated such that it is possible to delete all digits.

---

## Solution Approach

We can efficiently solve this problem using a `StringBuilder` to manipulate the string dynamically.

### Key Observations:

1. Traverse the string while looking for digits.
2. When a digit is found, remove it and the closest non-digit character to its left.
3. Use a `StringBuilder` to efficiently modify the string in-place.

### Java Solution

```java
import java.util.*;

class Solution {
    public String clearDigits(String s) {
        int charIndex = 0;
        StringBuilder sb = new StringBuilder(s);
        
        // Until we reach the end of the string
        while (charIndex < sb.length()) {
            if (Character.isDigit(sb.charAt(charIndex))) {
                // Remove the digit from the string
                sb.deleteCharAt(charIndex);
                // If there is a character to the left of the digit, remove it
                if (charIndex > 0) {
                    sb.deleteCharAt(charIndex - 1);
                    // Adjust the index to account for the removed character
                    charIndex--;
                }
            } else {
                // Move to the next character if it's not a digit
                charIndex++;
            }
        }
        return sb.toString();
    }
}
```

## Complexity Analysis

- **Time Complexity:** `O(n)`, since we traverse the string once and perform deletions efficiently using `StringBuilder`.
- **Space Complexity:** `O(n)`, since `StringBuilder` stores the modified string.

This approach ensures that we efficiently remove digits and their closest non-digit characters while maintaining optimal performance.

---

Stay consistent and happy coding! 🚀
