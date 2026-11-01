/// Module for [Cursor] class
module gdk.cursor;

public import gid.basictypes;
import gdk.c.functions;
import gdk.c.types;
import gdk.texture;
import gdk.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/**
    Used to create and destroy cursors.
    
    Cursors are immutable objects, so once you created them, there is no way
    to modify them later. You should create a new cursor when you want to change
    something about it.
    
    Cursors by themselves are not very interesting: they must be bound to a
    window for users to see them. This is done with [gdk.surface.Surface.setCursor]
    or [gdk.surface.Surface.setDeviceCursor]. Applications will typically
    use higher-level GTK functions such as [[gtk.widget.Widget.setCursor]](../gtk4/method.Widget.set_cursor.html)
    instead.
    
    Cursors are not bound to a given [gdk.display.Display], so they can be shared.
    However, the appearance of cursors may vary when used on different
    platforms.
    
    ## Named and texture cursors
    
    There are multiple ways to create cursors. The platform's own cursors
    can be created with [gdk.cursor.Cursor.newFromName]. That function lists
    the commonly available names that are shared with the CSS specification.
    Other names may be available, depending on the platform in use. On some
    platforms, what images are used for named cursors may be influenced by
    the cursor theme.
    
    Another option to create a cursor is to use [gdk.cursor.Cursor.newFromTexture]
    and provide an image to use for the cursor.
    
    To ease work with unsupported cursors, a fallback cursor can be provided.
    If a [gdk.surface.Surface] cannot use a cursor because of the reasons mentioned
    above, it will try the fallback cursor. Fallback cursors can themselves have
    fallback cursors again, so it is possible to provide a chain of progressively
    easier to support cursors. If none of the provided cursors can be supported,
    the default cursor will be the ultimate fallback.
*/
class Cursor : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gdk_cursor_get_type != &gidSymbolNotFound ? gdk_cursor_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Cursor self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gdk.cursor.Cursor]
      Returns: New builder object
  */
  static CursorGidBuilder builder() nothrow
  {
    return new CursorGidBuilder;
  }

  /**
      Get `fallback` property.
      Returns: Cursor to fall back to if this cursor cannot be displayed.
  */
  @property gdk.cursor.Cursor fallback() nothrow
  {
    return getFallback();
  }

  /**
      Get `hotspotX` property.
      Returns: X position of the cursor hotspot in the cursor image.
  */
  @property int hotspotX() nothrow
  {
    return getHotspotX();
  }

  /**
      Get `hotspotY` property.
      Returns: Y position of the cursor hotspot in the cursor image.
  */
  @property int hotspotY() nothrow
  {
    return getHotspotY();
  }

  /**
      Get `name` property.
      Returns: Name of this this cursor.
        
        The name will be null if the cursor was created from a texture.
  */
  @property string name() nothrow
  {
    return getName();
  }

  /**
      Get `texture` property.
      Returns: The texture displayed by this cursor.
        
        The texture will be null if the cursor was created from a name.
  */
  @property gdk.texture.Texture texture() nothrow
  {
    return getTexture();
  }

  /**
      Creates a new callback-based cursor object.
      
      Cursors of this kind produce textures for the cursor
      image on demand, when the callback is called.
  
      Params:
        callback = the [gdk.types.CursorGetTextureCallback]
        fallback = the [gdk.cursor.Cursor] to fall back to when
            this one cannot be supported
      Returns: a new [gdk.cursor.Cursor]
  */
  static gdk.cursor.Cursor newFromCallback(gdk.types.CursorGetTextureCallback callback, gdk.cursor.Cursor fallback = null) nothrow
  {
    extern(C) GdkTexture* _callbackCallback(GdkCursor* cursor, int cursorSize, double scale, int* width, int* height, int* hotspotX, int* hotspotY, void* data) nothrow
    {
      gdk.texture.Texture _dretval;
      auto _dlg = cast(gdk.types.CursorGetTextureCallback*)data;

      try
      {
        _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gdk.cursor.Cursor)(cast(void*)cursor, No.Take), cursorSize, scale, *width, *height, *hotspotX, *hotspotY);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gdk.types.CursorGetTextureCallback");
      }
      auto _retval = _dretval ? cast(GdkTexture*)_dretval._cPtr(Yes.Dup) : null;

      return _retval;
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    GdkCursor* _cretval;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    GDestroyNotify _callbackDestroyCB = callback ? &thawDelegate : null;
    _cretval = gdk_cursor_new_from_callback(_callbackCB, _callback, _callbackDestroyCB, fallback ? cast(GdkCursor*)fallback._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.cursor.Cursor)(cast(GdkCursor*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new cursor by looking up name in the current cursor
      theme.
      
      A recommended set of cursor names that will work across different
      platforms can be found in the CSS specification:
      
      | | | |
      | --- | --- | --- |
      |                               | "none"          | No cursor |
      | ![](default_cursor.png)       | "default"       | The default cursor |
      | ![](help_cursor.png)          | "help"          | Help is available |
      | ![](pointer_cursor.png)       | "pointer"       | Indicates a link or interactive element |
      | ![](context_menu_cursor.png)  |"context-menu"   | A context menu is available |
      | ![](progress_cursor.png)      | "progress"      | Progress indicator |
      | ![](wait_cursor.png)          | "wait"          | Busy cursor |
      | ![](cell_cursor.png)          | "cell"          | Cell(s) may be selected |
      | ![](crosshair_cursor.png)     | "crosshair"     | Simple crosshair |
      | ![](text_cursor.png)          | "text"          | Text may be selected |
      | ![](vertical_text_cursor.png) | "vertical-text" | Vertical text may be selected |
      | ![](alias_cursor.png)         | "alias"         | DND: Something will be linked |
      | ![](copy_cursor.png)          | "copy"          | DND: Something will be copied |
      | ![](move_cursor.png)          | "move"          | DND: Something will be moved |
      | ![](dnd_ask_cursor.png)       | "dnd-ask"       | DND: User can choose action to be carried out |
      | ![](no_drop_cursor.png)       | "no-drop"       | DND: Can't drop here |
      | ![](not_allowed_cursor.png)   | "not-allowed"   | DND: Action will not be carried out |
      | ![](grab_cursor.png)          | "grab"          | DND: Something can be grabbed |
      | ![](grabbing_cursor.png)      | "grabbing"      | DND: Something is being grabbed |
      | ![](n_resize_cursor.png)      | "n-resize"      | Resizing: Move north border |
      | ![](e_resize_cursor.png)      | "e-resize"      | Resizing: Move east border |
      | ![](s_resize_cursor.png)      | "s-resize"      | Resizing: Move south border |
      | ![](w_resize_cursor.png)      | "w-resize"      | Resizing: Move west border |
      | ![](ne_resize_cursor.png)     | "ne-resize"     | Resizing: Move north-east corner |
      | ![](nw_resize_cursor.png)     | "nw-resize"     | Resizing: Move north-west corner |
      | ![](sw_resize_cursor.png)     | "sw-resize"     | Resizing: Move south-west corner |
      | ![](se_resize_cursor.png)     | "se-resize"     | Resizing: Move south-east corner |
      | ![](col_resize_cursor.png)    | "col-resize"    | Resizing: Move an item or border horizontally |
      | ![](row_resize_cursor.png)    | "row-resize"    | Resizing: Move an item or border vertically |
      | ![](ew_resize_cursor.png)     | "ew-resize"     | Moving: Something can be moved horizontally |
      | ![](ns_resize_cursor.png)     | "ns-resize"     | Moving: Something can be moved vertically |
      | ![](nesw_resize_cursor.png)   | "nesw-resize"   | Moving: Something can be moved diagonally, north-east to south-west |
      | ![](nwse_resize_cursor.png)   | "nwse-resize"   | Moving: something can be moved diagonally, north-west to south-east |
      | ![](all_resize_cursor.png)    | "all-resize"    | Moving: Something can be moved in any direction |
      | ![](all_scroll_cursor.png)    | "all-scroll"    | Can scroll in any direction |
      | ![](zoom_in_cursor.png)       | "zoom-in"       | Zoom in |
      | ![](zoom_out_cursor.png)      | "zoom-out"      | Zoom out |
  
      Params:
        name = the name of the cursor
        fallback = null or the [gdk.cursor.Cursor] to fall back to when
            this one cannot be supported
      Returns: a new [gdk.cursor.Cursor], or null if there is no
          cursor with the given name
  */
  static gdk.cursor.Cursor newFromName(string name, gdk.cursor.Cursor fallback = null) nothrow
  {
    GdkCursor* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _cretval = gdk_cursor_new_from_name(_name, fallback ? cast(GdkCursor*)fallback._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.cursor.Cursor)(cast(GdkCursor*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new cursor from a [gdk.texture.Texture].
  
      Params:
        texture = the texture providing the pixel data
        hotspotX = the horizontal offset of the “hotspot” of the cursor
        hotspotY = the vertical offset of the “hotspot” of the cursor
        fallback = the [gdk.cursor.Cursor] to fall back to when
            this one cannot be supported
      Returns: a new [gdk.cursor.Cursor]
  */
  static gdk.cursor.Cursor newFromTexture(gdk.texture.Texture texture, int hotspotX, int hotspotY, gdk.cursor.Cursor fallback = null) nothrow
  {
    GdkCursor* _cretval;
    _cretval = gdk_cursor_new_from_texture(texture ? cast(GdkTexture*)texture._cPtr(No.Dup) : null, hotspotX, hotspotY, fallback ? cast(GdkCursor*)fallback._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.cursor.Cursor)(cast(GdkCursor*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Returns the fallback for this cursor.
      
      The fallback will be used if this cursor is not available on a given
      [gdk.display.Display]. For named cursors, this can happen when using nonstandard
      names or when using an incomplete cursor theme. For textured cursors,
      this can happen when the texture is too large or when the [gdk.display.Display]
      it is used on does not support textured cursors.
      Returns: the fallback of the cursor or null
          to use the default cursor as fallback
  */
  gdk.cursor.Cursor getFallback() nothrow
  {
    GdkCursor* _cretval;
    _cretval = gdk_cursor_get_fallback(cast(GdkCursor*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.cursor.Cursor)(cast(GdkCursor*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the horizontal offset of the hotspot.
      
      The hotspot indicates the pixel that will be directly above the cursor.
      
      Note that named cursors may have a nonzero hotspot, but this function
      will only return the hotspot position for cursors created with
      [gdk.cursor.Cursor.newFromTexture].
      Returns: the horizontal offset of the hotspot or 0 for named cursors
  */
  int getHotspotX() nothrow
  {
    int _retval;
    _retval = gdk_cursor_get_hotspot_x(cast(GdkCursor*)this._cPtr);
    return _retval;
  }

  /**
      Returns the vertical offset of the hotspot.
      
      The hotspot indicates the pixel that will be directly above the cursor.
      
      Note that named cursors may have a nonzero hotspot, but this function
      will only return the hotspot position for cursors created with
      [gdk.cursor.Cursor.newFromTexture].
      Returns: the vertical offset of the hotspot or 0 for named cursors
  */
  int getHotspotY() nothrow
  {
    int _retval;
    _retval = gdk_cursor_get_hotspot_y(cast(GdkCursor*)this._cPtr);
    return _retval;
  }

  /**
      Returns the name of the cursor.
      
      If the cursor is not a named cursor, null will be returned.
      Returns: the name of the cursor or null
          if it is not a named cursor
  */
  string getName() nothrow
  {
    const(char)* _cretval;
    _cretval = gdk_cursor_get_name(cast(GdkCursor*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Returns the texture for the cursor.
      
      If the cursor is a named cursor, null will be returned.
      Returns: the texture for cursor or null
          if it is a named cursor
  */
  gdk.texture.Texture getTexture() nothrow
  {
    GdkTexture* _cretval;
    _cretval = gdk_cursor_get_texture(cast(GdkCursor*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.texture.Texture)(cast(GdkTexture*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gdk.cursor.Cursor]
class CursorGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `fallback` property.
      Params:
        propval = Cursor to fall back to if this cursor cannot be displayed.
      Returns: Builder instance for fluent chaining
  */
  T fallback(gdk.cursor.Cursor propval) nothrow
  {
    return setProperty("fallback", propval);
  }

  /**
      Set `hotspotX` property.
      Params:
        propval = X position of the cursor hotspot in the cursor image.
      Returns: Builder instance for fluent chaining
  */
  T hotspotX(int propval) nothrow
  {
    return setProperty("hotspot-x", propval);
  }

  /**
      Set `hotspotY` property.
      Params:
        propval = Y position of the cursor hotspot in the cursor image.
      Returns: Builder instance for fluent chaining
  */
  T hotspotY(int propval) nothrow
  {
    return setProperty("hotspot-y", propval);
  }

  /**
      Set `name` property.
      Params:
        propval = Name of this this cursor.
          
          The name will be null if the cursor was created from a texture.
      Returns: Builder instance for fluent chaining
  */
  T name(string propval) nothrow
  {
    return setProperty("name", propval);
  }

  /**
      Set `texture` property.
      Params:
        propval = The texture displayed by this cursor.
          
          The texture will be null if the cursor was created from a name.
      Returns: Builder instance for fluent chaining
  */
  T texture(gdk.texture.Texture propval) nothrow
  {
    return setProperty("texture", propval);
  }
}

/// Fluent builder for [gdk.cursor.Cursor]
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
