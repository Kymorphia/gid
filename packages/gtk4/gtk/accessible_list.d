/// Module for [AccessibleList] class
module gtk.accessible_list;

public import gid.basictypes;
import gid.gid;
import gobject.boxed;
import gobject.object;
import gtk.accessible;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    Wraps a list of references to [gtk.accessible.Accessible] objects.
*/
class AccessibleList : gobject.boxed.BoxedWrap!(gtk_accessible_list_get_type)
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
  static gtk.accessible_list.AccessibleList newFromArray(gtk.accessible.Accessible[] accessibles) nothrow
  {
    GtkAccessibleList* _cretval;
    size_t _nAccessibles;
    if (accessibles)
      _nAccessibles = cast(size_t)accessibles.length;

    auto _accessibles_arr = new GtkAccessible*[](accessibles.length);
    auto _accessibles = _accessibles_arr.ptr;
    foreach (i, obj; accessibles) _accessibles[i] = obj ? cast(GtkAccessible*)(cast(gobject.object.ObjectWrap)obj)._cPtr(No.Dup): null;
    _cretval = gtk_accessible_list_new_from_array(_accessibles, _nAccessibles);
    auto _retval = _cretval ? new gtk.accessible_list.AccessibleList(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Allocates a new [gtk.accessible_list.AccessibleList], doing a shallow copy
      of the passed list of accessible objects
  
      Params:
        list = a list
            of accessible objects
      Returns: the list of accessible objects
  */
  static gtk.accessible_list.AccessibleList newFromList(gtk.accessible.Accessible[] list) nothrow
  {
    GtkAccessibleList* _cretval;
    auto _list = gListFromD!(gtk.accessible.Accessible)(list);
    scope(exit) containerFree!(GList*, gtk.accessible.Accessible, GidOwnership.None)(_list);
    _cretval = gtk_accessible_list_new_from_list(_list);
    auto _retval = _cretval ? new gtk.accessible_list.AccessibleList(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the list of objects this boxed type holds.
      Returns: a shallow copy
          of the objects
  */
  gtk.accessible.Accessible[] getObjects() nothrow
  {
    GList* _cretval;
    _cretval = gtk_accessible_list_get_objects(cast(GtkAccessibleList*)this._cPtr);
    auto _retval = gListToD!(gtk.accessible.Accessible, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }
}
