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
Complexity Analysis
Time Complexity:
findPartitions function:
The time complexity of findPartitions is exponential, with a maximum of 
𝑂
(
2
𝑚
)
O(2 
m
 ) possible partitions where m is the number of digits in the squared number. For each digit, we have two choices: partition or not partition.
Additionally, memoization helps prune unnecessary recursive calls, but in the worst case, it still results in an exponential time complexity.
punishmentNumber function:
We loop through all integers i from 1 to n, so the overall complexity for this loop is 
𝑂
(
𝑛
)
O(n).
For each number i, we calculate its square and check all possible partitions using findPartitions, which has a time complexity of 
𝑂
(
2
𝑚
)
O(2 
m
 ), where m is the number of digits in 
𝑖
2
i 
2
 .
In the worst case, when n = 1000, the largest number we square is 
1000
2
=
1000000
1000 
2
 =1000000, which has 7 digits. Therefore, the time complexity per number is roughly 
𝑂
(
2
7
)
O(2 
7
 ), or 128.
Combining these, the overall time complexity is approximately:
𝑂
(
𝑛
×
2
𝑚
)
where
𝑚
=
7
(maximum number of digits in 
𝑖
2
)
O(n×2 
m
 )wherem=7(maximum number of digits in i 
2
 )
This simplifies to 
𝑂
(
𝑛
)
O(n) with a constant factor of 
𝑂
(
2
7
)
O(2 
7
 ).
Space Complexity:
Memoization storage: We use a 2D memoization array with dimensions 
𝑚
×
(
𝑡
𝑎
𝑟
𝑔
𝑒
𝑡
+
1
)
m×(target+1), where m is the number of digits in 
𝑖
2
i 
2
  and target is the integer i. This gives a space complexity of 
𝑂
(
𝑚
×
(
𝑖
+
1
)
)
O(m×(i+1)), where m is the number of digits in 
𝑖
2
i 
2
  and i is the integer.
For the worst case when n = 1000 and the square of i has 7 digits, the space complexity per call is 
𝑂
(
7
×
(
𝑖
+
1
)
)
O(7×(i+1)), which simplifies to 
𝑂
(
𝑛
)
O(n).
Thus, the space complexity is 
𝑂
(
𝑛
×
𝑚
)
O(n×m), where m is the number of digits in the largest square number.

Conclusion
This solution efficiently computes the punishment number using dynamic programming and memoization, handling even larger inputs like n = 1000 within acceptable time limits.

markdown
Copy

### Key Sections:
- **Problem Overview**: A brief explanation of the problem.
- **Example Inputs and Outputs**: Sample inputs and their corresponding outputs.
- **Solution**: The Java solution code with detailed explanations of the logic.
- **Complexity Analysis**: Detailed analysis of time and space complexity of the solution.
