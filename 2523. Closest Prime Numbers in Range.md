# Leetcode Problem 2523: Closest Prime Numbers in Range

## Problem Description

Given two positive integers `left` and `right`, find the two integers `num1` and `num2` such that:

- `left <= num1 < num2 <= right`
- Both `num1` and `num2` are **prime numbers**.
- `num2 - num1` is the **minimum** amongst all other pairs satisfying the above conditions.

### Return
- An array `ans = [num1, num2]`.
- If there are multiple pairs satisfying these conditions, return the one with the smallest `num1` value.
- If no such numbers exist, return `[-1, -1]`.

---

## Example 1

```
Input: left = 10, right = 19
Output: [11, 13]
Explanation: The prime numbers between 10 and 19 are 11, 13, 17, and 19.
The closest gap between any pair is 2, which can be achieved by [11,13] or [17,19].
Since 11 is smaller than 17, we return the first pair.
```

## Example 2

```
Input: left = 4, right = 6
Output: [-1, -1]
Explanation: There exists only one prime number in the given range, so the conditions cannot be satisfied.
```

---

## Constraints

- \(1 \leq left \leq right \leq 10^6\)

---

## Approach

### Step 1 - Sieve of Eratosthenes
To efficiently find prime numbers in the range [left, right], we first generate a **sieve** array up to `right`. 
This array marks numbers as:
- `1` if the number is prime
- `0` if the number is not prime

### Step 2 - Collect Primes in Range
Using the sieve, we collect all prime numbers in the range [left, right] into a list.

### Step 3 - Find Closest Pair
We iterate through the list of primes and calculate the **gaps** between consecutive primes.
- Track the smallest gap.
- Track the corresponding prime pair with the smallest gap.

If no valid pair is found (less than 2 primes), return `[-1, -1]`.

---

## Code

```java
class Solution {

    public int[] closestPrimes(int left, int right) {
        // Step 1: Get all prime numbers up to 'right' using sieve
        int[] sieveArray = sieve(right);

        List<Integer> primeNumbers = new ArrayList<>();
        for (int num = left; num <= right; num++) {
            if (sieveArray[num] == 1) {
                primeNumbers.add(num);
            }
        }

        // Step 2: Find the closest prime pair
        if (primeNumbers.size() < 2) return new int[] { -1, -1 };

        int minDifference = Integer.MAX_VALUE;
        int[] closestPair = new int[2];
        Arrays.fill(closestPair, -1);

        for (int index = 1; index < primeNumbers.size(); index++) {
            int difference = primeNumbers.get(index) - primeNumbers.get(index - 1);
            if (difference < minDifference) {
                minDifference = difference;
                closestPair[0] = primeNumbers.get(index - 1);
                closestPair[1] = primeNumbers.get(index);
            }
        }

        return closestPair;
    }

    private int[] sieve(int upperLimit) {
        int[] sieve = new int[upperLimit + 1];
        Arrays.fill(sieve, 1);
        sieve[0] = 0;
        sieve[1] = 0;

        for (int number = 2; number * number <= upperLimit; number++) {
            if (sieve[number] == 1) {
                for (int multiple = number * number; multiple <= upperLimit; multiple += number) {
                    sieve[multiple] = 0;
                }
            }
        }
        return sieve;
    }
}
```

---

## Complexity

| Time Complexity | Space Complexity |
|---|---|
| **O(n log log n)** for Sieve | **O(n)** for Sieve array |

- Finding the primes takes **O(n log log n)** using the Sieve of Eratosthenes.
- Collecting primes and finding closest pairs is **O(n)**.

---

## Summary

This is a **prime number sieve-based problem** with additional logic to find the **closest consecutive prime pair** within a given range.

