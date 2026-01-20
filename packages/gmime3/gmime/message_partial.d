/// Module for [MessagePartial] class
module gmime.message_partial;

import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.message;
import gmime.part;
import gmime.types;
import gobject.object;

/**
    A message/partial MIME part.
*/
class MessagePartial : gmime.part.Part
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
    return cast(void function())g_mime_message_partial_get_type != &gidSymbolNotFound ? g_mime_message_partial_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MessagePartial self()
  {
    return this;
  }

  /**
      Creates a new MIME message/partial object.
  
      Params:
        id = message/partial part id
        number = message/partial part number
        total = total number of message/partial parts
      Returns: an empty MIME message/partial object.
  */
  this(string id, int number, int total)
  {
    GMimeMessagePartial* _cretval;
    const(char)* _id = id.toCString(No.Alloc);
    _cretval = g_mime_message_partial_new(_id, number, total);
    this(_cretval, Yes.Take);
  }

  /**
      Reconstructs the GMimeMessage from the given message/partial parts
      in partials.
  
      Params:
        partials = an array of message/partial mime parts
      Returns: a GMimeMessage object on success or null
        on fail.
  */
  static gmime.message.Message reconstructMessage(gmime.message_partial.MessagePartial[] partials)
  {
    GMimeMessage* _cretval;
    size_t _num;
    if (partials)
      _num = cast(size_t)partials.length;

    GMimeMessagePartial*[] _tmppartials;
    foreach (obj; partials)
      _tmppartials ~= obj ? cast(GMimeMessagePartial*)obj._cPtr : null;
    GMimeMessagePartial** _partials = cast(GMimeMessagePartial**)_tmppartials.ptr;

    _cretval = g_mime_message_partial_reconstruct_message(_partials, _num);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.message.Message)(cast(GMimeMessage*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the message/partial id parameter value.
      Returns: the message/partial id or null on fail.
  */
  string getId()
  {
    const(char)* _cretval;
    _cretval = g_mime_message_partial_get_id(cast(GMimeMessagePartial*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the message/partial part number.
      Returns: the message/partial part number or %-1 on fail.
  */
  int getNumber()
  {
    int _retval;
    _retval = g_mime_message_partial_get_number(cast(GMimeMessagePartial*)this._cPtr);
    return _retval;
  }

  /**
      Gets the total number of message/partial parts needed to
      reconstruct the original message.
      Returns: the total number of message/partial parts needed to
        reconstruct the original message or -1 on fail.
  */
  int getTotal()
  {
    int _retval;
    _retval = g_mime_message_partial_get_total(cast(GMimeMessagePartial*)this._cPtr);
    return _retval;
  }
}
