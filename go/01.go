// Taken from: http://stackoverflow.com/questions/27984992/kth-from-the-last-element-in-a-list-using-golang

package main    
import (
    "container/list"
    "fmt"
)

// This is a very stupid way of doing this problem, but it illustrates
// some a different way of thinking than previous iterations and is
// therefore a bit more interesting.
func main() {
	// Here inside main() we will first create a list of 10
	// elements from 1 .. 10
	l := list.New()
	fmt.Println("Setting up the list.")
	for i := 1; i <= 10; i++ {
		j := i * 72
		fmt.Println("Adding the ", i, "th element to the list.")
		l.PushBack(j)
		fmt.Println("The element is: ", l.Back())
	}
	// There are the 10 elements, lets print the result
	// I presume the notation is telling me the memory addresses
	// of the beginning->end and the number of elements.
	fmt.Println("Here is the list: ", l)
	// Now make last_element from the result of find_last()
	fmt.Println("find_last takes an element of the list, and two copies of the wrapper object.")
	fmt.Println("In the body of find_last, we will update the wrappers to maintain some interesting state information.")
	last_element := find_last(l.Front(), &wrapper_obj{0,0,l.Front()}, &wrapper_obj{0,0,l.Front()})
	// Once find_last returns an element, lets take it apart and extract the value.
	last_value := last_element.Value.(int)
	// And print that value to the user
	fmt.Println("The answer is: ", last_value)
}

// The wrapper_obj is holding a counter, the value of the current
// element of  the list, and a list element.  This is highly
// redundant, but kind of fun.
type wrapper_obj struct {
	count int
	current int
	node *list.Element
}

//recursive function to find the last element of a list
func find_last(head *list.Element, wrapper *wrapper_obj, last *wrapper_obj) *list.Element {
	fmt.Println("In find_lst, head is: ", head)
	fmt.Println("The head contains 3 addresses and current value.")
	if head == nil {
		fmt.Println("The answer to the question is being kept in two places: last.current and last.node.Value.(int).")
		fmt.Println("Here is the first way of getting the answer: ", last.current)
		fmt.Println("But this function is supposed to return a list.Element, so we will return: ", last.node)
		return last.node
	} else {
		fmt.Println("We haven't reached the end of the list yet.")
		fmt.Println("So update last with the current state with last = wrapper.")
		last = wrapper
		fmt.Println("And update wrapper with a new count+1, value, and node.")
		wrapper.count = (wrapper.count) + 1
		wrapper.current = head.Value.(int)
		wrapper.node = head
		fmt.Println("Finally, recurse find_last(head.Next(), the new wrapper, and last)")
		find_last(head.Next(), wrapper, last)
	}
	return last.node
}
