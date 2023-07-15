defmodule SillyDb.DataStructures.BinarySearchTree do
  @type bst_node :: %{key: integer, data: any, left: bst_node | nil, right: bst_node | nil}

  def search(%{key: _key, left: left, right: _right, data: _data} = node, key)
      when node.key > key do
    search(left, key)
  end

  def search(%{key: _key, left: _left, right: right, data: _data} = node, key)
      when node.key < key do
    search(right, key)
  end

  def search(node, key) when node.key === key, do: node

  def search(nil, _key), do: nil

  def insert(nil, node), do: node

  @spec insert(bst_node, bst_node) :: bst_node
  def insert(root, node) when root.key > node.key do
    %{root | left: insert(root.left, node)}
  end

  def insert(root, node) do
    %{root | right: insert(root.right, node)}
  end

  # helpers

  def build_node(key, data) do
    %{key: key, data: data, left: nil, right: nil}
  end
end
