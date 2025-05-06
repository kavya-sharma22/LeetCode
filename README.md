
# 1920. Build Array from Permutation

## Problem Statement

Given a **zero-based permutation** `nums` (0-indexed), build an array `ans` of the same length such that:

```
ans[i] = nums[nums[i]]
```

for each `0 <= i < nums.length`, and return it.

A **zero-based permutation** is an array of **distinct integers** from `0` to `nums.length - 1` (inclusive).

---

## Example 1

**Input:**  
`nums = [0,2,1,5,3,4]`  
**Output:**  
`[0,1,2,4,5,3]`  

**Explanation:**  
```
ans = [nums[nums[0]], nums[nums[1]], ..., nums[nums[5]]]
    = [nums[0], nums[2], nums[1], nums[5], nums[3], nums[4]]
    = [0, 1, 2, 4, 5, 3]
```

---

## Example 2

**Input:**  
`nums = [5,0,1,2,3,4]`  
**Output:**  
`[4,5,0,1,2,3]`  

**Explanation:**  
```
ans = [nums[nums[0]], nums[nums[1]], ..., nums[nums[5]]]
    = [nums[5], nums[0], nums[1], nums[2], nums[3], nums[4]]
    = [4, 5, 0, 1, 2, 3]
```

---

## Constraints

- `1 <= nums.length <= 1000`
- `0 <= nums[i] < nums.length`
- All elements in `nums` are **distinct**

---

## Java Solution

```java
class Solution {
    public int[] buildArray(int[] nums) {
        int n = nums.length;
        int[] ans = new int[n];
        for (int i = 0; i < n; ++i) {
            ans[i] = nums[nums[i]];
        }
        return ans;
    }
}
```

---

## Complexity Analysis

- **Time Complexity:** O(n)  
  We iterate through the `nums` array once, accessing each element and its mapped index in constant time.

- **Space Complexity:** O(n)  
  We create a new array `ans` of the same size as `nums` to store the result.

---

## Follow-Up: O(1) Space Solution

To solve the problem **in-place (O(1) additional space)**, we can encode both the original and new value into each element of the original array using modular arithmetic. This approach is more advanced and leverages the constraint that all elements are less than `n`.

---
