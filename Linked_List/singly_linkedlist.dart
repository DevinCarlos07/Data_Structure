// ignore_for_file: prefer_initializing_formals
class Node {
  int? data;
  Node? next;

  Node(int data) {
    this.data = data;
  }
}

class SinglyLinkedList {
  Node? head;
  Node? tail;

//add value
  void addNode(int data) {
    Node newNode = Node(data);

    if (head == null) {
      head = newNode;
    } else {
      tail!.next = newNode;
    }
    tail = newNode;
  }

  //delete a element
  void delete(int data) {
    Node? temp = head;
    Node? prev;
    if (temp != null && temp.data == data) {
      head = temp.next;
    } else {
      while (temp != null && temp.data != data) {
        prev = temp;
        temp = temp.next;
      }
      if (temp == null) {
        return;
      }
      if (temp == tail) {
        tail = prev;
        tail?.next = null;
        return;
      }
      prev?.next = temp.next;
    }
  }

// to display the list value
  void disply() {
    Node? temp = head;
    if (temp == null) {
      print('node was emplty');
    } else {
      while (temp != null) {
        print(temp.data);
        temp = temp.next;
      }
    }
  }

  void insertbefor(int before, int value) {
    Node newnode = Node(value);
    Node? prev;
    Node? current = head;
    if (current?.data == before) {
      head = newnode;
      head?.next = current;
    } else {
      while (current != null && current.data != before) {
        prev = current;
        current = current.next;
      }
      if (current == null) {
        return;
      }

      prev?.next = newnode;
      newnode.next = current;
    }
  }

  void reverse() {
    Node? current = head;
    Node? nextnode = head;
    Node? prev;
    while (current != null) {
      nextnode = current.next;
      current.next = prev;
      prev = current;
      current = nextnode;
    }
    head = prev;
  }

  void insertafter(int after, int value) {
    Node? newnode = Node(value);
    Node? temp = head;

    while (temp != null && temp.data != after) {
      temp = temp.next;
    }
    if (temp == null) {
      return;
    }
    if (temp == tail) {
      tail!.next = newnode;
      tail = newnode;
      return;
    }
    newnode.next = temp.next;
    temp.next = newnode;
  }

  void removeduplicates() {
    Node? current = head;
    while (current != null) {
      Node? next = current.next;
      while (next != null && next.data == current.data) {
        next = next.next;
      }
      current.next = next;
      if (next == tail && current.data == next?.data) {
        tail = current;
        tail?.next = null;
      }
      current = next;
    }
  }
}

void main() {
  SinglyLinkedList list = SinglyLinkedList();
  list.addNode(10);
  list.addNode(10);
  list.addNode(50);
  list.addNode(23);
  list.delete(50);
  list.insertafter(20, 100);
  list.removeduplicates();
  list.insertbefor(23, 15);
  list.reverse();
  list.disply();
}
