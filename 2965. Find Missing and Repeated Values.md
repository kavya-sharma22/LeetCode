# Find Missing and Repeated Values

## Problem Statement
You are given a 0-indexed 2D integer matrix `grid` of size `n * n` with values in the range `[1, n^2]`. Each integer appears exactly once except for one number `a`, which appears twice, and another number `b`, which is missing. The task is to find the repeating and missing numbers `a` and `b`.

### Example 1:
**Input:**
```java
[[1,3],[2,2]]
```
**Output:**
```java
[2,4]
```
**Explanation:**
Number `2` is repeated, and number `4` is missing.

### Example 2:
**Input:**
```java
[[9,1,7],[8,9,2],[3,4,6]]
```
**Output:**
```java
[9,5]
```
**Explanation:**
Number `9` is repeated, and number `5` is missing.

## Solution Approach
The approach used in the solution is based on mathematical calculations:
- Compute the sum of all numbers in the grid.
- Compute the sum of squares of all numbers in the grid.
- Compare with expected sums to find the difference.
- Solve using algebraic equations to determine the missing and repeated values.

## Code Implementation
```java
class Solution {
    public int[] findMissingAndRepeatedValues(int[][] grid) {
        long sum = 0, sqrSum = 0;
        long n = grid.length;
        long total = n * n;

        // Calculate actual sum and squared sum from grid
        for (int row = 0; row < n; ++row) {
            for (int col = 0; col < n; ++col) {
                sum += grid[row][col];
                sqrSum += (long) grid[row][col] * grid[row][col];
            }
        }

        // Calculate differences from expected sums
        long sumDiff = sum - (total * (total + 1)) / 2;
        long sqrDiff = sqrSum - (total * (total + 1) * (2 * total + 1)) / 6;

        // Using math: If x is repeated and y is missing
        int repeat = (int) (sqrDiff / sumDiff + sumDiff) / 2;
        int missing = (int) (sqrDiff / sumDiff - sumDiff) / 2;

        return new int[] { repeat, missing };
    }
}
```

## Constraints
- `2 <= n == grid.length == grid[i].length <= 50`
- `1 <= grid[i][j] <= n * n`


