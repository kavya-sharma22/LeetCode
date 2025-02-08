# Number Container System

## Problem Description

The task is to design a **Number Container System** that can store numbers at specific indices and allow for inserting or replacing numbers at these indices. Additionally, the system should allow you to retrieve the smallest index for a given number.

### Functionalities:

1. **`change(int index, int number)`**: This function will fill the container at the given index with the given number. If there is already a number at that index, it will replace it with the new number.

2. **`find(int number)`**: This function will return the smallest index that is filled with the given number. If there is no index filled with that number, return -1.

### Example Walkthrough

Consider the following sequence of operations:

plaintext
["NumberContainers", "find", "change", "change", "change", "change", "find", "change", "find"]
[[], [10], [2, 10], [1, 10], [3, 10], [5, 10], [10], [1, 20], [10]]

```Code :
class NumberContainers {

    // Maps from number to set of indices and from index to number
    private Map<Integer, TreeSet<Integer>> numberToIndices;
    private Map<Integer, Integer> indexToNumbers;

    // Constructor
    public NumberContainers() {
        // Initialize the data structures
        numberToIndices = new HashMap<>();
        indexToNumbers = new HashMap<>();
    }

    public void change(int index, int number) {
        // If index already has a number, remove it from the old number's index set
        if (indexToNumbers.containsKey(index)) {
            int previousNumber = indexToNumbers.get(index);
            numberToIndices.get(previousNumber).remove(index);
            if (numberToIndices.get(previousNumber).isEmpty()) {
                numberToIndices.remove(previousNumber);
            }
        }
        // Update the number and add the index to the new number's set
        indexToNumbers.put(index, number);
        numberToIndices.putIfAbsent(number, new TreeSet<>());
        numberToIndices.get(number).add(index);
    }

    public int find(int number) {
        // Return the smallest index for the given number, or -1 if not found
        if (numberToIndices.containsKey(number)) {
            return numberToIndices.get(number).first(); // Get the smallest index
        }
        return -1;
    }
}
/**
 * Your NumberContainers object will be instantiated and called as such:
 * NumberContainers obj = new NumberContainers();
 * obj.change(index, number);
 * int param_2 = obj.find(number);
 */
