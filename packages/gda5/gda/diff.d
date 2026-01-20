/// Module for [Diff] class
module gda.diff;

import gda.c.functions;
import gda.c.types;
import gda.types;
import gid.gid;

/** */
class Diff
{
  GdaDiff _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gda.diff.Diff");

    _cInstance = *cast(GdaDiff*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /** */
  @property gda.types.DiffType type()
  {
    return cast(gda.types.DiffType)(cast(GdaDiff*)this._cPtr).type;
  }

  /** */
  @property void type(gda.types.DiffType propval)
  {
    (cast(GdaDiff*)this._cPtr).type = cast(GdaDiffType)propval;
  }

  /** */
  @property int oldRow()
  {
    return (cast(GdaDiff*)this._cPtr).oldRow;
  }

  /** */
  @property void oldRow(int propval)
  {
    (cast(GdaDiff*)this._cPtr).oldRow = propval;
  }

  /** */
  @property int newRow()
  {
    return (cast(GdaDiff*)this._cPtr).newRow;
  }

  /** */
  @property void newRow(int propval)
  {
    (cast(GdaDiff*)this._cPtr).newRow = propval;
  }
}
