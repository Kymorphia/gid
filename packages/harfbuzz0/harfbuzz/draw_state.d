/// Module for [DrawState] class
module harfbuzz.draw_state;

import gid.gid;
import gobject.boxed;
import harfbuzz.c.functions;
import harfbuzz.c.types;
import harfbuzz.types;

/**
    Current drawing state.
*/
class DrawState : gobject.boxed.Boxed
{

  /**
      Create a `draw_state.DrawState` boxed type.
      Params:
        pathOpen = Whether there is an open path
        pathStartX = X component of the start of current path
        pathStartY = Y component of the start of current path
        currentX = X component of current point
        currentY = Y component of current point
  */
  this(harfbuzz.types.Bool pathOpen = harfbuzz.types.Bool.init, float pathStartX = 0.0, float pathStartY = 0.0, float currentX = 0.0, float currentY = 0.0)
  {
    super(gMalloc(hb_draw_state_t.sizeof), Yes.Take);
    this.pathOpen = pathOpen;
    this.pathStartX = pathStartX;
    this.pathStartY = pathStartY;
    this.currentX = currentX;
    this.currentY = currentY;
  }

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())hb_gobject_draw_state_get_type != &gidSymbolNotFound ? hb_gobject_draw_state_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DrawState self()
  {
    return this;
  }

  /**
      Get `pathOpen` field.
      Returns: Whether there is an open path
  */
  @property harfbuzz.types.Bool pathOpen()
  {
    return (cast(hb_draw_state_t*)this._cPtr).pathOpen;
  }

  /**
      Set `pathOpen` field.
      Params:
        propval = Whether there is an open path
  */
  @property void pathOpen(harfbuzz.types.Bool propval)
  {
    (cast(hb_draw_state_t*)this._cPtr).pathOpen = propval;
  }

  /**
      Get `pathStartX` field.
      Returns: X component of the start of current path
  */
  @property float pathStartX()
  {
    return (cast(hb_draw_state_t*)this._cPtr).pathStartX;
  }

  /**
      Set `pathStartX` field.
      Params:
        propval = X component of the start of current path
  */
  @property void pathStartX(float propval)
  {
    (cast(hb_draw_state_t*)this._cPtr).pathStartX = propval;
  }

  /**
      Get `pathStartY` field.
      Returns: Y component of the start of current path
  */
  @property float pathStartY()
  {
    return (cast(hb_draw_state_t*)this._cPtr).pathStartY;
  }

  /**
      Set `pathStartY` field.
      Params:
        propval = Y component of the start of current path
  */
  @property void pathStartY(float propval)
  {
    (cast(hb_draw_state_t*)this._cPtr).pathStartY = propval;
  }

  /**
      Get `currentX` field.
      Returns: X component of current point
  */
  @property float currentX()
  {
    return (cast(hb_draw_state_t*)this._cPtr).currentX;
  }

  /**
      Set `currentX` field.
      Params:
        propval = X component of current point
  */
  @property void currentX(float propval)
  {
    (cast(hb_draw_state_t*)this._cPtr).currentX = propval;
  }

  /**
      Get `currentY` field.
      Returns: Y component of current point
  */
  @property float currentY()
  {
    return (cast(hb_draw_state_t*)this._cPtr).currentY;
  }

  /**
      Set `currentY` field.
      Params:
        propval = Y component of current point
  */
  @property void currentY(float propval)
  {
    (cast(hb_draw_state_t*)this._cPtr).currentY = propval;
  }
}
