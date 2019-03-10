class Node<T> {
  T value = null;
  Node<T> next = null;
  Node<T> previous = null;
  Node(this.value, [this.next = null, this.previous = null]);
}