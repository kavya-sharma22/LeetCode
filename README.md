
# 3343. Count Number of Balanced Permutations

## Difficulty: Hard  
## Topics: Dynamic Programming, Combinatorics, Backtracking, Memoization

---

## Problem Statement

A string of digits is **balanced** if the sum of digits at even indices is equal to the sum of digits at odd indices. You are given a string `num`, and you must count the number of **distinct permutations** of `num` that are balanced.

Return the answer modulo **10⁹ + 7**.

### Example 1:
```
Input: num = "123"
Output: 2
Explanation: Balanced permutations: "132", "231"
```

### Example 2:
```
Input: num = "112"
Output: 1
Explanation: Balanced permutation: "121"
```

### Example 3:
```
Input: num = "12345"
Output: 0
Explanation: No balanced permutation exists.
```

### Constraints:
- 2 <= num.length <= 80  
- `num` consists of digits `'0'` to `'9'` only.

---

## Approach

To solve the problem efficiently, a brute-force generation of all permutations (which would be factorial time) is infeasible for long strings. Hence, we use **Dynamic Programming with Memoization and Combinatorics** to:

1. **Count the number of each digit (0-9)**.
2. Compute the **total digit sum** and check if it’s even. If it's odd, no balanced permutation is possible.
3. Use **DFS with memoization** to calculate valid balanced permutations by assigning digits to **odd and even indices**.
4. Precompute **combinations** (`nCr`) to avoid recomputation during the DFS transitions.
5. Handle duplicate digits to ensure only **distinct permutations** are counted.

---

## Explanation of the Code

- `cnt`: Frequency count of each digit from '0' to '9'.
- `target`: The sum that both even and odd indexed positions must reach (total sum / 2).
- `memo`: A 3D DP cache to avoid recomputation.
- `comb`: Binomial coefficient lookup table (combinations).
- `dfs(pos, curr, oddCnt)`: Core recursive function that assigns current digit at `pos` to odd and even indices and checks whether it's possible to balance the sum accordingly.

---

## Key Concepts

- **Balanced permutation**: Equal sum of digits at even and odd indices.
- **Combinatorics**: To count how many ways a digit can be placed at specific positions.
- **Memoization**: To cache and reuse overlapping subproblems.
- **Dynamic Programming**: For exploring the number of ways to achieve the target sum split.

---

## Code

```java
class Solution {

    private static final long MOD = 1_000_000_007;
    private long[][][] memo;
    private int[] cnt;
    private int[] psum;
    private int target;
    private long[][] comb;

    public int countBalancedPermutations(String num) {
        int tot = 0, n = num.length();
        cnt = new int[10];
        for (char ch : num.toCharArray()) {
            int d = ch - '0';
            cnt[d]++;
            tot += d;
        }
        if (tot % 2 != 0) return 0;
        target = tot / 2;
        int maxOdd = (n + 1) / 2;

        comb = new long[maxOdd + 1][maxOdd + 1];
        for (int i = 0; i <= maxOdd; i++) {
            comb[i][i] = comb[i][0] = 1;
            for (int j = 1; j < i; j++) {
                comb[i][j] = (comb[i - 1][j] + comb[i - 1][j - 1]) % MOD;
            }
        }

        psum = new int[11];
        for (int i = 9; i >= 0; i--) {
            psum[i] = psum[i + 1] + cnt[i];
        }

        memo = new long[10][target + 1][maxOdd + 1];
        for (long[][] arr2 : memo) {
            for (long[] arr1 : arr2) {
                Arrays.fill(arr1, -1);
            }
        }

        return (int) dfs(0, 0, maxOdd);
    }

    private long dfs(int pos, int curr, int oddCnt) {
        if (oddCnt < 0 || psum[pos] < oddCnt || curr > target) return 0;
        if (pos > 9) return (curr == target && oddCnt == 0) ? 1 : 0;
        if (memo[pos][curr][oddCnt] != -1) return memo[pos][curr][oddCnt];

        int evenCnt = psum[pos] - oddCnt;
        long res = 0;
        for (int i = Math.max(0, cnt[pos] - evenCnt); i <= Math.min(cnt[pos], oddCnt); i++) {
            long ways = (comb[oddCnt][i] * comb[evenCnt][cnt[pos] - i]) % MOD;
            res = (res + (ways * dfs(pos + 1, curr + i * pos, oddCnt - i)) % MOD) % MOD;
        }

        memo[pos][curr][oddCnt] = res;
        return res;
    }
}
```

---

## Author Notes

- Intermediate-level combinatorics and recursion with memoization.
- Efficiently handles up to 80-length strings due to smart pruning and caching.
- Ensure understanding of how combinations are calculated and used in the DP transitions.

---

## License

OpenAI | MIT License
