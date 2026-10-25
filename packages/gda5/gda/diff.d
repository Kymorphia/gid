/// Module for [Diff] class
module gda.diff;

public import gid.basictypes;
import gda.c.functions;
import gda.c.types;
import gda.types;
import gid.gid;

/** */
class Diff
{
  GdaDiff _cInstance;

  /**
      Create a `diff.Diff` wrap type.
      Params:
        type = 
        oldRow = 
        newRow = 
  */
  this(gda.types.DiffType type = gda.types.DiffType.init, int oldRow = int.init, int newRow = int.init) nothrow
  {
    this.type = type;
    this.oldRow = oldRow;
    this.newRow = newRow;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GdaDiff*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
  }

  /** */
  @property gda.types.DiffType type() nothrow
  {
    return cast(gda.types.DiffType)(cast(GdaDiff*)this._cPtr).type;
  }

  /** */
  @property void type(gda.types.DiffType propval) nothrow
  {
    (cast(GdaDiff*)this._cPtr).type = cast(GdaDiffType)propval;
  }

  /** */
  @property int oldRow() nothrow
  {
    return (cast(GdaDiff*)this._cPtr).oldRow;
  }

  /** */
  @property void oldRow(int propval) nothrow
  {
    (cast(GdaDiff*)this._cPtr).oldRow = propval;
  }

  /** */
  @property int newRow() nothrow
  {
    return (cast(GdaDiff*)this._cPtr).newRow;
  }

  /** */
  @property void newRow(int propval) nothrow
  {
    (cast(GdaDiff*)this._cPtr).newRow = propval;
  }
}
