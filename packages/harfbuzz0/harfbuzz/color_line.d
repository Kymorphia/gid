/// Module for [ColorLine] class
module harfbuzz.color_line;

public import gid.basictypes;
import gid.gid;
import gobject.boxed;
import harfbuzz.c.functions;
import harfbuzz.c.types;
import harfbuzz.types;

/**
    A struct containing color information for a gradient.
*/
class ColorLine : gobject.boxed.Boxed
{

  /**
      Create a `color_line.ColorLine` boxed type.
      Params:
        getColorStops = 
        getExtend = 
  */
  this(hb_color_line_get_color_stops_func_t getColorStops = hb_color_line_get_color_stops_func_t.init, hb_color_line_get_extend_func_t getExtend = hb_color_line_get_extend_func_t.init) nothrow
  {
    super(gMalloc(hb_color_line_t.sizeof), Yes.Take);
    this.getColorStops = getColorStops;
    this.getExtend = getExtend;
  }

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
    return cast(void function())hb_gobject_color_line_get_type != &gidSymbolNotFound ? hb_gobject_color_line_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ColorLine self() nothrow
  {
    return this;
  }

  /** */
  @property hb_color_line_get_color_stops_func_t getColorStops() nothrow
  {
    return (cast(hb_color_line_t*)this._cPtr).getColorStops;
  }

  /** */

  @property void getColorStops(hb_color_line_get_color_stops_func_t propval) nothrow
  {
    (cast(hb_color_line_t*)this._cPtr).getColorStops = propval;
  }

  /** */
  @property hb_color_line_get_extend_func_t getExtend() nothrow
  {
    return (cast(hb_color_line_t*)this._cPtr).getExtend;
  }

  /** */

  @property void getExtend(hb_color_line_get_extend_func_t propval) nothrow
  {
    (cast(hb_color_line_t*)this._cPtr).getExtend = propval;
  }
}
