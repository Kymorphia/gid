/// Module for [FilterOutputStream] class
module gio.filter_output_stream;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.output_stream;
import gio.types;
import gobject.object;

/**
    Base class for output stream implementations that perform some
    kind of filtering operation on a base stream. Typical examples
    of filtering operations are character set conversion, compression
    and byte order flipping.
*/
class FilterOutputStream : gio.output_stream.OutputStream
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
    return cast(void function())g_filter_output_stream_get_type != &gidSymbolNotFound ? g_filter_output_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FilterOutputStream self()
  {
    return this;
  }

  /**
      Gets the base stream for the filter stream.
      Returns: a #GOutputStream.
  */
  gio.output_stream.OutputStream getBaseStream()
  {
    GOutputStream* _cretval;
    _cretval = g_filter_output_stream_get_base_stream(cast(GFilterOutputStream*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.output_stream.OutputStream)(cast(GOutputStream*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the base stream will be closed when stream is
      closed.
      Returns: true if the base stream will be closed.
  */
  bool getCloseBaseStream()
  {
    bool _retval;
    _retval = cast(bool)g_filter_output_stream_get_close_base_stream(cast(GFilterOutputStream*)this._cPtr);
    return _retval;
  }

  /**
      Sets whether the base stream will be closed when stream is closed.
  
      Params:
        closeBase = true to close the base stream.
  */
  void setCloseBaseStream(bool closeBase)
  {
    g_filter_output_stream_set_close_base_stream(cast(GFilterOutputStream*)this._cPtr, closeBase);
  }
}
