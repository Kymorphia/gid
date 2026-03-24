/// Module for [Cursor] class
module gdk.cursor;

import gdk.c.functions;
import gdk.c.types;
import gdk.texture;
import gdk.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/**
    [gdk.cursor.Cursor] is used to create and destroy cursors.
    
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

  /**
      Get `fallback` property.
      Returns: Cursor to fall back to if this cursor cannot be displayed.
  */
  @property gdk.cursor.Cursor fallback()
  {
    return getFallback();
  }

  /**
      Get `hotspotX` property.
      Returns: X position of the cursor hotspot in the cursor image.
  */
  @property int hotspotX()
  {
    return getHotspotX();
  }

  /**
      Get `hotspotY` property.
      Returns: Y position of the cursor hotspot in the cursor image.
  */
  @property int hotspotY()
  {
    return getHotspotY();
  }

  /**
      Get `name` property.
      Returns: Name of this this cursor.
        
        The name will be null if the cursor was created from a texture.
  */
  @property string name()
  {
    return getName();
  }

  /**
      Get `texture` property.
      Returns: The texture displayed by this cursor.
        
        The texture will be null if the cursor was created from a name.
  */
  @property gdk.texture.Texture texture()
  {
    return getTexture();
  }

  /**
      Creates a new cursor by looking up name in the current cursor
      theme.
      
      A recommended set of cursor names that will work across different
      platforms can be found in the CSS specification:
      
      | | | | |
      | --- | --- | ---- | --- |
      | "none" | ![](default_cursor.png) "default" | ![](help_cursor.png) "help" | ![](pointer_cursor.png) "pointer" |
      | ![](context_menu_cursor.png) "context-menu" | ![](progress_cursor.png) "progress" | ![](wait_cursor.png) "wait" | ![](cell_cursor.png) "cell" |
      | ![](crosshair_cursor.png) "crosshair" | ![](text_cursor.png) "text" | ![](vertical_text_cursor.png) "vertical-text" | ![](alias_cursor.png) "alias" |
      | ![](copy_cursor.png) "copy" | ![](no_drop_cursor.png) "no-drop" | ![](move_cursor.png) "move" | ![](not_allowed_cursor.png) "not-allowed" |
      | ![](grab_cursor.png) "grab" | ![](grabbing_cursor.png) "grabbing" | ![](all_scroll_cursor.png) "all-scroll" | ![](col_resize_cursor.png) "col-resize" |
      | ![](row_resize_cursor.png) "row-resize" | ![](n_resize_cursor.png) "n-resize" | ![](e_resize_cursor.png) "e-resize" | ![](s_resize_cursor.png) "s-resize" |
      | ![](w_resize_cursor.png) "w-resize" | ![](ne_resize_cursor.png) "ne-resize" | ![](nw_resize_cursor.png) "nw-resize" | ![](sw_resize_cursor.png) "sw-resize" |
      | ![](se_resize_cursor.png) "se-resize" | ![](ew_resize_cursor.png) "ew-resize" | ![](ns_resize_cursor.png) "ns-resize" | ![](nesw_resize_cursor.png) "nesw-resize" |
      | ![](nwse_resize_cursor.png) "nwse-resize" | ![](zoom_in_cursor.png) "zoom-in" | ![](zoom_out_cursor.png) "zoom-out" | |
  
      Params:
        name = the name of the cursor
        fallback = null or the [gdk.cursor.Cursor] to fall back to when
            this one cannot be supported
      Returns: a new [gdk.cursor.Cursor], or null if there is no
          cursor with the given name
  */
  static gdk.cursor.Cursor newFromName(string name, gdk.cursor.Cursor fallback = null)
  {
    GdkCursor* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
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
  static gdk.cursor.Cursor newFromTexture(gdk.texture.Texture texture, int hotspotX, int hotspotY, gdk.cursor.Cursor fallback = null)
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
  gdk.cursor.Cursor getFallback()
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
  int getHotspotX()
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
  int getHotspotY()
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
  string getName()
  {
    const(char)* _cretval;
    _cretval = gdk_cursor_get_name(cast(GdkCursor*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns the texture for the cursor.
      
      If the cursor is a named cursor, null will be returned.
      Returns: the texture for cursor or null
          if it is a named cursor
  */
  gdk.texture.Texture getTexture()
  {
    GdkTexture* _cretval;
    _cretval = gdk_cursor_get_texture(cast(GdkCursor*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.texture.Texture)(cast(GdkTexture*)_cretval, No.Take);
    return _retval;
  }
}

class CursorGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `fallback` property.
      Params:
        propval = Cursor to fall back to if this cursor cannot be displayed.
      Returns: Builder instance for fluent chaining
  */
  T fallback(gdk.cursor.Cursor propval)
  {
    return setProperty("fallback", propval);
  }

  /**
      Set `hotspotX` property.
      Params:
        propval = X position of the cursor hotspot in the cursor image.
      Returns: Builder instance for fluent chaining
  */
  T hotspotX(int propval)
  {
    return setProperty("hotspot-x", propval);
  }

  /**
      Set `hotspotY` property.
      Params:
        propval = Y position of the cursor hotspot in the cursor image.
      Returns: Builder instance for fluent chaining
  */
  T hotspotY(int propval)
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
  T name(string propval)
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
  T texture(gdk.texture.Texture propval)
  {
    return setProperty("texture", propval);
  }
}

/// Fluent builder for [gdk.cursor.Cursor]
final class CursorGidBuilder : CursorGidBuilderImpl!CursorGidBuilder
{
  Cursor build()
  {
    return new Cursor(cast(void*)createGObject(Cursor._getGType), No.Take);
  }
}
