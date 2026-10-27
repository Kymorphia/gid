/// Module for [RecentData] class
module gtk.recent_data;

public import gid.basictypes;
import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    Meta-data to be passed to [gtk.recent_manager.RecentManager.addFull] when
    registering a recently used resource.
*/
class RecentData
{
  GtkRecentData _cInstance;

  /**
      Create a `recent_data.RecentData` wrap type.
      Params:
        displayName = a UTF-8 encoded string, containing the name of the recently
            used resource to be displayed, or null;
        description = a UTF-8 encoded string, containing a short description of
            the resource, or null;
        mimeType = the MIME type of the resource;
        appName = the name of the application that is registering this recently
            used resource;
        appExec = command line used to launch this resource; may contain the
            “\`f`” and “\`u`” escape characters which will be expanded
            to the resource file path and URI respectively when the command line
            is retrieved;
        isPrivate = whether this resource should be displayed only by the
            applications that have registered it or not.
  */
  this(string displayName = string.init, string description = string.init, string mimeType = string.init, string appName = string.init, string appExec = string.init, bool isPrivate = bool.init) nothrow
  {
    this.displayName = displayName;
    this.description = description;
    this.mimeType = mimeType;
    this.appName = appName;
    this.appExec = appExec;
    this.isPrivate = isPrivate;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GtkRecentData*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return cast(void*)(dup ? mallocDup(&_cInstance) : &_cInstance);
  }

  /**
      Get `displayName` field.
      Returns: a UTF-8 encoded string, containing the name of the recently
          used resource to be displayed, or null;
  */
  @property string displayName() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GtkRecentData*)this._cPtr).displayName);
  }

  /**
      Set `displayName` field.
      Params:
        propval = a UTF-8 encoded string, containing the name of the recently
            used resource to be displayed, or null;
  */
  @property void displayName(string propval) nothrow
  {
    (cast(GtkRecentData*)this._cPtr).displayName = cast(char*)toCString!(No.Malloc, Yes.Nullable)(propval);
  }

  /**
      Get `description` field.
      Returns: a UTF-8 encoded string, containing a short description of
          the resource, or null;
  */
  @property string description() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GtkRecentData*)this._cPtr).description);
  }

  /**
      Set `description` field.
      Params:
        propval = a UTF-8 encoded string, containing a short description of
            the resource, or null;
  */
  @property void description(string propval) nothrow
  {
    (cast(GtkRecentData*)this._cPtr).description = cast(char*)toCString!(No.Malloc, Yes.Nullable)(propval);
  }

  /**
      Get `mimeType` field.
      Returns: the MIME type of the resource;
  */
  @property string mimeType() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GtkRecentData*)this._cPtr).mimeType);
  }

  /**
      Set `mimeType` field.
      Params:
        propval = the MIME type of the resource;
  */
  @property void mimeType(string propval) nothrow
  {
    (cast(GtkRecentData*)this._cPtr).mimeType = cast(char*)toCString!(No.Malloc, Yes.Nullable)(propval);
  }

  /**
      Get `appName` field.
      Returns: the name of the application that is registering this recently
          used resource;
  */
  @property string appName() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GtkRecentData*)this._cPtr).appName);
  }

  /**
      Set `appName` field.
      Params:
        propval = the name of the application that is registering this recently
            used resource;
  */
  @property void appName(string propval) nothrow
  {
    (cast(GtkRecentData*)this._cPtr).appName = cast(char*)toCString!(No.Malloc, Yes.Nullable)(propval);
  }

  /**
      Get `appExec` field.
      Returns: command line used to launch this resource; may contain the
          “\`f`” and “\`u`” escape characters which will be expanded
          to the resource file path and URI respectively when the command line
          is retrieved;
  */
  @property string appExec() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GtkRecentData*)this._cPtr).appExec);
  }

  /**
      Set `appExec` field.
      Params:
        propval = command line used to launch this resource; may contain the
            “\`f`” and “\`u`” escape characters which will be expanded
            to the resource file path and URI respectively when the command line
            is retrieved;
  */
  @property void appExec(string propval) nothrow
  {
    (cast(GtkRecentData*)this._cPtr).appExec = cast(char*)toCString!(No.Malloc, Yes.Nullable)(propval);
  }

  /**
      Get `groups` field.
      Returns: a vector of strings containing
          groups names;
  */
  @property string[] groups() nothrow
  {
    uint len;
    if ((cast(GtkRecentData*)this._cPtr).groups)
    {
      for (; (cast(GtkRecentData*)this._cPtr).groups[len] !is null; len++)
      {
      }
    }

    auto _retval = new string[](len);
    foreach (i; 0 .. len)
      _retval[i] = (cast(GtkRecentData*)this._cPtr).groups[i].fromCString;
    return _retval;
  }

  /**
      Get `isPrivate` field.
      Returns: whether this resource should be displayed only by the
          applications that have registered it or not.
  */
  @property bool isPrivate() nothrow
  {
    return cast(bool)(cast(GtkRecentData*)this._cPtr).isPrivate;
  }

  /**
      Set `isPrivate` field.
      Params:
        propval = whether this resource should be displayed only by the
            applications that have registered it or not.
  */
  @property void isPrivate(bool propval) nothrow
  {
    (cast(GtkRecentData*)this._cPtr).isPrivate = propval;
  }
}
