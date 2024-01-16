class node {
  node? next;
  node? prev;
  int? data;

  node(int data) {
    this.data = data;
  }
}

class linkedlist {
  node? head;
  node? tail;
  void add(int value) {
    node newnode = node(value);
    if (head == null) {
      head = newnode;
    } else {
      tail?.next = newnode;
      newnode.prev = tail;
    }
    tail = newnode;
  }

  void dispay() {
    node? current = head;
    if (current == null) {
      return;
    } else {
      while (current != null) {
        print(current.data);
        current = current.next;
      }
    }
  }

  void reverse() {
    node? current = tail;
    if (current == null) {
      return;
    } else {
      while (current != null) {
        print(current.data);
        current = current.prev;
      }
    }
  }

  void delete(int data) {
    node? current = head;
    if (current != null && current.data == data) {
      head = head?.next;
    } else {
      while (current != null && current.data != data) {
        current = current.next;
      }
      if (current == null) {
        return;
      }
      if (current == tail) {
        tail = current.prev;
        tail?.next = null;
        return;
      }
      current.next?.prev = current.prev;
      current.prev?.next = current.next;
    }
  }

  void insert(int after, int value) {
    node newnode = node(value);
    node? current = head;
    while (current != null && current.data != after) {
      current = current.next;
    }
    if (current == null) {
      return;
    }
    if (current == tail) {
      current.next = newnode;
      tail = newnode;
      return;
    }
    newnode.prev = current;
    current.next?.prev = newnode;
    current.next = newnode;
  }
}

void main() {
  linkedlist list = linkedlist();
  list.add(51);
  list.add(50);
  list.add(222);
  list.add(50);
  list.add(120);
  list.insert(222, 20);
  list.delete(50);
  list.dispay();
}