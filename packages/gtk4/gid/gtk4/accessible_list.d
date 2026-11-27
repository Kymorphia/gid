/// Module for [AccessibleList] class
module gid.gtk4.accessible_list;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.boxed;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;

/**
    Wraps a list of references to [gid.gtk4.accessible.Accessible] objects.
*/
@gidGir("AccessibleList")
class AccessibleList : gid.gobject2.boxed.BoxedWrap!(gtk_accessible_list_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override AccessibleList self() nothrow
  {
    return this;
  }

  /**
      Allocates a new list of accessible objects.
  
      Params:
        accessibles = array of accessible objects
      Returns: the newly created list of accessible objects
  */
  static gid.gtk4.accessible_list.AccessibleList newFromArray(gid.gtk4.accessible.Accessible[] accessibles) nothrow
  {
    GtkAccessibleList* _cretval;
    size_t _nAccessibles;
    if (accessibles)
      _nAccessibles = cast(size_t)accessibles.length;

    auto _accessibles_arr = new GtkAccessible*[](accessibles.length);
    auto _accessibles = _accessibles_arr.ptr;
    foreach (i, obj; accessibles) _accessibles[i] = obj ? cast(GtkAccessible*)(cast(gid.gobject2.object.ObjectWrap)obj)._cPtr(No.Dup): null;
    _cretval = gtk_accessible_list_new_from_array(_accessibles, _nAccessibles);
    auto _retval = _cretval ? new gid.gtk4.accessible_list.AccessibleList(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Allocates a new [gid.gtk4.accessible_list.AccessibleList], doing a shallow copy
      of the passed list of accessible objects
  
      Params:
        list = a list
            of accessible objects
      Returns: the list of accessible objects
  */
  static gid.gtk4.accessible_list.AccessibleList newFromList(gid.gtk4.accessible.Accessible[] list) nothrow
  {
    GtkAccessibleList* _cretval;
    auto _list = gListFromD!(gid.gtk4.accessible.Accessible)(list);
    scope(exit) containerFree!(GList*, gid.gtk4.accessible.Accessible, GidOwnership.None)(_list);
    _cretval = gtk_accessible_list_new_from_list(_list);
    auto _retval = _cretval ? new gid.gtk4.accessible_list.AccessibleList(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the list of objects this boxed type holds.
      Returns: a shallow copy
          of the objects
  */
  gid.gtk4.accessible.Accessible[] getObjects() nothrow
  {
    GList* _cretval;
    _cretval = gtk_accessible_list_get_objects(cast(GtkAccessibleList*)this._cPtr);
    auto _retval = gListToD!(gid.gtk4.accessible.Accessible, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }
}
