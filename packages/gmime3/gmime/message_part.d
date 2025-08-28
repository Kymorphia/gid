/// Module for [MessagePart] class
module gmime.message_part;

import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.message;
import gmime.object;
import gmime.types;
import gobject.object;

/**
    A message/rfc822 or message/news MIME part.
*/
class MessagePart : gmime.object.ObjectWrap
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
    return cast(void function())g_mime_message_part_get_type != &gidSymbolNotFound ? g_mime_message_part_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MessagePart self()
  {
    return this;
  }

  /**
      Creates a new MIME message part object with a default content-type
      of message/subtype.
  
      Params:
        subtype = message subtype or null for "rfc822"
      Returns: an empty MIME message part object with a default
        content-type of message/subtype.
  */
  this(string subtype)
  {
    GMimeMessagePart* _cretval;
    const(char)* _subtype = subtype.toCString(No.Alloc);
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
  static gmime.message_part.MessagePart newWithMessage(string subtype, gmime.message.Message message)
  {
    GMimeMessagePart* _cretval;
    const(char)* _subtype = subtype.toCString(No.Alloc);
    _cretval = g_mime_message_part_new_with_message(_subtype, message ? cast(GMimeMessage*)message._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.message_part.MessagePart)(cast(GMimeMessagePart*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the message object on the message part object part.
      Returns: the message part contained within part.
  */
  gmime.message.Message getMessage()
  {
    GMimeMessage* _cretval;
    _cretval = g_mime_message_part_get_message(cast(GMimeMessagePart*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.message.Message)(cast(GMimeMessage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the message object on the message part object part.
  
      Params:
        message = message
  */
  void setMessage(gmime.message.Message message)
  {
    g_mime_message_part_set_message(cast(GMimeMessagePart*)this._cPtr, message ? cast(GMimeMessage*)message._cPtr(No.Dup) : null);
  }
}
