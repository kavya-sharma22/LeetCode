
# LeetCode 2460: Apply Operations to an Array

This repository contains the solution for [LeetCode Problem 2460 - Apply Operations to an Array](https://leetcode.com/problems/apply-operations-to-an-array/).

## Problem Statement

You are given a **0-indexed** array `nums` of size `n` consisting of non-negative integers.

You need to apply `n - 1` operations to this array where, in the `i-th` operation (0-indexed), you will apply the following to the `i-th` element of `nums`:

- If `nums[i] == nums[i + 1]`, then multiply `nums[i]` by `2` and set `nums[i + 1]` to `0`. Otherwise, skip this operation.

After performing all the operations, shift all the `0`s to the end of the array.

### Example 1

```
Input: nums = [1,2,2,1,1,0]
Output: [1,4,2,0,0,0]
```

### Example 2

```
Input: nums = [0,1]
Output: [1,0]
```

### Constraints

- `2 <= nums.length <= 2000`
- `0 <= nums[i] <= 1000`

---

## Solution Explanation

This Java solution processes the array in two phases:

### Phase 1: Apply Operations

- Iterate through the array and for each pair of consecutive elements:
    - If `nums[i]` is equal to `nums[i+1]`, double `nums[i]` and set `nums[i+1]` to zero.

### Phase 2: Shift Non-zero Elements

- Create a new array.
- Copy all non-zero elements into the new array.
- Fill the rest of the array with zeros to maintain the original array length.

---

## Code

```java
class Solution {

    public int[] applyOperations(int[] nums) {
        int n = nums.length;
        int[] modifiedNums = new int[n];
        int zeroCount = 0;

        // Step 1: Apply operations on the array
        for (int index = 0; index < n - 1; index++) {
            if (nums[index] == nums[index + 1] && nums[index] != 0) {
                nums[index] *= 2;
                nums[index + 1] = 0;
            }
        }

        // Step 2: Move non-zero elements to the front
        for (int num : nums) {
            if (num != 0) {
                modifiedNums[zeroCount++] = num;
            }
        }

        // Step 3: Append zeros to maintain the original size
        while (zeroCount < n) {
            modifiedNums[zeroCount++] = 0;
        }

        return modifiedNums;
    }
}
```

---

## Time Complexity

- Applying operations: `O(n)`
- Moving non-zero elements: `O(n)`

**Overall Time Complexity: `O(n)`**

---

## Space Complexity

- `O(n)` for the `modifiedNums` array.

---

## Links

- [LeetCode Problem Link](https://leetcode.com/problems/apply-operations-to-an-array/)

---

## Author

- Your Name (or GitHub username)

