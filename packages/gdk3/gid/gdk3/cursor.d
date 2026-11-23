/// Module for [Cursor] class
module gid.gdk3.cursor;

public import gid.core.basictypes;
import gid.cairo1.surface;
import gid.core.utils;
import gid.gdk3.c.functions;
import gid.gdk3.c.types;
import gid.gdk3.display;
import gid.gdk3.types;
import gid.gdkpixbuf2.pixbuf;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    A #GdkCursor represents a cursor. Its contents are private.
*/
class Cursor : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gdk_cursor_get_type != &gidSymbolNotFound ? gdk_cursor_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GdkCursor";
  }

  /** Returns `this`, for use in `with` statements. */
  override Cursor self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gdk3.cursor.Cursor]
      Returns: New builder object
  */
  static CursorGidBuilder builder() nothrow
  {
    return new CursorGidBuilder;
  }

  /** */
  @property gid.gdk3.types.CursorType cursorType() nothrow
  {
    return getCursorType();
  }

  /** */
  @property gid.gdk3.display.Display display() nothrow
  {
    return getDisplay();
  }

  /**
      Creates a new cursor from the set of builtin cursors for the default display.
      See [gid.gdk3.cursor.Cursor.newForDisplay].
      
      To make the cursor invisible, use [gid.gdk3.types.CursorType.BlankCursor].
  
      Params:
        cursorType = cursor to create
      Returns: a new #GdkCursor
  
      Deprecated: Use [gid.gdk3.cursor.Cursor.newForDisplay] instead.
  */
  this(gid.gdk3.types.CursorType cursorType) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GdkCursor* _cretval;
      _cretval = gdk_cursor_new(cursorType);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Creates a new cursor from the set of builtin cursors.
  
      Params:
        display = the #GdkDisplay for which the cursor will be created
        cursorType = cursor to create
      Returns: a new #GdkCursor, or null on failure
  */
  static gid.gdk3.cursor.Cursor newForDisplay(gid.gdk3.display.Display display, gid.gdk3.types.CursorType cursorType) nothrow
  {
    GdkCursor* _cretval;
    _cretval = gdk_cursor_new_for_display(display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null, cursorType);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.cursor.Cursor)(cast(GdkCursor*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new cursor by looking up name in the current cursor
      theme.
      
      A recommended set of cursor names that will work across different
      platforms can be found in the CSS specification:
      - "none"
      - ![](default_cursor.png) "default"
      - ![](help_cursor.png) "help"
      - ![](pointer_cursor.png) "pointer"
      - ![](context_menu_cursor.png) "context-menu"
      - ![](progress_cursor.png) "progress"
      - ![](wait_cursor.png) "wait"
      - ![](cell_cursor.png) "cell"
      - ![](crosshair_cursor.png) "crosshair"
      - ![](text_cursor.png) "text"
      - ![](vertical_text_cursor.png) "vertical-text"
      - ![](alias_cursor.png) "alias"
      - ![](copy_cursor.png) "copy"
      - ![](no_drop_cursor.png) "no-drop"
      - ![](move_cursor.png) "move"
      - ![](not_allowed_cursor.png) "not-allowed"
      - ![](grab_cursor.png) "grab"
      - ![](grabbing_cursor.png) "grabbing"
      - ![](all_scroll_cursor.png) "all-scroll"
      - ![](col_resize_cursor.png) "col-resize"
      - ![](row_resize_cursor.png) "row-resize"
      - ![](n_resize_cursor.png) "n-resize"
      - ![](e_resize_cursor.png) "e-resize"
      - ![](s_resize_cursor.png) "s-resize"
      - ![](w_resize_cursor.png) "w-resize"
      - ![](ne_resize_cursor.png) "ne-resize"
      - ![](nw_resize_cursor.png) "nw-resize"
      - ![](sw_resize_cursor.png) "sw-resize"
      - ![](se_resize_cursor.png) "se-resize"
      - ![](ew_resize_cursor.png) "ew-resize"
      - ![](ns_resize_cursor.png) "ns-resize"
      - ![](nesw_resize_cursor.png) "nesw-resize"
      - ![](nwse_resize_cursor.png) "nwse-resize"
      - ![](zoom_in_cursor.png) "zoom-in"
      - ![](zoom_out_cursor.png) "zoom-out"
      
      Additionally, the following cursor names are supported, which are
      not in the CSS specification:
      - ![](dnd_ask_cursor.png) "dnd-ask"
      - ![](all_resize_cursor.png) "all-resize"
  
      Params:
        display = the #GdkDisplay for which the cursor will be created
        name = the name of the cursor
      Returns: a new #GdkCursor, or null if there is no
          cursor with the given name
  */
  static gid.gdk3.cursor.Cursor newFromName(gid.gdk3.display.Display display, string name) nothrow
  {
    GdkCursor* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _cretval = gdk_cursor_new_from_name(display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null, _name);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.cursor.Cursor)(cast(GdkCursor*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new cursor from a pixbuf.
      
      Not all GDK backends support RGBA cursors. If they are not
      supported, a monochrome approximation will be displayed.
      The functions [gid.gdk3.display.Display.supportsCursorAlpha] and
      [gid.gdk3.display.Display.supportsCursorColor] can be used to determine
      whether RGBA cursors are supported;
      [gid.gdk3.display.Display.getDefaultCursorSize] and
      [gid.gdk3.display.Display.getMaximalCursorSize] give information about
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
  static gid.gdk3.cursor.Cursor newFromPixbuf(gid.gdk3.display.Display display, gid.gdkpixbuf2.pixbuf.Pixbuf pixbuf, int x, int y) nothrow
  {
    GdkCursor* _cretval;
    _cretval = gdk_cursor_new_from_pixbuf(display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null, pixbuf ? cast(GdkPixbuf*)pixbuf._cPtr(No.Dup) : null, x, y);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.cursor.Cursor)(cast(GdkCursor*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new cursor from a cairo image surface.
      
      Not all GDK backends support RGBA cursors. If they are not
      supported, a monochrome approximation will be displayed.
      The functions [gid.gdk3.display.Display.supportsCursorAlpha] and
      [gid.gdk3.display.Display.supportsCursorColor] can be used to determine
      whether RGBA cursors are supported;
      [gid.gdk3.display.Display.getDefaultCursorSize] and
      [gid.gdk3.display.Display.getMaximalCursorSize] give information about
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
  static gid.gdk3.cursor.Cursor newFromSurface(gid.gdk3.display.Display display, gid.cairo1.surface.Surface surface, double x, double y) nothrow
  {
    GdkCursor* _cretval;
    _cretval = gdk_cursor_new_from_surface(display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null, surface ? cast(cairo_surface_t*)surface._cPtr(No.Dup) : null, x, y);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.cursor.Cursor)(cast(GdkCursor*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Returns the cursor type for this cursor.
      Returns: a #GdkCursorType
  */
  gid.gdk3.types.CursorType getCursorType() nothrow
  {
    GdkCursorType _cretval;
    _cretval = gdk_cursor_get_cursor_type(cast(GdkCursor*)this._cPtr);
    gid.gdk3.types.CursorType _retval = cast(gid.gdk3.types.CursorType)_cretval;
    return _retval;
  }

  /**
      Returns the display on which the #GdkCursor is defined.
      Returns: the #GdkDisplay associated to cursor
  */
  gid.gdk3.display.Display getDisplay() nothrow
  {
    GdkDisplay* _cretval;
    _cretval = gdk_cursor_get_display(cast(GdkCursor*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.display.Display)(cast(GdkDisplay*)_cretval, No.Take);
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
  gid.gdkpixbuf2.pixbuf.Pixbuf getImage() nothrow
  {
    GdkPixbuf* _cretval;
    _cretval = gdk_cursor_get_image(cast(GdkCursor*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdkpixbuf2.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
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
  gid.cairo1.surface.Surface getSurface(out double xHot, out double yHot) nothrow
  {
    cairo_surface_t* _cretval;
    _cretval = gdk_cursor_get_surface(cast(GdkCursor*)this._cPtr, cast(double*)&xHot, cast(double*)&yHot);
    auto _retval = _cretval ? new gid.cairo1.surface.Surface(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gdk3.cursor.Cursor]
class CursorGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T cursorType(gid.gdk3.types.CursorType propval) nothrow
  {
    return setProperty("cursor-type", propval);
  }

  /** */
  T display(gid.gdk3.display.Display propval) nothrow
  {
    return setProperty("display", propval);
  }
}

/// Fluent builder for [gid.gdk3.cursor.Cursor]
final class CursorGidBuilder : CursorGidBuilderImpl!CursorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Cursor build() nothrow
  {
    return new Cursor(cast(void*)createGObject(Cursor._getGType), Yes.Take);
  }
}
