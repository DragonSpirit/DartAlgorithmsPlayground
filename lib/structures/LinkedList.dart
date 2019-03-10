import "package:test/test.dart";
import './Node.dart';

class LinkedList<T> {
  Node<T> _head = null;
  Node<T> _tail = null;
  int _count = 0;
  LinkedList();

  void add(T value) {
    Node<T> _node = Node(value);
    if (_head == null) {
      _head = _node;
      _tail = _node;
    } else {
      _tail.next = _node;
      _tail = _node;
    }
    _count++;
  }

  void addToHead(T value) {
    Node<T> _node = Node(value);
    Node<T> _tmp = _head;
    _head = _node;
    _head.next = _tmp;
    if (count == 0) {
      _tail = _head;
    } else {
      _tmp.previous = _head;
    }
    _count++;
  }
  
  void addToTail(T value) {
    Node<T> _node = Node(value);
    if (count == 0) {
      _head = _node;
    } else {
      _tail.next = _node;
      _node.previous = _tail;
    }
    _tail = _node;
    _count++;
  }

  bool remove(T value) {
    Node<T> _prev = null;
    Node<T> _current = _head;
    while (_current != null) {
      if (_current.value == value) {
        if (_prev != null) {
          _prev.next = _current.next;
          if (_current.next == null) {
            _tail = _prev;
          }
        } else {
          _head =_head.next;
          if (_head == null) {
            _tail = null;
          }
        }
        _count--;
        return true;
      }
      _prev = _current;
      _current = _current.next;
    }
    return false;
  }

  bool contains(T value) {
    Node<T> _current = _head;
    while (_current != null) {
      if (_current.value == value) {
        return true;
      }
      _current = _current.next;
    }
    return false;
  }

  void clear() {
    _tail = null;
    _head = null;
    _count = 0;
  }

  get count {
    return _count;
  }
  
  @override
  String toString() {
    Node<T> _node = _head;
    String result = "";
    while (_node != null) {
      result =  result + _node.value.toString() + "\n";
      _node = _node.next;
    }
    return result;
  }
}

main() {
  test('Check add linked list functionality', () {
    LinkedList<int> _list = LinkedList<int>();
    _list.add(3);
    expect(_list._head.value, 3);
    expect(_list._tail.value, 3);
  });
  test('Check remove linked list functionality', () {
    LinkedList<int> _list = LinkedList<int>();
    _list.add(3);
    _list.remove(3);
    expect(_list._head, null);
    expect(_list._tail, null);
  });
  test('Check add head linked list functionality', () {
    LinkedList<int> _list = LinkedList<int>();
    _list.add(3);
    _list.addToHead(1);
    expect(_list._head.value, 1);
  });
  test('Check count linked list functionality', () {
    LinkedList<int> _list = LinkedList<int>();
    _list.add(3);
    expect(_list.count, 1);
  });
}