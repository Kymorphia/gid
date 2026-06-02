/// Module for [ScrollInfo] class
module gtk.scroll_info;

public import gid.basictypes;
import gid.gid;
import gobject.boxed;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    The [gtk.scroll_info.ScrollInfo] can be used to provide more accurate data on how a scroll
    operation should be performed.
    
    Scrolling functions usually allow passing a null scroll info which will cause
    the default values to be used and just scroll the element into view.
*/
class ScrollInfo : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_scroll_info_get_type != &gidSymbolNotFound ? gtk_scroll_info_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ScrollInfo self() nothrow
  {
    return this;
  }

  /**
      Creates a new scroll info for scrolling an element into view.
      Returns: A new scroll info
  */
  this() nothrow
  {
    GtkScrollInfo* _cretval;
    _cretval = gtk_scroll_info_new();
    this(_cretval, Yes.Take);
  }

  /**
      Checks if horizontal scrolling is enabled.
      Returns: true if horizontal scrolling is enabled.
  */
  bool getEnableHorizontal() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_scroll_info_get_enable_horizontal(cast(GtkScrollInfo*)this._cPtr);
    return _retval;
  }

  /**
      Checks if vertical scrolling is enabled.
      Returns: true if vertical scrolling is enabled.
  */
  bool getEnableVertical() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_scroll_info_get_enable_vertical(cast(GtkScrollInfo*)this._cPtr);
    return _retval;
  }

  /**
      Turns horizontal scrolling on or off.
  
      Params:
        horizontal = if scrolling in the horizontal direction
              should happen
  */
  void setEnableHorizontal(bool horizontal) nothrow
  {
    gtk_scroll_info_set_enable_horizontal(cast(GtkScrollInfo*)this._cPtr, horizontal);
  }

  /**
      Turns vertical scrolling on or off.
  
      Params:
        vertical = if scrolling in the vertical direction
              should happen
  */
  void setEnableVertical(bool vertical) nothrow
  {
    gtk_scroll_info_set_enable_vertical(cast(GtkScrollInfo*)this._cPtr, vertical);
  }
}
