/// Module for [MessageReader] class
module arrowflight.message_reader;

public import gid.basictypes;
import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.descriptor;
import arrowflight.record_batch_reader;
import arrowflight.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class MessageReader : arrowflight.record_batch_reader.RecordBatchReader
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
    return cast(void function())gaflight_message_reader_get_type != &gidSymbolNotFound ? gaflight_message_reader_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MessageReader self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrowflight.message_reader.MessageReader]
      Returns: New builder object
  */
  static MessageReaderGidBuilder builder() nothrow
  {
    return new MessageReaderGidBuilder;
  }

  /** */
  arrowflight.descriptor.Descriptor getDescriptor() nothrow
  {
    GAFlightDescriptor* _cretval;
    _cretval = gaflight_message_reader_get_descriptor(cast(GAFlightMessageReader*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrowflight.descriptor.Descriptor)(cast(GAFlightDescriptor*)_cretval, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrowflight.message_reader.MessageReader]
class MessageReaderGidBuilderImpl(T) : arrowflight.record_batch_reader.RecordBatchReaderGidBuilderImpl!T
{
}

/// Fluent builder for [arrowflight.message_reader.MessageReader]
final class MessageReaderGidBuilder : MessageReaderGidBuilderImpl!MessageReaderGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MessageReader build() nothrow
  {
    return new MessageReader(cast(void*)createGObject(MessageReader._getGType), No.Take);
  }
}
