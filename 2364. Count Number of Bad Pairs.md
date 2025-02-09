# Count Number of Bad Pairs (LeetCode 2364)

## Problem Statement

You are given a 0-indexed integer array nums. A pair of indices (i, j) is a bad pair if:

- i < j
- j - i != nums[j] - nums[i]

Return the total number of bad pairs in nums.

### Example 1:

**Input:**

```
nums = [4,1,3,3]
```

**Output:**

```
5
```

**Explanation:**

The bad pairs are:

- (0, 1): 1 - 0 != 1 - 4 (1 ≠ -3)
- (0, 2): 2 - 0 != 3 - 4 (2 ≠ -1)
- (0, 3): 3 - 0 != 3 - 4 (3 ≠ -1)
- (1, 2): 2 - 1 != 3 - 1 (1 ≠ 2)
- (2, 3): 3 - 2 != 3 - 3 (1 ≠ 0)

Total bad pairs = 5

### Example 2:

**Input:**

```
nums = [1,2,3,4,5]
```

**Output:**

```
0
```

**Explanation:**

All pairs satisfy j - i == nums[j] - nums[i], so there are no bad pairs.

## Solution Approach

We can solve this problem efficiently using a hashmap (HashMap in Java).

### Key Observations:

- If (i, j) is a **good pair**, it satisfies:

  ```
  j - i == nums[j] - nums[i]
  ```

  Rearranging this:

  ```
  j - nums[j] == i - nums[i]
  ```

- We define `diff = i - nums[i]`, and if two indices have the same `diff`, they form a **good pair**.

- The **total pairs** in the array is:

  ```
  (n * (n - 1)) / 2
  ```

- We count the **good pairs** using a **HashMap** that tracks occurrences of `diff`.

- The number of **bad pairs** is calculated as:

  ```
  badPairs = totalPairs - goodPairs
  ```

## Java Solution

```java
import java.util.HashMap;
import java.util.Map;

class Solution {
    public long countBadPairs(int[] nums) {
        long badPairs = 0;
        Map<Integer, Integer> diffCount = new HashMap<>();

        for (int pos = 0; pos < nums.length; pos++) {
            int diff = pos - nums[pos];

            // Count of previous positions with the same difference
            int goodPairsCount = diffCount.getOrDefault(diff, 0);

            // Total possible pairs minus good pairs = bad pairs
            badPairs += pos - goodPairsCount;

            // Update count of positions with this difference
            diffCount.put(diff, goodPairsCount + 1);
        }

        return badPairs;
    }
}
```

## Complexity Analysis

- **Time Complexity:** `O(n)`, as we iterate through `nums` once and use a **HashMap** for quick lookups.
- **Space Complexity:** `O(n)`, since we store the count of differences in a **HashMap**.

This solution ensures we efficiently count **bad pairs** in `O(n)` time instead of a brute-force `O(n^2)` approach.
