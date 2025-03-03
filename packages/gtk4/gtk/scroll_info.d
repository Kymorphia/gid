module gtk.scroll_info;

import gid.gid;
import gobject.boxed;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
 * The `GtkScrollInfo` can be used to provide more accurate data on how a scroll
 * operation should be performed.
 * Scrolling functions usually allow passing a %NULL scroll info which will cause
 * the default values to be used and just scroll the element into view.
 */
class ScrollInfo : gobject.boxed.Boxed
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  void* cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_scroll_info_get_type != &gidSymbolNotFound ? gtk_scroll_info_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new scroll info for scrolling an element into view.
   * Returns: A new scroll info
   */
  this()
  {
    GtkScrollInfo* _cretval;
    _cretval = gtk_scroll_info_new();
    this(_cretval, Yes.Take);
  }

  /**
   * Checks if horizontal scrolling is enabled.
   * Returns: %TRUE if horizontal scrolling is enabled.
   */
  bool getEnableHorizontal()
  {
    bool _retval;
    _retval = gtk_scroll_info_get_enable_horizontal(cast(GtkScrollInfo*)cPtr);
    return _retval;
  }

  /**
   * Checks if vertical scrolling is enabled.
   * Returns: %TRUE if vertical scrolling is enabled.
   */
  bool getEnableVertical()
  {
    bool _retval;
    _retval = gtk_scroll_info_get_enable_vertical(cast(GtkScrollInfo*)cPtr);
    return _retval;
  }

  /**
   * Turns horizontal scrolling on or off.
   * Params:
   *   horizontal = if scrolling in the horizontal direction
   *     should happen
   */
  void setEnableHorizontal(bool horizontal)
  {
    gtk_scroll_info_set_enable_horizontal(cast(GtkScrollInfo*)cPtr, horizontal);
  }

  /**
   * Turns vertical scrolling on or off.
   * Params:
   *   vertical = if scrolling in the vertical direction
   *     should happen
   */
  void setEnableVertical(bool vertical)
  {
    gtk_scroll_info_set_enable_vertical(cast(GtkScrollInfo*)cPtr, vertical);
  }
}
