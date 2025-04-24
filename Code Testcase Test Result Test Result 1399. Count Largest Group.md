# LeetCode 1399: Count Largest Group

## 🧩 Problem Description  

You are given an integer `n`. Each number from 1 to `n` is grouped according to the **sum of its digits**. Your task is to return the **number of groups that have the largest size**.

### 🔍 Example 1:

```
Input: n = 13
Output: 4
Explanation: 
There are 9 groups:
[1, 10], [2, 11], [3, 12], [4, 13], [5], [6], [7], [8], [9].
Groups with the largest size have 2 elements: [1, 10], [2, 11], [3, 12], [4, 13]
Total such groups: 4
```

### 🔍 Example 2:

```
Input: n = 2
Output: 2
Explanation: 
There are 2 groups: [1], [2]. Both have size 1.
```

### ✅ Constraints:
- `1 <= n <= 10^4`

---

## 🧠 Approach

- For each number from `1` to `n`, calculate the **sum of its digits**.
- Use a HashMap to store the **frequency** of each digit-sum group.
- Keep track of the **maximum group size**.
- Count how many groups have this **maximum size**.

---

## 💻 Code (Java)

```java
class Solution {
    public int countLargestGroup(int n) {
        Map<Integer, Integer> hashMap = new HashMap<Integer, Integer>();
        int maxValue = 0;
        for (int i = 1; i <= n; ++i) {
            int key = 0, i0 = i;
            while (i0 != 0) {
                key += i0 % 10;
                i0 /= 10;
            }
            hashMap.put(key, hashMap.getOrDefault(key, 0) + 1);
            maxValue = Math.max(maxValue, hashMap.get(key));
        }
        int count = 0;
        for (Map.Entry<Integer, Integer> kvpair : hashMap.entrySet()) {
            if (kvpair.getValue() == maxValue) {
                ++count;
            }
        }
        return count;
    }
}
```

---

## 🏁 Complexity

- **Time Complexity**: O(n * d) where `d` is the number of digits (at most log₁₀n), since we compute digit sums for each number.
- **Space Complexity**: O(n), for storing frequency of each digit sum.

---

## 📂 Tags

`HashMap` | `Counting` | `Digit Sum`

---

