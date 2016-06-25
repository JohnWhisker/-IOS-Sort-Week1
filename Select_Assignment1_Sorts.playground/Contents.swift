//: Playground - noun: a place where people can play

import UIKit
import Darwin
// Quick Sort algorithm written in Swift's style
func quickSortSwift<T: Comparable>(list: [T])->[T]{
    guard list.count>1 else {return list}
    let privot = list[list.count/2]
    let less = list.filter {$0 < privot}
    let equal = list.filter {$0 == privot}
    let greater = list.filter {$0 > privot}
    
    return quickSortSwift(less) + equal + quickSortSwift(greater);
    
}

// Selection Sort algorithm written in Swift's style
func selectionSort(list: [Int]) ->[Int]{
    guard list.count > 1 else {return list}
    
    var a = list
    for x in 0..<a.count-1{
        var lowest = x
        for y in x + 1 ..< a.count {
            if a[y] < a[lowest]{
                lowest = y;
            }
        }
        
        if x != lowest{
            a.swap(x, index2: lowest)
        }
    }
    return a;
}

// Merge Sort algorithm written in Swift's style
func mergeSortSwift(list: [Int])->[Int]{
    guard list.count > 1 else {return list}
    
    let middleIndex = list.count/2
    let leftArray = mergeSortSwift(Array(list[0..<middleIndex]))
    let rightArray = mergeSortSwift(Array(list[middleIndex..<list.count]))
    
    return merge(leftPile:leftArray, rightPile: rightArray)
}

// Merge function
func merge(leftPile leftPile:[Int],rightPile: [Int])->[Int]{
    var leftIndex = 0;
    var rightIndex = 0;
    
    var orderedPile = [Int]()
    
    while leftIndex < leftPile.count && rightIndex < rightPile.count{
        if leftPile[leftIndex] < rightPile[rightIndex]{
            orderedPile.append(leftPile[leftIndex])
            leftIndex+=1
        } else if leftPile[leftIndex] > rightPile[rightIndex]{
            orderedPile.append(rightPile[rightIndex])
            rightIndex+=1
        } else {
            orderedPile.append(leftPile[leftIndex])
            leftIndex+=1
            orderedPile.append(rightPile[rightIndex])
            rightIndex+=1
        }
    }
    
    while leftIndex<leftPile.count {
        orderedPile.append(leftPile[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex<rightPile.count{
        orderedPile.append(rightPile[rightIndex])
        rightIndex += 1
    }
    
    return orderedPile
}

// -- MARK: Swap function for array
extension Array{
    mutating func swap(index1:Int,index2:Int){
        guard self.count > 0 else {return }
        let temp = self[index1]
        self[index1]=self[index2]
        self[index2]=temp
    }
}

func generateRandom(inout list:[Int],size: Int){
    for _ in 0..<size {
        let randomValue = arc4random_uniform(100)
        list.append(Int(randomValue))
    }
}
var list: [Int] = []

generateRandom(&list, size: 101)

selectionSort(list)

mergeSortSwift(list)

quickSortSwift(list)
