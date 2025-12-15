/// Module for [WindowAttr] class
module gdk.window_attr;

import gdk.c.functions;
import gdk.c.types;
import gdk.cursor;
import gdk.types;
import gdk.visual;
import gid.gid;

/**
    Attributes to use for a newly-created window.
*/
class WindowAttr
{
  GdkWindowAttr cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gdk.window_attr.WindowAttr");

    cInstance = *cast(GdkWindowAttr*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `title` field.
      Returns: title of the window (for toplevel windows)
  */
  @property string title()
  {
    return cToD!(string)(cast(void*)(cast(GdkWindowAttr*)this._cPtr).title);
  }

  /**
      Set `title` field.
      Params:
        propval = title of the window (for toplevel windows)
  */
  @property void title(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdkWindowAttr*)this._cPtr).title);
    dToC(propval, cast(void*)&(cast(GdkWindowAttr*)this._cPtr).title);
  }

  /**
      Get `eventMask` field.
      Returns: event mask (see [gdk.window.Window.setEvents])
  */
  @property int eventMask()
  {
    return (cast(GdkWindowAttr*)this._cPtr).eventMask;
  }

  /**
      Set `eventMask` field.
      Params:
        propval = event mask (see [gdk.window.Window.setEvents])
  */
  @property void eventMask(int propval)
  {
    (cast(GdkWindowAttr*)this._cPtr).eventMask = propval;
  }

  /**
      Get `x` field.
      Returns: X coordinate relative to parent window (see [gdk.window.Window.move])
  */
  @property int x()
  {
    return (cast(GdkWindowAttr*)this._cPtr).x;
  }

  /**
      Set `x` field.
      Params:
        propval = X coordinate relative to parent window (see [gdk.window.Window.move])
  */
  @property void x(int propval)
  {
    (cast(GdkWindowAttr*)this._cPtr).x = propval;
  }

  /**
      Get `y` field.
      Returns: Y coordinate relative to parent window (see [gdk.window.Window.move])
  */
  @property int y()
  {
    return (cast(GdkWindowAttr*)this._cPtr).y;
  }

  /**
      Set `y` field.
      Params:
        propval = Y coordinate relative to parent window (see [gdk.window.Window.move])
  */
  @property void y(int propval)
  {
    (cast(GdkWindowAttr*)this._cPtr).y = propval;
  }

  /**
      Get `width` field.
      Returns: width of window
  */
  @property int width()
  {
    return (cast(GdkWindowAttr*)this._cPtr).width;
  }

  /**
      Set `width` field.
      Params:
        propval = width of window
  */
  @property void width(int propval)
  {
    (cast(GdkWindowAttr*)this._cPtr).width = propval;
  }

  /**
      Get `height` field.
      Returns: height of window
  */
  @property int height()
  {
    return (cast(GdkWindowAttr*)this._cPtr).height;
  }

  /**
      Set `height` field.
      Params:
        propval = height of window
  */
  @property void height(int propval)
  {
    (cast(GdkWindowAttr*)this._cPtr).height = propval;
  }

  /**
      Get `wclass` field.
      Returns: #GDK_INPUT_OUTPUT (normal window) or #GDK_INPUT_ONLY (invisible
       window that receives events)
  */
  @property gdk.types.WindowWindowClass wclass()
  {
    return cast(gdk.types.WindowWindowClass)(cast(GdkWindowAttr*)this._cPtr).wclass;
  }

  /**
      Set `wclass` field.
      Params:
        propval = #GDK_INPUT_OUTPUT (normal window) or #GDK_INPUT_ONLY (invisible
         window that receives events)
  */
  @property void wclass(gdk.types.WindowWindowClass propval)
  {
    (cast(GdkWindowAttr*)this._cPtr).wclass = cast(GdkWindowWindowClass)propval;
  }

  /**
      Get `visual` field.
      Returns: #GdkVisual for window
  */
  @property gdk.visual.Visual visual()
  {
    return cToD!(gdk.visual.Visual)(cast(void*)(cast(GdkWindowAttr*)this._cPtr).visual);
  }

  /**
      Set `visual` field.
      Params:
        propval = #GdkVisual for window
  */
  @property void visual(gdk.visual.Visual propval)
  {
    cValueFree!(gdk.visual.Visual)(cast(void*)(cast(GdkWindowAttr*)this._cPtr).visual);
    dToC(propval, cast(void*)&(cast(GdkWindowAttr*)this._cPtr).visual);
  }

  /**
      Get `windowType` field.
      Returns: type of window
  */
  @property gdk.types.WindowType windowType()
  {
    return cast(gdk.types.WindowType)(cast(GdkWindowAttr*)this._cPtr).windowType;
  }

  /**
      Set `windowType` field.
      Params:
        propval = type of window
  */
  @property void windowType(gdk.types.WindowType propval)
  {
    (cast(GdkWindowAttr*)this._cPtr).windowType = cast(GdkWindowType)propval;
  }

  /**
      Get `cursor` field.
      Returns: cursor for the window (see [gdk.window.Window.setCursor])
  */
  @property gdk.cursor.Cursor cursor()
  {
    return cToD!(gdk.cursor.Cursor)(cast(void*)(cast(GdkWindowAttr*)this._cPtr).cursor);
  }

  /**
      Set `cursor` field.
      Params:
        propval = cursor for the window (see [gdk.window.Window.setCursor])
  */
  @property void cursor(gdk.cursor.Cursor propval)
  {
    cValueFree!(gdk.cursor.Cursor)(cast(void*)(cast(GdkWindowAttr*)this._cPtr).cursor);
    dToC(propval, cast(void*)&(cast(GdkWindowAttr*)this._cPtr).cursor);
  }

  /**
      Get `wmclassName` field.
      Returns: don’t use (see [gtk.window.Window.setWmclass])
  */
  @property string wmclassName()
  {
    return cToD!(string)(cast(void*)(cast(GdkWindowAttr*)this._cPtr).wmclassName);
  }

  /**
      Set `wmclassName` field.
      Params:
        propval = don’t use (see [gtk.window.Window.setWmclass])
  */
  @property void wmclassName(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdkWindowAttr*)this._cPtr).wmclassName);
    dToC(propval, cast(void*)&(cast(GdkWindowAttr*)this._cPtr).wmclassName);
  }

  /**
      Get `wmclassClass` field.
      Returns: don’t use (see [gtk.window.Window.setWmclass])
  */
  @property string wmclassClass()
  {
    return cToD!(string)(cast(void*)(cast(GdkWindowAttr*)this._cPtr).wmclassClass);
  }

  /**
      Set `wmclassClass` field.
      Params:
        propval = don’t use (see [gtk.window.Window.setWmclass])
  */
  @property void wmclassClass(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdkWindowAttr*)this._cPtr).wmclassClass);
    dToC(propval, cast(void*)&(cast(GdkWindowAttr*)this._cPtr).wmclassClass);
  }

  /**
      Get `overrideRedirect` field.
      Returns: true to bypass the window manager
  */
  @property bool overrideRedirect()
  {
    return cast(bool)(cast(GdkWindowAttr*)this._cPtr).overrideRedirect;
  }

  /**
      Set `overrideRedirect` field.
      Params:
        propval = true to bypass the window manager
  */
  @property void overrideRedirect(bool propval)
  {
    (cast(GdkWindowAttr*)this._cPtr).overrideRedirect = propval;
  }

  /**
      Get `typeHint` field.
      Returns: a hint of the function of the window
  */
  @property gdk.types.WindowTypeHint typeHint()
  {
    return cast(gdk.types.WindowTypeHint)(cast(GdkWindowAttr*)this._cPtr).typeHint;
  }

  /**
      Set `typeHint` field.
      Params:
        propval = a hint of the function of the window
  */
  @property void typeHint(gdk.types.WindowTypeHint propval)
  {
    (cast(GdkWindowAttr*)this._cPtr).typeHint = cast(GdkWindowTypeHint)propval;
  }
}
