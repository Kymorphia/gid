/// Module for [WindowAttr] class
module gdk.window_attr;

public import gid.basictypes;
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
  GdkWindowAttr _cInstance;

  /**
      Create a `window_attr.WindowAttr` wrap type.
      Params:
        title = title of the window (for toplevel windows)
        eventMask = event mask (see [gdk.window.Window.setEvents])
        x = X coordinate relative to parent window (see [gdk.window.Window.move])
        y = Y coordinate relative to parent window (see [gdk.window.Window.move])
        width = width of window
        height = height of window
        wclass = #GDK_INPUT_OUTPUT (normal window) or #GDK_INPUT_ONLY (invisible
           window that receives events)
        visual = #GdkVisual for window
        windowType = type of window
        cursor = cursor for the window (see [gdk.window.Window.setCursor])
        wmclassName = don’t use (see [gtk.window.Window.setWmclass])
        wmclassClass = don’t use (see [gtk.window.Window.setWmclass])
        overrideRedirect = true to bypass the window manager
        typeHint = a hint of the function of the window
  */
  this(string title = string.init, int eventMask = int.init, int x = int.init, int y = int.init, int width = int.init, int height = int.init, gdk.types.WindowWindowClass wclass = gdk.types.WindowWindowClass.init, gdk.visual.Visual visual = gdk.visual.Visual.init, gdk.types.WindowType windowType = gdk.types.WindowType.init, gdk.cursor.Cursor cursor = gdk.cursor.Cursor.init, string wmclassName = string.init, string wmclassClass = string.init, bool overrideRedirect = bool.init, gdk.types.WindowTypeHint typeHint = gdk.types.WindowTypeHint.init) nothrow
  {
    this.title = title;
    this.eventMask = eventMask;
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.wclass = wclass;
    this.visual = visual;
    this.windowType = windowType;
    this.cursor = cursor;
    this.wmclassName = wmclassName;
    this.wmclassClass = wmclassClass;
    this.overrideRedirect = overrideRedirect;
    this.typeHint = typeHint;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GdkWindowAttr*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `title` field.
      Returns: title of the window (for toplevel windows)
  */
  @property string title() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GdkWindowAttr*)this._cPtr).title);
  }

  /**
      Set `title` field.
      Params:
        propval = title of the window (for toplevel windows)
  */
  @property void title(string propval) nothrow
  {
    cValueFree!(string)(cast(void*)(cast(GdkWindowAttr*)this._cPtr).title);
    dToC(propval, cast(void*)&(cast(GdkWindowAttr*)this._cPtr).title);
  }

  /**
      Get `eventMask` field.
      Returns: event mask (see [gdk.window.Window.setEvents])
  */
  @property int eventMask() nothrow
  {
    return (cast(GdkWindowAttr*)this._cPtr).eventMask;
  }

  /**
      Set `eventMask` field.
      Params:
        propval = event mask (see [gdk.window.Window.setEvents])
  */
  @property void eventMask(int propval) nothrow
  {
    (cast(GdkWindowAttr*)this._cPtr).eventMask = propval;
  }

  /**
      Get `x` field.
      Returns: X coordinate relative to parent window (see [gdk.window.Window.move])
  */
  @property int x() nothrow
  {
    return (cast(GdkWindowAttr*)this._cPtr).x;
  }

  /**
      Set `x` field.
      Params:
        propval = X coordinate relative to parent window (see [gdk.window.Window.move])
  */
  @property void x(int propval) nothrow
  {
    (cast(GdkWindowAttr*)this._cPtr).x = propval;
  }

  /**
      Get `y` field.
      Returns: Y coordinate relative to parent window (see [gdk.window.Window.move])
  */
  @property int y() nothrow
  {
    return (cast(GdkWindowAttr*)this._cPtr).y;
  }

  /**
      Set `y` field.
      Params:
        propval = Y coordinate relative to parent window (see [gdk.window.Window.move])
  */
  @property void y(int propval) nothrow
  {
    (cast(GdkWindowAttr*)this._cPtr).y = propval;
  }

  /**
      Get `width` field.
      Returns: width of window
  */
  @property int width() nothrow
  {
    return (cast(GdkWindowAttr*)this._cPtr).width;
  }

  /**
      Set `width` field.
      Params:
        propval = width of window
  */
  @property void width(int propval) nothrow
  {
    (cast(GdkWindowAttr*)this._cPtr).width = propval;
  }

  /**
      Get `height` field.
      Returns: height of window
  */
  @property int height() nothrow
  {
    return (cast(GdkWindowAttr*)this._cPtr).height;
  }

  /**
      Set `height` field.
      Params:
        propval = height of window
  */
  @property void height(int propval) nothrow
  {
    (cast(GdkWindowAttr*)this._cPtr).height = propval;
  }

  /**
      Get `wclass` field.
      Returns: #GDK_INPUT_OUTPUT (normal window) or #GDK_INPUT_ONLY (invisible
         window that receives events)
  */
  @property gdk.types.WindowWindowClass wclass() nothrow
  {
    return cast(gdk.types.WindowWindowClass)(cast(GdkWindowAttr*)this._cPtr).wclass;
  }

  /**
      Set `wclass` field.
      Params:
        propval = #GDK_INPUT_OUTPUT (normal window) or #GDK_INPUT_ONLY (invisible
           window that receives events)
  */
  @property void wclass(gdk.types.WindowWindowClass propval) nothrow
  {
    (cast(GdkWindowAttr*)this._cPtr).wclass = cast(GdkWindowWindowClass)propval;
  }

  /**
      Get `visual` field.
      Returns: #GdkVisual for window
  */
  @property gdk.visual.Visual visual() nothrow
  {
    return cToD!(gdk.visual.Visual)(cast(void*)(cast(GdkWindowAttr*)this._cPtr).visual);
  }

  /**
      Set `visual` field.
      Params:
        propval = #GdkVisual for window
  */
  @property void visual(gdk.visual.Visual propval) nothrow
  {
    cValueFree!(gdk.visual.Visual)(cast(void*)(cast(GdkWindowAttr*)this._cPtr).visual);
    dToC(propval, cast(void*)&(cast(GdkWindowAttr*)this._cPtr).visual);
  }

  /**
      Get `windowType` field.
      Returns: type of window
  */
  @property gdk.types.WindowType windowType() nothrow
  {
    return cast(gdk.types.WindowType)(cast(GdkWindowAttr*)this._cPtr).windowType;
  }

  /**
      Set `windowType` field.
      Params:
        propval = type of window
  */
  @property void windowType(gdk.types.WindowType propval) nothrow
  {
    (cast(GdkWindowAttr*)this._cPtr).windowType = cast(GdkWindowType)propval;
  }

  /**
      Get `cursor` field.
      Returns: cursor for the window (see [gdk.window.Window.setCursor])
  */
  @property gdk.cursor.Cursor cursor() nothrow
  {
    return cToD!(gdk.cursor.Cursor)(cast(void*)(cast(GdkWindowAttr*)this._cPtr).cursor);
  }

  /**
      Set `cursor` field.
      Params:
        propval = cursor for the window (see [gdk.window.Window.setCursor])
  */
  @property void cursor(gdk.cursor.Cursor propval) nothrow
  {
    cValueFree!(gdk.cursor.Cursor)(cast(void*)(cast(GdkWindowAttr*)this._cPtr).cursor);
    dToC(propval, cast(void*)&(cast(GdkWindowAttr*)this._cPtr).cursor);
  }

  /**
      Get `wmclassName` field.
      Returns: don’t use (see [gtk.window.Window.setWmclass])
  */
  @property string wmclassName() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GdkWindowAttr*)this._cPtr).wmclassName);
  }

  /**
      Set `wmclassName` field.
      Params:
        propval = don’t use (see [gtk.window.Window.setWmclass])
  */
  @property void wmclassName(string propval) nothrow
  {
    cValueFree!(string)(cast(void*)(cast(GdkWindowAttr*)this._cPtr).wmclassName);
    dToC(propval, cast(void*)&(cast(GdkWindowAttr*)this._cPtr).wmclassName);
  }

  /**
      Get `wmclassClass` field.
      Returns: don’t use (see [gtk.window.Window.setWmclass])
  */
  @property string wmclassClass() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GdkWindowAttr*)this._cPtr).wmclassClass);
  }

  /**
      Set `wmclassClass` field.
      Params:
        propval = don’t use (see [gtk.window.Window.setWmclass])
  */
  @property void wmclassClass(string propval) nothrow
  {
    cValueFree!(string)(cast(void*)(cast(GdkWindowAttr*)this._cPtr).wmclassClass);
    dToC(propval, cast(void*)&(cast(GdkWindowAttr*)this._cPtr).wmclassClass);
  }

  /**
      Get `overrideRedirect` field.
      Returns: true to bypass the window manager
  */
  @property bool overrideRedirect() nothrow
  {
    return cast(bool)(cast(GdkWindowAttr*)this._cPtr).overrideRedirect;
  }

  /**
      Set `overrideRedirect` field.
      Params:
        propval = true to bypass the window manager
  */
  @property void overrideRedirect(bool propval) nothrow
  {
    (cast(GdkWindowAttr*)this._cPtr).overrideRedirect = propval;
  }

  /**
      Get `typeHint` field.
      Returns: a hint of the function of the window
  */
  @property gdk.types.WindowTypeHint typeHint() nothrow
  {
    return cast(gdk.types.WindowTypeHint)(cast(GdkWindowAttr*)this._cPtr).typeHint;
  }

  /**
      Set `typeHint` field.
      Params:
        propval = a hint of the function of the window
  */
  @property void typeHint(gdk.types.WindowTypeHint propval) nothrow
  {
    (cast(GdkWindowAttr*)this._cPtr).typeHint = cast(GdkWindowTypeHint)propval;
  }
}
