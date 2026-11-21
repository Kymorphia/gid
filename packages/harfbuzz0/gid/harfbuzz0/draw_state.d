/// Module for [DrawState] class
module gid.harfbuzz0.draw_state;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.boxed;
import gid.harfbuzz0.c.functions;
import gid.harfbuzz0.c.types;
import gid.harfbuzz0.types;

/**
    Current drawing state.
*/
class DrawState : gid.gobject2.boxed.BoxedWrap!(hb_gobject_draw_state_get_type)
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
  this(gid.harfbuzz0.types.Bool pathOpen = gid.harfbuzz0.types.Bool.init, float pathStartX = 0.0, float pathStartY = 0.0, float currentX = 0.0, float currentY = 0.0) nothrow
  {
    super(boxedNew!hb_draw_state_t(_getGType), Yes.Take);
    this.pathOpen = pathOpen;
    this.pathStartX = pathStartX;
    this.pathStartY = pathStartY;
    this.currentX = currentX;
    this.currentY = currentY;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override DrawState self() nothrow
  {
    return this;
  }

  /**
      Get `pathOpen` field.
      Returns: Whether there is an open path
  */
  @property gid.harfbuzz0.types.Bool pathOpen() nothrow
  {
    return (cast(hb_draw_state_t*)this._cPtr).pathOpen;
  }

  /**
      Set `pathOpen` field.
      Params:
        propval = Whether there is an open path
  */
  @property void pathOpen(gid.harfbuzz0.types.Bool propval) nothrow
  {
    (cast(hb_draw_state_t*)this._cPtr).pathOpen = propval;
  }

  /**
      Get `pathStartX` field.
      Returns: X component of the start of current path
  */
  @property float pathStartX() nothrow
  {
    return (cast(hb_draw_state_t*)this._cPtr).pathStartX;
  }

  /**
      Set `pathStartX` field.
      Params:
        propval = X component of the start of current path
  */
  @property void pathStartX(float propval) nothrow
  {
    (cast(hb_draw_state_t*)this._cPtr).pathStartX = propval;
  }

  /**
      Get `pathStartY` field.
      Returns: Y component of the start of current path
  */
  @property float pathStartY() nothrow
  {
    return (cast(hb_draw_state_t*)this._cPtr).pathStartY;
  }

  /**
      Set `pathStartY` field.
      Params:
        propval = Y component of the start of current path
  */
  @property void pathStartY(float propval) nothrow
  {
    (cast(hb_draw_state_t*)this._cPtr).pathStartY = propval;
  }

  /**
      Get `currentX` field.
      Returns: X component of current point
  */
  @property float currentX() nothrow
  {
    return (cast(hb_draw_state_t*)this._cPtr).currentX;
  }

  /**
      Set `currentX` field.
      Params:
        propval = X component of current point
  */
  @property void currentX(float propval) nothrow
  {
    (cast(hb_draw_state_t*)this._cPtr).currentX = propval;
  }

  /**
      Get `currentY` field.
      Returns: Y component of current point
  */
  @property float currentY() nothrow
  {
    return (cast(hb_draw_state_t*)this._cPtr).currentY;
  }

  /**
      Set `currentY` field.
      Params:
        propval = Y component of current point
  */
  @property void currentY(float propval) nothrow
  {
    (cast(hb_draw_state_t*)this._cPtr).currentY = propval;
  }
}
