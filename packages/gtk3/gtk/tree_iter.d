/// Module for [TreeIter] class
module gtk.tree_iter;

public import gid.basictypes;
import gid.gid;
import gobject.boxed;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    The #GtkTreeIter is the primary structure
    for accessing a #GtkTreeModel. Models are expected to put a unique
    integer in the @stamp member, and put
    model-specific data in the three @user_data
    members.
*/
class TreeIter : gobject.boxed.Boxed
{

  /**
      Create a `tree_iter.TreeIter` boxed type.
      Params:
        stamp = a unique stamp to catch invalid iterators
  */
  this(int stamp = int.init) nothrow
  {
    super(gMalloc(GtkTreeIter.sizeof), Yes.Take);
    this.stamp = stamp;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_tree_iter_get_type != &gidSymbolNotFound ? gtk_tree_iter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TreeIter self() nothrow
  {
    return this;
  }

  /**
      Get `stamp` field.
      Returns: a unique stamp to catch invalid iterators
  */
  @property int stamp() nothrow
  {
    return (cast(GtkTreeIter*)this._cPtr).stamp;
  }

  /**
      Set `stamp` field.
      Params:
        propval = a unique stamp to catch invalid iterators
  */
  @property void stamp(int propval) nothrow
  {
    (cast(GtkTreeIter*)this._cPtr).stamp = propval;
  }

  /**
      Creates a dynamically allocated tree iterator as a copy of iter.
      
      This function is not intended for use in applications,
      because you can just copy the structs by value
      (`GtkTreeIter new_iter = iter;`).
      You must free this iter with [gtk.tree_iter.TreeIter.free].
      Returns: a newly-allocated copy of iter
  */
  gtk.tree_iter.TreeIter copy() nothrow
  {
    GtkTreeIter* _cretval;
    _cretval = gtk_tree_iter_copy(cast(GtkTreeIter*)this._cPtr);
    auto _retval = _cretval ? new gtk.tree_iter.TreeIter(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
