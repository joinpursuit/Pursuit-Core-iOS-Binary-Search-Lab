import Foundation

//

// 1. Find if an element is contained within a sorted array in O(log(n)) time.  Do not use recursion.

func binarySearch<T: Comparable>(arr: [T], target: T) -> Bool {

     var leftIndex = 0
     var rightIndex = arr.count - 1

     while leftIndex <= rightIndex {
         let midIndex = (leftIndex + rightIndex) / 2
         let midValue = arr[midIndex]
         if midValue == target {
             return true
         } else if midValue > target {
             rightIndex = midIndex - 1
         } else {
             leftIndex = midIndex + 1
         }
     }
    return false
}

// 2. Find if an element is contained within a sorted array in O(log(n)) time.  Use recursion.

func recursiveBinarySearch<T: Comparable>(arr: [T],
                                 target: T,
                                 range: Range<Int>? = nil,
                                 numberOfOperations: Int = 1) -> Bool {
    let searchRange: Range<Int>
    if let range = range {
        searchRange = range
    } else {
        searchRange = (0..<arr.endIndex)
    }
    
    if searchRange.lowerBound >= searchRange.upperBound {
        return false
    }
    
    let middleIndex = (searchRange.lowerBound + searchRange.upperBound) / 2
    
    if target == arr[middleIndex] {
        return true
    } else if target < arr[middleIndex] {
        return recursiveBinarySearch(arr: arr,
                            target: target,
                            range: searchRange.lowerBound..<middleIndex,
                            numberOfOperations: numberOfOperations + 1)
    } else {
        return recursiveBinarySearch(arr: arr,
                            target: target,
                            range: (middleIndex + 1)..<searchRange.upperBound,
                            numberOfOperations: numberOfOperations + 1)
    }
}

// https://www.interviewbit.com/problems/matrix-search/

// 3. Find if a value is contained in a matrix of dimensions m x n. This matrix has the following properties:

// Integers in each row are sorted from left to right.
// The first integer of each row is greater than or equal to the last integer of the previous row.

func contains(value: Int, in arr: [[Int]]) -> Bool {
    var minRowIndex = 0
    var maxRowIndex = arr.count - 1
    while minRowIndex < maxRowIndex {
        let middleRowIndex = (minRowIndex + maxRowIndex) / 2
        if arr[middleRowIndex][0] == value {
            return true
        } else if value < arr[middleRowIndex][0] {
            maxRowIndex = minRowIndex - 1
        } else if value > arr[middleRowIndex][0] {
            minRowIndex = middleRowIndex + 1
        }
    }
    let targetArr = arr[minRowIndex]
    return recursiveBinarySearch(arr: targetArr, target: value)
}



// https://www.techiedelight.com/find-first-or-last-occurrence-of-a-given-number-sorted-array/
// 4. Given a sorted array of integers, find the index of the last occurrence of a given number.  Your solution should work in O(log(n)) time

func lastOccurrence<T: Comparable>(of value: T, in arr: [T]) -> Int? {
    var result: Int?

    if arr.count == 0 {
        return nil
    }

    var leftIndex = 0
    var rightIndex = arr.count - 1

    while(leftIndex <= rightIndex) {
        let midIndex = (leftIndex + rightIndex)/2

        if arr[midIndex] == value {
            result = midIndex
            leftIndex = midIndex + 1
        }

        else if arr[midIndex] > value{
            rightIndex = midIndex - 1
        }

        else {
            leftIndex = midIndex + 1
        }

    }
    return result
}

// https://www.techiedelight.com/find-smallest-missing-element-sorted-array/
// 5. Given a sorted array of distinct non-negative integers, find the smallest missing number.  Your solution should work in O(log(n)) time

func smallestMissingNumber(in arr: [Int]) -> Int {
        var leftIndex = 0
        var rightIndex = arr.count - 1

        while(leftIndex <= rightIndex) {
            let midIndex = (leftIndex + rightIndex)/2

            if arr[midIndex] == midIndex {
                leftIndex = midIndex + 1
            } else {
                rightIndex = midIndex - 1
            }
        }
   
        if leftIndex > rightIndex{
            return leftIndex
        } else {
            return rightIndex
        }
}
