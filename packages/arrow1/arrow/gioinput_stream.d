/// Module for [GIOInputStream] class
module arrow.gioinput_stream;

import arrow.c.functions;
import arrow.c.types;
import arrow.file;
import arrow.file_mixin;
import arrow.readable;
import arrow.readable_mixin;
import arrow.seekable_input_stream;
import arrow.types;
import gid.gid;
import gio.input_stream;
import gobject.gid_builder;
import gobject.object;

/** */
class GIOInputStream : arrow.seekable_input_stream.SeekableInputStream
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
    return cast(void function())garrow_gio_input_stream_get_type != &gidSymbolNotFound ? garrow_gio_input_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GIOInputStream self()
  {
    return this;
  }

  /**
      Get builder for [arrow.gioinput_stream.GIOInputStream]
      Returns: New builder object
  */
  static GIOInputStreamGidBuilder builder()
  {
    return new GIOInputStreamGidBuilder;
  }

  /** */
  @property gio.input_stream.InputStream raw()
  {
    return getRaw();
  }

  /** */
  this(gio.input_stream.InputStream gioInputStream)
  {
    GArrowGIOInputStream* _cretval;
    _cretval = garrow_gio_input_stream_new(gioInputStream ? cast(GInputStream*)gioInputStream._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /** */
  gio.input_stream.InputStream getRaw()
  {
    GInputStream* _cretval;
    _cretval = garrow_gio_input_stream_get_raw(cast(GArrowGIOInputStream*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.input_stream.InputStream)(cast(GInputStream*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.gioinput_stream.GIOInputStream]
class GIOInputStreamGidBuilderImpl(T) : arrow.seekable_input_stream.SeekableInputStreamGidBuilderImpl!T
{


  /** */
  T raw(gio.input_stream.InputStream propval)
  {
    return setProperty("raw", propval);
  }
}

/// Fluent builder for [arrow.gioinput_stream.GIOInputStream]
final class GIOInputStreamGidBuilder : GIOInputStreamGidBuilderImpl!GIOInputStreamGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GIOInputStream build()
  {
    return new GIOInputStream(cast(void*)createGObject(GIOInputStream._getGType), Yes.Take);
  }
}
