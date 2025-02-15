# Punishment Number of an Integer

## Problem Statement

The punishment number of a positive integer `n` is the sum of the squares of all integers `i` such that:

1. \( 1 \leq i \leq n \)
2. The decimal representation of \( i^2 \) can be partitioned into contiguous substrings such that the sum of the integer values of these substrings equals `i`.

### Example 1:

**Input**: `n = 10`

**Output**: `182`

**Explanation**:
There are exactly 3 integers `i` in the range `[1, 10]` that satisfy the conditions:
- `1` since \( 1^2 = 1 \)
- `9` since \( 9^2 = 81 \) and `81` can be partitioned into `8` and `1` with a sum equal to `8 + 1 == 9`
- `10` since \( 10^2 = 100 \) and `100` can be partitioned into `10` and `0` with a sum equal to `10 + 0 == 10`

Hence, the punishment number of `10` is `1 + 81 + 100 = 182`.

### Example 2:

**Input**: `n = 37`

**Output**: `1478`

**Explanation**:
There are exactly 4 integers `i` in the range `[1, 37]` that satisfy the conditions:
- `1` since \( 1^2 = 1 \)
- `9` since \( 9^2 = 81 \) and `81` can be partitioned into `8 + 1`
- `10` since \( 10^2 = 100 \) and `100` can be partitioned into `10 + 0`
- `36` since \( 36^2 = 1296 \) and `1296` can be partitioned into `1 + 29 + 6`

Hence, the punishment number of `37` is `1 + 81 + 100 + 1296 = 1478`.

## Solution

The solution involves checking if we can partition the square of each number from `1` to `n` into contiguous substrings that sum to the number itself. This is done using dynamic programming with memoization to efficiently explore all possible partitions.

### Code

```java
class Solution {

    public boolean findPartitions(
        int startIndex,
        int sum,
        String stringNum,
        int target,
        int[][] memo
    ) {
        if (startIndex == stringNum.length()) {
            return sum == target;
        }

        if (sum > target) return false;

        if (memo[startIndex][sum] != -1) return memo[startIndex][sum] == 1;

        boolean partitionFound = false;

        for (int currentIndex = startIndex; currentIndex < stringNum.length(); currentIndex++) {
            String currentString = stringNum.substring(startIndex, currentIndex + 1);
            int addend = Integer.parseInt(currentString);

            partitionFound = partitionFound || findPartitions(currentIndex + 1, sum + addend, stringNum, target, memo);
            if (partitionFound) {
                memo[startIndex][sum] = 1;
                return true;
            }
        }

        memo[startIndex][sum] = 0;
        return false;
    }

    public int punishmentNumber(int n) {
        int punishmentNum = 0;
        for (int currentNum = 1; currentNum <= n; currentNum++) {
            int squareNum = currentNum * currentNum;
            String stringNum = Integer.toString(squareNum);

            int[][] memoArray = new int[stringNum.length()][currentNum + 1];
            for (int[] row : memoArray) {
                java.util.Arrays.fill(row, -1);
            }

            if (findPartitions(0, 0, stringNum, currentNum, memoArray)) {
                punishmentNum += squareNum;
            }
        }
        return punishmentNum;
    }
}
