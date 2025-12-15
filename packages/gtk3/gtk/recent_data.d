/// Module for [RecentData] class
module gtk.recent_data;

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
  GtkRecentData cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gtk.recent_data.RecentData");

    cInstance = *cast(GtkRecentData*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `displayName` field.
      Returns: a UTF-8 encoded string, containing the name of the recently
        used resource to be displayed, or null;
  */
  @property string displayName()
  {
    return cToD!(string)(cast(void*)(cast(GtkRecentData*)this._cPtr).displayName);
  }

  /**
      Set `displayName` field.
      Params:
        propval = a UTF-8 encoded string, containing the name of the recently
          used resource to be displayed, or null;
  */
  @property void displayName(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkRecentData*)this._cPtr).displayName);
    dToC(propval, cast(void*)&(cast(GtkRecentData*)this._cPtr).displayName);
  }

  /**
      Get `description` field.
      Returns: a UTF-8 encoded string, containing a short description of
        the resource, or null;
  */
  @property string description()
  {
    return cToD!(string)(cast(void*)(cast(GtkRecentData*)this._cPtr).description);
  }

  /**
      Set `description` field.
      Params:
        propval = a UTF-8 encoded string, containing a short description of
          the resource, or null;
  */
  @property void description(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkRecentData*)this._cPtr).description);
    dToC(propval, cast(void*)&(cast(GtkRecentData*)this._cPtr).description);
  }

  /**
      Get `mimeType` field.
      Returns: the MIME type of the resource;
  */
  @property string mimeType()
  {
    return cToD!(string)(cast(void*)(cast(GtkRecentData*)this._cPtr).mimeType);
  }

  /**
      Set `mimeType` field.
      Params:
        propval = the MIME type of the resource;
  */
  @property void mimeType(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkRecentData*)this._cPtr).mimeType);
    dToC(propval, cast(void*)&(cast(GtkRecentData*)this._cPtr).mimeType);
  }

  /**
      Get `appName` field.
      Returns: the name of the application that is registering this recently
        used resource;
  */
  @property string appName()
  {
    return cToD!(string)(cast(void*)(cast(GtkRecentData*)this._cPtr).appName);
  }

  /**
      Set `appName` field.
      Params:
        propval = the name of the application that is registering this recently
          used resource;
  */
  @property void appName(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkRecentData*)this._cPtr).appName);
    dToC(propval, cast(void*)&(cast(GtkRecentData*)this._cPtr).appName);
  }

  /**
      Get `appExec` field.
      Returns: command line used to launch this resource; may contain the
        “\`f`” and “\`u`” escape characters which will be expanded
        to the resource file path and URI respectively when the command line
        is retrieved;
  */
  @property string appExec()
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
  @property void appExec(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkRecentData*)this._cPtr).appExec);
    dToC(propval, cast(void*)&(cast(GtkRecentData*)this._cPtr).appExec);
  }

  /**
      Get `isPrivate` field.
      Returns: whether this resource should be displayed only by the
        applications that have registered it or not.
  */
  @property bool isPrivate()
  {
    return cast(bool)(cast(GtkRecentData*)this._cPtr).isPrivate;
  }

  /**
      Set `isPrivate` field.
      Params:
        propval = whether this resource should be displayed only by the
          applications that have registered it or not.
  */
  @property void isPrivate(bool propval)
  {
    (cast(GtkRecentData*)this._cPtr).isPrivate = propval;
  }
}
