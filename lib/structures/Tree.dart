import 'dart:collection';

class TreeNode<T> {
    T value;
    TreeNode<T> leftNode = null;
    TreeNode<T> rightNode = null;
    TreeNode(this.value, [this.leftNode = null, this.rightNode = null]);
}

dfs<T>(TreeNode<T> node, int depth) {
    print(node.value);
    if (node.leftNode != null) {
        dfs(node.leftNode, depth + 1);
    }
    if (node.rightNode != null) {
        dfs(node.rightNode, depth + 1);
    }
}

bfs<T>(TreeNode<T> root) {
    var queue = Queue.from([root]);
    TreeNode<T> tmp;
    while (queue.isNotEmpty) {
        tmp = queue.first;
        print(tmp.value);
        queue.removeFirst();
        if (tmp.leftNode != null) {
            queue.add(tmp.leftNode);
        }
        if (tmp.rightNode != null) {
            queue.add(tmp.rightNode);
        }
    }
}

main() {
  TreeNode rootNode = TreeNode(1, TreeNode(2, TreeNode(4), TreeNode(5)), TreeNode(3));
  bfs(rootNode);
  print("\n");
  dfs(rootNode, 0);
}