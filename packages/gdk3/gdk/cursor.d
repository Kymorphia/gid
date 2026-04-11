/// Module for [Cursor] class
module gdk.cursor;

import cairo.surface;
import gdk.c.functions;
import gdk.c.types;
import gdk.display;
import gdk.types;
import gdkpixbuf.pixbuf;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/**
    A #GdkCursor represents a cursor. Its contents are private.
*/
class Cursor : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gdk_cursor_get_type != &gidSymbolNotFound ? gdk_cursor_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Cursor self()
  {
    return this;
  }

  /**
      Get builder for [gdk.cursor.Cursor]
      Returns: New builder object
  */
  static CursorGidBuilder builder()
  {
    return new CursorGidBuilder;
  }

  /** */
  @property gdk.types.CursorType cursorType()
  {
    return getCursorType();
  }

  /** */
  @property gdk.display.Display display()
  {
    return getDisplay();
  }

  /**
      Creates a new cursor from the set of builtin cursors for the default display.
      See [gdk.cursor.Cursor.newForDisplay].
      
      To make the cursor invisible, use [gdk.types.CursorType.BlankCursor].
  
      Params:
        cursorType = cursor to create
      Returns: a new #GdkCursor
  
      Deprecated: Use [gdk.cursor.Cursor.newForDisplay] instead.
  */
  this(gdk.types.CursorType cursorType)
  {
    GdkCursor* _cretval;
    _cretval = gdk_cursor_new(cursorType);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new cursor from the set of builtin cursors.
  
      Params:
        display = the #GdkDisplay for which the cursor will be created
        cursorType = cursor to create
      Returns: a new #GdkCursor, or null on failure
  */
  static gdk.cursor.Cursor newForDisplay(gdk.display.Display display, gdk.types.CursorType cursorType)
  {
    GdkCursor* _cretval;
    _cretval = gdk_cursor_new_for_display(display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null, cursorType);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.cursor.Cursor)(cast(GdkCursor*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new cursor by looking up name in the current cursor
      theme.
      
      A recommended set of cursor names that will work across different
      platforms can be found in the CSS specification:
      $(LIST
        * "none"
        * ![](default_cursor.png) "default"
        * ![](help_cursor.png) "help"
        * ![](pointer_cursor.png) "pointer"
        * ![](context_menu_cursor.png) "context-menu"
        * ![](progress_cursor.png) "progress"
        * ![](wait_cursor.png) "wait"
        * ![](cell_cursor.png) "cell"
        * ![](crosshair_cursor.png) "crosshair"
        * ![](text_cursor.png) "text"
        * ![](vertical_text_cursor.png) "vertical-text"
        * ![](alias_cursor.png) "alias"
        * ![](copy_cursor.png) "copy"
        * ![](no_drop_cursor.png) "no-drop"
        * ![](move_cursor.png) "move"
        * ![](not_allowed_cursor.png) "not-allowed"
        * ![](grab_cursor.png) "grab"
        * ![](grabbing_cursor.png) "grabbing"
        * ![](all_scroll_cursor.png) "all-scroll"
        * ![](col_resize_cursor.png) "col-resize"
        * ![](row_resize_cursor.png) "row-resize"
        * ![](n_resize_cursor.png) "n-resize"
        * ![](e_resize_cursor.png) "e-resize"
        * ![](s_resize_cursor.png) "s-resize"
        * ![](w_resize_cursor.png) "w-resize"
        * ![](ne_resize_cursor.png) "ne-resize"
        * ![](nw_resize_cursor.png) "nw-resize"
        * ![](sw_resize_cursor.png) "sw-resize"
        * ![](se_resize_cursor.png) "se-resize"
        * ![](ew_resize_cursor.png) "ew-resize"
        * ![](ns_resize_cursor.png) "ns-resize"
        * ![](nesw_resize_cursor.png) "nesw-resize"
        * ![](nwse_resize_cursor.png) "nwse-resize"
        * ![](zoom_in_cursor.png) "zoom-in"
        * ![](zoom_out_cursor.png) "zoom-out"
      )
  
      Params:
        display = the #GdkDisplay for which the cursor will be created
        name = the name of the cursor
      Returns: a new #GdkCursor, or null if there is no
          cursor with the given name
  */
  static gdk.cursor.Cursor newFromName(gdk.display.Display display, string name)
  {
    GdkCursor* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gdk_cursor_new_from_name(display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null, _name);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.cursor.Cursor)(cast(GdkCursor*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new cursor from a pixbuf.
      
      Not all GDK backends support RGBA cursors. If they are not
      supported, a monochrome approximation will be displayed.
      The functions [gdk.display.Display.supportsCursorAlpha] and
      [gdk.display.Display.supportsCursorColor] can be used to determine
      whether RGBA cursors are supported;
      [gdk.display.Display.getDefaultCursorSize] and
      [gdk.display.Display.getMaximalCursorSize] give information about
      cursor sizes.
      
      If `x` or `y` are `-1`, the pixbuf must have
      options named “x_hot” and “y_hot”, resp., containing
      integer values between `0` and the width resp. height of
      the pixbuf. (Since: 3.0)
      
      On the X backend, support for RGBA cursors requires a
      sufficently new version of the X Render extension.
  
      Params:
        display = the #GdkDisplay for which the cursor will be created
        pixbuf = the #GdkPixbuf containing the cursor image
        x = the horizontal offset of the “hotspot” of the cursor.
        y = the vertical offset of the “hotspot” of the cursor.
      Returns: a new #GdkCursor.
  */
  static gdk.cursor.Cursor newFromPixbuf(gdk.display.Display display, gdkpixbuf.pixbuf.Pixbuf pixbuf, int x, int y)
  {
    GdkCursor* _cretval;
    _cretval = gdk_cursor_new_from_pixbuf(display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null, pixbuf ? cast(GdkPixbuf*)pixbuf._cPtr(No.Dup) : null, x, y);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.cursor.Cursor)(cast(GdkCursor*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new cursor from a cairo image surface.
      
      Not all GDK backends support RGBA cursors. If they are not
      supported, a monochrome approximation will be displayed.
      The functions [gdk.display.Display.supportsCursorAlpha] and
      [gdk.display.Display.supportsCursorColor] can be used to determine
      whether RGBA cursors are supported;
      [gdk.display.Display.getDefaultCursorSize] and
      [gdk.display.Display.getMaximalCursorSize] give information about
      cursor sizes.
      
      On the X backend, support for RGBA cursors requires a
      sufficently new version of the X Render extension.
  
      Params:
        display = the #GdkDisplay for which the cursor will be created
        surface = the cairo image surface containing the cursor pixel data
        x = the horizontal offset of the “hotspot” of the cursor
        y = the vertical offset of the “hotspot” of the cursor
      Returns: a new #GdkCursor.
  */
  static gdk.cursor.Cursor newFromSurface(gdk.display.Display display, cairo.surface.Surface surface, double x, double y)
  {
    GdkCursor* _cretval;
    _cretval = gdk_cursor_new_from_surface(display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null, surface ? cast(cairo_surface_t*)surface._cPtr(No.Dup) : null, x, y);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.cursor.Cursor)(cast(GdkCursor*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Returns the cursor type for this cursor.
      Returns: a #GdkCursorType
  */
  gdk.types.CursorType getCursorType()
  {
    GdkCursorType _cretval;
    _cretval = gdk_cursor_get_cursor_type(cast(GdkCursor*)this._cPtr);
    gdk.types.CursorType _retval = cast(gdk.types.CursorType)_cretval;
    return _retval;
  }

  /**
      Returns the display on which the #GdkCursor is defined.
      Returns: the #GdkDisplay associated to cursor
  */
  gdk.display.Display getDisplay()
  {
    GdkDisplay* _cretval;
    _cretval = gdk_cursor_get_display(cast(GdkCursor*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.display.Display)(cast(GdkDisplay*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns a #GdkPixbuf with the image used to display the cursor.
      
      Note that depending on the capabilities of the windowing system and
      on the cursor, GDK may not be able to obtain the image data. In this
      case, null is returned.
      Returns: a #GdkPixbuf representing
          cursor, or null
  */
  gdkpixbuf.pixbuf.Pixbuf getImage()
  {
    GdkPixbuf* _cretval;
    _cretval = gdk_cursor_get_image(cast(GdkCursor*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Returns a cairo image surface with the image used to display the cursor.
      
      Note that depending on the capabilities of the windowing system and
      on the cursor, GDK may not be able to obtain the image data. In this
      case, null is returned.
  
      Params:
        xHot = Location to store the hotspot x position,
            or null
        yHot = Location to store the hotspot y position,
            or null
      Returns: a #cairo_surface_t
          representing cursor, or null
  */
  cairo.surface.Surface getSurface(out double xHot, out double yHot)
  {
    cairo_surface_t* _cretval;
    _cretval = gdk_cursor_get_surface(cast(GdkCursor*)this._cPtr, cast(double*)&xHot, cast(double*)&yHot);
    auto _retval = _cretval ? new cairo.surface.Surface(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}

/// Fluent builder implementation template for [gdk.cursor.Cursor]
class CursorGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T cursorType(gdk.types.CursorType propval)
  {
    return setProperty("cursor-type", propval);
  }

  /** */
  T display(gdk.display.Display propval)
  {
    return setProperty("display", propval);
  }
}

/// Fluent builder for [gdk.cursor.Cursor]
final class CursorGidBuilder : CursorGidBuilderImpl!CursorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Cursor build()
  {
    return new Cursor(cast(void*)createGObject(Cursor._getGType), Yes.Take);
  }
}
