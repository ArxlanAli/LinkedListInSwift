import UIKit

class Node{
    let value: Int
    var next:Node?
    
    init(value:Int) {
        self.value = value
        self.next = nil
    }
    init(value:Int,next:Node) {
        self.value = value
        self.next = next
    }
}

class LinkedList{
    var head:Node?
    
    init() {
        self.head = nil
    }
    
    
    func insert(value:Int){
        if head == nil{
            head = Node(value:value)
        }else{
            var node = head
            while node?.next != nil {
                node = node?.next
            }
            node?.next = Node(value: value)
        }
    }
    
    
    func insertInOrder(value:Int){
        if head != nil{
            if (head?.value)! >= value{
                //insert at start
                let newNode = Node(value: value, next: head!)
                head = newNode
            }else{
                var prevNode = head
                var node = head?.next
                while node != nil{
                    if value >= (prevNode?.value)! && value <= (node?.value)!{
                        prevNode?.next = Node(value: value, next: node!)
                        return
                    }else{
                        prevNode = node
                        node = node?.next
                    }
                }
                //insert at last
                prevNode?.next = Node(value: value)
            }
        }else{
            print("List is Empty")
        }
    }
    
    func deleteValueNode(value:Int){
        if head != nil{
            if head?.value == value{
                // first Node
                head = head?.next
            }else{
                //Other Node
                var previousNode = head
                var node = head?.next
                while node != nil {
                    if node?.value == value{
                        previousNode!.next = node?.next
                        break
                    }else{
                        previousNode = node
                        node = node?.next
                    }
                }
            }
        }else{
            print("Lisnked list is empty")
        }
    }
    
    
    
    func deleteFirstNode(){
        
        if head != nil{
            head = head?.next
        }else{
            print("Lisnked list is empty")
        }
    }
    
    func show(){
        if head != nil{
            var node = head
            while node != nil {
                print(node!.value)
                node = node?.next
            }
        }else{
            print("Lisnked list is empty")
        }
    }
    
}


let l = LinkedList()
l.insert(value: 1)
l.insert(value: 2)
//l.insert(value: 3)
l.insert(value: 4)
l.insert(value: 5)
l.insert(value: 8)
//l.insert(value: 5)
//l.insert(value: 6)
//l.deleteFirstNode()
//l.deleteValueNode(value: 5)
l.insertInOrder(value: 7)
l.show()
