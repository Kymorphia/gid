/// Module for [MetadataReader] class
module arrowflight.metadata_reader;

import arrow.buffer;
import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.types;
import gid.gid;
import glib.error;
import gobject.gid_builder;
import gobject.object;

/** */
class MetadataReader : gobject.object.ObjectWrap
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
    return cast(void function())gaflight_metadata_reader_get_type != &gidSymbolNotFound ? gaflight_metadata_reader_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MetadataReader self()
  {
    return this;
  }

  /**
  Get builder for [arrowflight.metadata_reader.MetadataReader]
  Returns: New builder object
  */
  static MetadataReaderGidBuilder builder()
  {
    return new MetadataReaderGidBuilder;
  }

  /** */
  arrow.buffer.Buffer read()
  {
    GArrowBuffer* _cretval;
    GError *_err;
    _cretval = gaflight_metadata_reader_read(cast(GAFlightMetadataReader*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.buffer.Buffer)(cast(GArrowBuffer*)_cretval, Yes.Take);
    return _retval;
  }
}

class MetadataReaderGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T reader(void* propval)
  {
    return setProperty("reader", propval);
  }
}

/// Fluent builder for [arrowflight.metadata_reader.MetadataReader]
final class MetadataReaderGidBuilder : MetadataReaderGidBuilderImpl!MetadataReaderGidBuilder
{
  MetadataReader build()
  {
    return new MetadataReader(cast(void*)createGObject(MetadataReader._getGType), No.Take);
  }
}
