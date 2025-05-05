# Domino and Tromino Tiling

## Problem
You are given two types of tiles:
- A 2 x 1 domino tile
- An "L" shaped tromino tile, which can be rotated

Your goal is to determine the number of ways to tile a 2 x `n` board using these tiles. The result can be large, so return the answer modulo $10^9 + 7$.

A tiling is valid if:
- Every square on the 2 x n board is covered exactly once.
- Two tilings are considered different if and only if there is at least one pair of 4-directionally adjacent cells such that exactly one of the tilings covers both cells with a single tile.

### Example
**Input:** `n = 3`

**Output:** `5`

**Explanation:**
The five ways to tile a 2 x 3 board include different combinations of vertical/horizontal dominoes and trominoes.

### Constraints
- 1 <= n <= 1000

---

## Solution Explanation
This problem is a variation of dynamic programming tiling problems. The idea is to use DP to count the number of valid ways to tile up to a length `n`.

### State Definition
Let `dp[i]` be the number of ways to tile a 2 x `i` board.

### Base Cases
```
dp[0] = 1    // one way to tile an empty board
dp[1] = 1    // only vertical domino
dp[2] = 2    // two vertical dominoes or two horizontal dominoes
dp[3] = 5    // five combinations using dominoes and trominoes
```

### Recurrence Relation
From `i >= 4`, the number of ways to tile can be derived from previous configurations:
```
dp[i] = 2 * dp[i - 1] + dp[i - 3]
```
This captures the new ways introduced by adding a domino or a tromino to the previous configurations.

### Modulo
We use `MOD = 1_000_000_007` to prevent integer overflow.

---

## Java Implementation
```java
class Solution {
    public int numTilings(int n) {
        final int MOD = 1_000_000_007;

        if (n == 1) return 1;
        if (n == 2) return 2;
        if (n == 3) return 5;

        long[] dp = new long[n + 1];
        dp[0] = 1;
        dp[1] = 1;
        dp[2] = 2;
        dp[3] = 5;

        for (int i = 4; i <= n; i++) {
            dp[i] = (2 * dp[i - 1] % MOD + dp[i - 3]) % MOD;
        }

        return (int) dp[n];
    }
}
```

---

## Time and Space Complexity
- **Time Complexity:** O(n)
- **Space Complexity:** O(n) (can be reduced to O(1) using only the last few values)

---

## Tags
`Dynamic Programming` `Tiling` `Math` `Medium`

---

## Related Problems
- Tiling a Rectangle with the Fewest Squares
- Domino and Tromino Tiling (LeetCode 790)