/// Module for [MessagePart] class
module gid.gmime3.message_part;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gmime3.c.functions;
import gid.gmime3.c.types;
import gid.gmime3.message;
import gid.gmime3.object;
import gid.gmime3.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    A message/rfc822 or message/news MIME part.
*/
class MessagePart : gid.gmime3.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_mime_message_part_get_type != &gidSymbolNotFound ? g_mime_message_part_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GMimeMessagePart";
  }

  /** Returns `this`, for use in `with` statements. */
  override MessagePart self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gmime3.message_part.MessagePart]
      Returns: New builder object
  */
  static MessagePartGidBuilder builder() nothrow
  {
    return new MessagePartGidBuilder;
  }

  /**
      Creates a new MIME message part object with a default content-type
      of message/subtype.
  
      Params:
        subtype = message subtype or null for "rfc822"
      Returns: an empty MIME message part object with a default
        content-type of message/subtype.
  */
  this(string subtype) nothrow
  {
    GMimeMessagePart* _cretval;
    const(char)* _subtype = subtype.toCString!(No.Malloc, No.Nullable);
    _cretval = g_mime_message_part_new(_subtype);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new MIME message part object with a default content-type
      of message/subtype containing message.
  
      Params:
        subtype = message subtype or null for "rfc822"
        message = message
      Returns: a MIME message part object with a default content-type of
        message/subtype containing message.
  */
  static gid.gmime3.message_part.MessagePart newWithMessage(string subtype, gid.gmime3.message.Message message) nothrow
  {
    GMimeMessagePart* _cretval;
    const(char)* _subtype = subtype.toCString!(No.Malloc, No.Nullable);
    _cretval = g_mime_message_part_new_with_message(_subtype, message ? cast(GMimeMessage*)message._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.message_part.MessagePart)(cast(GMimeMessagePart*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the message object on the message part object part.
      Returns: the message part contained within part.
  */
  gid.gmime3.message.Message getMessage() nothrow
  {
    GMimeMessage* _cretval;
    _cretval = g_mime_message_part_get_message(cast(GMimeMessagePart*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.message.Message)(cast(GMimeMessage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the message object on the message part object part.
  
      Params:
        message = message
  */
  void setMessage(gid.gmime3.message.Message message) nothrow
  {
    g_mime_message_part_set_message(cast(GMimeMessagePart*)this._cPtr, message ? cast(GMimeMessage*)message._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gmime3.message_part.MessagePart]
class MessagePartGidBuilderImpl(T) : gid.gmime3.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gmime3.message_part.MessagePart]
final class MessagePartGidBuilder : MessagePartGidBuilderImpl!MessagePartGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MessagePart build() nothrow
  {
    return new MessagePart(cast(void*)createGObject(MessagePart._getGType), Yes.Take);
  }
}
