/// Module for [GIOOutputStream] class
module arrow.giooutput_stream;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.file;
import arrow.file_mixin;
import arrow.output_stream;
import arrow.types;
import arrow.writable;
import arrow.writable_mixin;
import gid.gid;
import gio.output_stream;
import gobject.gid_builder;
import gobject.object;

/** */
class GIOOutputStream : arrow.output_stream.OutputStream
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_gio_output_stream_get_type != &gidSymbolNotFound ? garrow_gio_output_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GIOOutputStream self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.giooutput_stream.GIOOutputStream]
      Returns: New builder object
  */
  static GIOOutputStreamGidBuilder builder() nothrow
  {
    return new GIOOutputStreamGidBuilder;
  }

  /** */
  @property gio.output_stream.OutputStream raw() nothrow
  {
    return getRaw();
  }

  /** */
  this(gio.output_stream.OutputStream gioOutputStream) nothrow
  {
    GArrowGIOOutputStream* _cretval;
    _cretval = garrow_gio_output_stream_new(gioOutputStream ? cast(GOutputStream*)gioOutputStream._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /** */
  gio.output_stream.OutputStream getRaw() nothrow
  {
    GOutputStream* _cretval;
    _cretval = garrow_gio_output_stream_get_raw(cast(GArrowGIOOutputStream*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.output_stream.OutputStream)(cast(GOutputStream*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.giooutput_stream.GIOOutputStream]
class GIOOutputStreamGidBuilderImpl(T) : arrow.output_stream.OutputStreamGidBuilderImpl!T
{


  /** */
  T raw(gio.output_stream.OutputStream propval) nothrow
  {
    return setProperty("raw", propval);
  }
}

/// Fluent builder for [arrow.giooutput_stream.GIOOutputStream]
final class GIOOutputStreamGidBuilder : GIOOutputStreamGidBuilderImpl!GIOOutputStreamGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GIOOutputStream build() nothrow
  {
    return new GIOOutputStream(cast(void*)createGObject(GIOOutputStream._getGType), Yes.Take);
  }
}
