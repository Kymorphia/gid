/// Module for [TreePath] class
module gtk.tree_path;

import gid.gid;
import gobject.boxed;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/** */
class TreePath : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_tree_path_get_type != &gidSymbolNotFound ? gtk_tree_path_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TreePath self()
  {
    return this;
  }

  /**
      Creates a new #GtkTreePath-struct.
      This refers to a row.
      Returns: A newly created #GtkTreePath-struct.
  */
  this()
  {
    GtkTreePath* _cretval;
    _cretval = gtk_tree_path_new();
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new #GtkTreePath-struct.
      
      The string representation of this path is “0”.
      Returns: A new #GtkTreePath-struct
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
      Returns: A newly created #GtkTreePath-struct
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
      Creates a new #GtkTreePath-struct initialized to path.
      
      path is expected to be a colon separated list of numbers.
      For example, the string “10:4:0” would create a path of depth
      3 pointing to the 11th child of the root node, the 5th
      child of that 11th child, and the 1st child of that 5th child.
      If an invalid path string is passed in, null is returned.
  
      Params:
        path = The string representation of a path
      Returns: A newly-created #GtkTreePath-struct, or null
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
    gtk_tree_path_append_index(cast(GtkTreePath*)this._cPtr, index);
  }

  /**
      Compares two paths.
      
      If `a` appears before `b` in a tree, then -1 is returned.
      If `b` appears before `a`, then 1 is returned.
      If the two nodes are equal, then 0 is returned.
  
      Params:
        b = a #GtkTreePath-struct to compare with
      Returns: the relative positions of `a` and `b`
  */
  int compare(gtk.tree_path.TreePath b)
  {
    int _retval;
    _retval = gtk_tree_path_compare(cast(const(GtkTreePath)*)this._cPtr, b ? cast(const(GtkTreePath)*)b._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Creates a new #GtkTreePath-struct as a copy of path.
      Returns: a new #GtkTreePath-struct
  */
  gtk.tree_path.TreePath copy()
  {
    GtkTreePath* _cretval;
    _cretval = gtk_tree_path_copy(cast(const(GtkTreePath)*)this._cPtr);
    auto _retval = _cretval ? new gtk.tree_path.TreePath(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Moves path to point to the first child of the current path.
  */
  void down()
  {
    gtk_tree_path_down(cast(GtkTreePath*)this._cPtr);
  }

  /**
      Returns the current depth of path.
      Returns: The depth of path
  */
  int getDepth()
  {
    int _retval;
    _retval = gtk_tree_path_get_depth(cast(GtkTreePath*)this._cPtr);
    return _retval;
  }

  /**
      Returns the current indices of path.
      
      This is an array of integers, each representing a node in a tree.
      It also returns the number of elements in the array.
      The array should not be freed.
      Returns: The current
            indices, or null
  */
  int[] getIndices()
  {
    int* _cretval;
    int _cretlength;
    _cretval = gtk_tree_path_get_indices_with_depth(cast(GtkTreePath*)this._cPtr, &_cretlength);
    int[] _retval;

    if (_cretval)
    {
      _retval = cast(int[])_cretval[0 .. _cretlength].dup;
    }
    return _retval;
  }

  /**
      Returns true if descendant is a descendant of path.
  
      Params:
        descendant = another #GtkTreePath-struct
      Returns: true if descendant is contained inside path
  */
  bool isAncestor(gtk.tree_path.TreePath descendant)
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_path_is_ancestor(cast(GtkTreePath*)this._cPtr, descendant ? cast(GtkTreePath*)descendant._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Returns true if path is a descendant of ancestor.
  
      Params:
        ancestor = another #GtkTreePath-struct
      Returns: true if ancestor contains path somewhere below it
  */
  bool isDescendant(gtk.tree_path.TreePath ancestor)
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_path_is_descendant(cast(GtkTreePath*)this._cPtr, ancestor ? cast(GtkTreePath*)ancestor._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Moves the path to point to the next node at the current depth.
  */
  void next()
  {
    gtk_tree_path_next(cast(GtkTreePath*)this._cPtr);
  }

  /**
      Prepends a new index to a path.
      
      As a result, the depth of the path is increased.
  
      Params:
        index = the index
  */
  void prependIndex(int index)
  {
    gtk_tree_path_prepend_index(cast(GtkTreePath*)this._cPtr, index);
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
    _retval = cast(bool)gtk_tree_path_prev(cast(GtkTreePath*)this._cPtr);
    return _retval;
  }

  /**
      Generates a string representation of the path.
      
      This string is a “:” separated list of numbers.
      For example, “4:10:0:3” would be an acceptable
      return value for this string.
      Returns: A newly-allocated string.
            Must be freed with [glib.global.gfree].
  */
  string toString_()
  {
    char* _cretval;
    _cretval = gtk_tree_path_to_string(cast(GtkTreePath*)this._cPtr);
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
    _retval = cast(bool)gtk_tree_path_up(cast(GtkTreePath*)this._cPtr);
    return _retval;
  }
}
