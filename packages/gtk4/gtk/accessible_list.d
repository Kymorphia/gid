/// Module for [AccessibleList] class
module gtk.accessible_list;

import gid.gid;
import gobject.boxed;
import gobject.object;
import gtk.accessible;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    A boxed type which wraps a list of references to GtkAccessible objects.
*/
class AccessibleList : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_accessible_list_get_type != &gidSymbolNotFound ? gtk_accessible_list_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AccessibleList self()
  {
    return this;
  }

  /**
      Allocates a new list of accessible instances.
  
      Params:
        accessibles = array of GtkAccessible
      Returns: the newly created list of accessible instances
  */
  static gtk.accessible_list.AccessibleList newFromArray(gtk.accessible.Accessible[] accessibles)
  {
    GtkAccessibleList* _cretval;
    size_t _nAccessibles;
    if (accessibles)
      _nAccessibles = cast(size_t)accessibles.length;

    GtkAccessible*[] _tmpaccessibles;
    foreach (obj; accessibles)
      _tmpaccessibles ~= obj ? cast(GtkAccessible*)(cast(gobject.object.ObjectWrap)obj)._cPtr : null;
    GtkAccessible** _accessibles = _tmpaccessibles.ptr;

    _cretval = gtk_accessible_list_new_from_array(_accessibles, _nAccessibles);
    auto _retval = _cretval ? new gtk.accessible_list.AccessibleList(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Allocates a new [gtk.accessible_list.AccessibleList], doing a shallow copy of the
      passed list of [gtk.accessible.Accessible] instances.
  
      Params:
        list = a reference to a [glib.list.List] containing a list of accessible values
      Returns: the list of accessible instances
  */
  static gtk.accessible_list.AccessibleList newFromList(gtk.accessible.Accessible[] list)
  {
    GtkAccessibleList* _cretval;
    auto _list = gListFromD!(gtk.accessible.Accessible)(list);
    scope(exit) containerFree!(GList*, gtk.accessible.Accessible, GidOwnership.None)(_list);
    _cretval = gtk_accessible_list_new_from_list(_list);
    auto _retval = _cretval ? new gtk.accessible_list.AccessibleList(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the list of objects this boxed type holds
      Returns: a shallow copy of the objects
  */
  gtk.accessible.Accessible[] getObjects()
  {
    GList* _cretval;
    _cretval = gtk_accessible_list_get_objects(cast(GtkAccessibleList*)this._cPtr);
    auto _retval = gListToD!(gtk.accessible.Accessible, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }
}
