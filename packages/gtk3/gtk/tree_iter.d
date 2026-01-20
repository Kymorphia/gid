/// Module for [TreeIter] struct
module gtk.tree_iter;

import gid.gid;
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
struct TreeIter
{
  /**
      a unique stamp to catch invalid iterators
  */
  int stamp;

  /**
      model-specific data
  */
  void* userData;

  /**
      model-specific data
  */
  void* userData2;

  /**
      model-specific data
  */
  void* userData3;

  /**
      Creates a dynamically allocated tree iterator as a copy of iter.
      
      This function is not intended for use in applications,
      because you can just copy the structs by value
      (`GtkTreeIter new_iter = iter;`).
      You must free this iter with [gtk.tree_iter.TreeIter.free].
      Returns: a newly-allocated copy of iter
  */
  gtk.tree_iter.TreeIter copy()
  {
    GtkTreeIter* _cretval;
    _cretval = gtk_tree_iter_copy(cast(GtkTreeIter*)&this);
    gtk.tree_iter.TreeIter _retval;
    if (_cretval)
      _retval = *cast(gtk.tree_iter.TreeIter*)_cretval;
    return _retval;
  }
}
