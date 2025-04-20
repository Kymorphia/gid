/// Module for [TreePath] class
module gtk.tree_path;

import gid.gid;
import gobject.boxed;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    An opaque structure representing a path to a row in a model.
*/
class TreePath : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_tree_path_get_type != &gidSymbolNotFound ? gtk_tree_path_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TreePath self()
  {
    return this;
  }

  /**
      Creates a new [gtk.tree_path.TreePath]
      This refers to a row.
      Returns: A newly created [gtk.tree_path.TreePath].
  */
  this()
  {
    GtkTreePath* _cretval;
    _cretval = gtk_tree_path_new();
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new [gtk.tree_path.TreePath].
      
      The string representation of this path is “0”.
      Returns: A new [gtk.tree_path.TreePath]
  */
  static gtk.tree_path.TreePath newFirst()
  {
    GtkTreePath* _cretval;
    _cretval = gtk_tree_path_new_first();
    auto _retval = _cretval ? new gtk.tree_path.TreePath(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new path with the given indices array of length.
  
      Params:
        indices = array of indices
      Returns: A newly created [gtk.tree_path.TreePath]
  */
  static gtk.tree_path.TreePath newFromIndices(int[] indices)
  {
    GtkTreePath* _cretval;
    size_t _length;
    if (indices)
      _length = cast(size_t)indices.length;

    auto _indices = cast(int*)indices.ptr;
    _cretval = gtk_tree_path_new_from_indicesv(_indices, _length);
    auto _retval = _cretval ? new gtk.tree_path.TreePath(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Creates a new [gtk.tree_path.TreePath] initialized to path.
      
      path is expected to be a colon separated list of numbers.
      For example, the string “10:4:0” would create a path of depth
      3 pointing to the 11th child of the root node, the 5th
      child of that 11th child, and the 1st child of that 5th child.
      If an invalid path string is passed in, null is returned.
  
      Params:
        path = The string representation of a path
      Returns: A newly-created [gtk.tree_path.TreePath]
  */
  static gtk.tree_path.TreePath newFromString(string path)
  {
    GtkTreePath* _cretval;
    const(char)* _path = path.toCString(No.Alloc);
    _cretval = gtk_tree_path_new_from_string(_path);
    auto _retval = _cretval ? new gtk.tree_path.TreePath(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Appends a new index to a path.
      
      As a result, the depth of the path is increased.
  
      Params:
        index = the index
  */
  void appendIndex(int index)
  {
    gtk_tree_path_append_index(cast(GtkTreePath*)cPtr, index);
  }

  /**
      Compares two paths.
      
      If `a` appears before `b` in a tree, then -1 is returned.
      If `b` appears before `a`, then 1 is returned.
      If the two nodes are equal, then 0 is returned.
  
      Params:
        b = a [gtk.tree_path.TreePath] to compare with
      Returns: the relative positions of `a` and `b`
  */
  int compare(gtk.tree_path.TreePath b)
  {
    int _retval;
    _retval = gtk_tree_path_compare(cast(const(GtkTreePath)*)cPtr, b ? cast(const(GtkTreePath)*)b.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Creates a new [gtk.tree_path.TreePath] as a copy of path.
      Returns: a new [gtk.tree_path.TreePath]
  */
  gtk.tree_path.TreePath copy()
  {
    GtkTreePath* _cretval;
    _cretval = gtk_tree_path_copy(cast(const(GtkTreePath)*)cPtr);
    auto _retval = _cretval ? new gtk.tree_path.TreePath(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Moves path to point to the first child of the current path.
  */
  void down()
  {
    gtk_tree_path_down(cast(GtkTreePath*)cPtr);
  }

  /**
      Returns the current depth of path.
      Returns: The depth of path
  */
  int getDepth()
  {
    int _retval;
    _retval = gtk_tree_path_get_depth(cast(GtkTreePath*)cPtr);
    return _retval;
  }

  /**
      Returns the current indices of path.
      
      This is an array of integers, each representing a node in a tree.
      It also returns the number of elements in the array.
      The array should not be freed.
      Returns: The current
          indices
  */
  int[] getIndices()
  {
    int* _cretval;
    int _cretlength;
    _cretval = gtk_tree_path_get_indices_with_depth(cast(GtkTreePath*)cPtr, &_cretlength);
    int[] _retval;

    if (_cretval)
    {
      _retval = cast(int[] )_cretval[0 .. _cretlength];
    }
    return _retval;
  }

  /**
      Returns true if descendant is a descendant of path.
  
      Params:
        descendant = another [gtk.tree_path.TreePath]
      Returns: true if descendant is contained inside path
  */
  bool isAncestor(gtk.tree_path.TreePath descendant)
  {
    bool _retval;
    _retval = gtk_tree_path_is_ancestor(cast(GtkTreePath*)cPtr, descendant ? cast(GtkTreePath*)descendant.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Returns true if path is a descendant of ancestor.
  
      Params:
        ancestor = another [gtk.tree_path.TreePath]
      Returns: true if ancestor contains path somewhere below it
  */
  bool isDescendant(gtk.tree_path.TreePath ancestor)
  {
    bool _retval;
    _retval = gtk_tree_path_is_descendant(cast(GtkTreePath*)cPtr, ancestor ? cast(GtkTreePath*)ancestor.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Moves the path to point to the next node at the current depth.
  */
  void next()
  {
    gtk_tree_path_next(cast(GtkTreePath*)cPtr);
  }

  /**
      Prepends a new index to a path.
      
      As a result, the depth of the path is increased.
  
      Params:
        index = the index
  */
  void prependIndex(int index)
  {
    gtk_tree_path_prepend_index(cast(GtkTreePath*)cPtr, index);
  }

  /**
      Moves the path to point to the previous node at the
      current depth, if it exists.
      Returns: true if path has a previous node, and
          the move was made
  */
  bool prev()
  {
    bool _retval;
    _retval = gtk_tree_path_prev(cast(GtkTreePath*)cPtr);
    return _retval;
  }

  /**
      Generates a string representation of the path.
      
      This string is a “:” separated list of numbers.
      For example, “4:10:0:3” would be an acceptable
      return value for this string. If the path has
      depth 0, null is returned.
      Returns: A newly-allocated string
  */
  string toString_()
  {
    char* _cretval;
    _cretval = gtk_tree_path_to_string(cast(GtkTreePath*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Moves the path to point to its parent node, if it has a parent.
      Returns: true if path has a parent, and the move was made
  */
  bool up()
  {
    bool _retval;
    _retval = gtk_tree_path_up(cast(GtkTreePath*)cPtr);
    return _retval;
  }
}
