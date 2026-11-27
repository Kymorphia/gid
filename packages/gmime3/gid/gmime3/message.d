/// Module for [Message] class
module gid.gmime3.message;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.date_time;
import gid.glib2.error;
import gid.gmime3.autocrypt_header;
import gid.gmime3.autocrypt_header_list;
import gid.gmime3.c.functions;
import gid.gmime3.c.types;
import gid.gmime3.internet_address_list;
import gid.gmime3.object;
import gid.gmime3.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    A MIME Message object.
*/
@gidGir("Message", "MessageClass")
class Message : gid.gmime3.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_mime_message_get_type != &gidSymbolNotFound ? g_mime_message_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GMimeMessage";
  }

  /** Returns `this`, for use in `with` statements. */
  override Message self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gmime3.message.Message]
      Returns: New builder object
  */
  static MessageGidBuilder builder() nothrow
  {
    return new MessageGidBuilder;
  }

  /**
      If pretty_headers is true, then the standard rfc822 headers are
      initialized so as to put headers in a nice friendly order. This is
      strictly a cosmetic thing, so if you are unsure, it is safe to say
      no (false).
  
      Params:
        prettyHeaders = make pretty headers
      Returns: an empty #GMimeMessage object.
  */
  this(bool prettyHeaders) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GMimeMessage* _cretval;
      _cretval = g_mime_message_new(prettyHeaders);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Add a mailbox of a chosen type to the MIME message.
      
      Note: The name (and addr) strings should be in UTF-8.
  
      Params:
        type = A #GMimeAddressType
        name = The name of the mailbox (or null)
        addr = The address of the mailbox
  */
  void addMailbox(gid.gmime3.types.AddressType type, string name, string addr) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, Yes.Nullable);
    const(char)* _addr = addr.toCString!(No.Malloc, No.Nullable);
    g_mime_message_add_mailbox(cast(GMimeMessage*)this._cPtr, type, _name, _addr);
  }

  /**
      Recursively calls callback on each of the mime parts in the mime message.
  
      Params:
        callback = function to call on each of the mime parts
            contained by the mime message
  */
  void foreach_(gid.gmime3.types.ObjectForeachFunc callback) nothrow
  {
    extern(C) void _callbackCallback(GMimeObject* parent, GMimeObject* part, void* userData) nothrow
    {
      gidAttachThread();
      auto _dlg = cast(gid.gmime3.types.ObjectForeachFunc*)userData;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.object.ObjectWrap)(cast(void*)parent, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.object.ObjectWrap)(cast(void*)part, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gmime3.types.ObjectForeachFunc");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? cast(void*)&(callback) : null;
    g_mime_message_foreach(cast(GMimeMessage*)this._cPtr, _callbackCB, _callback);
  }

  /**
      Gets a list of addresses of the specified type from the message.
  
      Params:
        type = A #GMimeAddressType
      Returns: a list of addresses of the specified
        type from the message.
  */
  gid.gmime3.internet_address_list.InternetAddressList getAddresses(gid.gmime3.types.AddressType type) nothrow
  {
    GMimeInternetAddressList* _cretval;
    _cretval = g_mime_message_get_addresses(cast(GMimeMessage*)this._cPtr, type);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.internet_address_list.InternetAddressList)(cast(GMimeInternetAddressList*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the complete list of recipients for message.
      Returns: a newly allocated #InternetAddressList
        containing all recipients of the message or null if no recipients
        are set.
  */
  gid.gmime3.internet_address_list.InternetAddressList getAllRecipients() nothrow
  {
    GMimeInternetAddressList* _cretval;
    _cretval = g_mime_message_get_all_recipients(cast(GMimeMessage*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.internet_address_list.InternetAddressList)(cast(GMimeInternetAddressList*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new #GMimeAutocryptHeaderList of relevant headers of the
      given type based on the recipient(s) of an e-mail message.
      
      Returns the same object as
      #g_mime_message_get_autocrypt_gossip_headers_with_inner_part , but
      handles decryption and cleanup automatically.
      
      flags and session_key are passed through to
      #g_mime_multipart_encrypted_decrypt, as needed.
      
      If the message is not actually an encrypted message, returns null:
      it should be ignored for purposes of evaluating gossip.
      
      If decryption fails, returns null.  In this case, an exception
      will be set on err to provide information about the decryption
      failure.
  
      Params:
        now = a #GDateTime object, or null
        flags = a #GMimeDecryptFlags, to be used during decryption
        sessionKey = session key to use or null
      Returns: a new #GMimeAutocryptHeaderList object,
        or null on error.
      Throws: [ErrorWrap]
  */
  gid.gmime3.autocrypt_header_list.AutocryptHeaderList getAutocryptGossipHeaders(gid.glib2.date_time.DateTime now, gid.gmime3.types.DecryptFlags flags, string sessionKey = null)
  {
    GMimeAutocryptHeaderList* _cretval;
    const(char)* _sessionKey = sessionKey.toCString!(No.Malloc, Yes.Nullable);
    GError *_err;
    _cretval = g_mime_message_get_autocrypt_gossip_headers(cast(GMimeMessage*)this._cPtr, now ? cast(GDateTime*)now._cPtr(No.Dup) : null, flags, _sessionKey, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.autocrypt_header_list.AutocryptHeaderList)(cast(GMimeAutocryptHeaderList*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new #GMimeAutocryptHeaderList of relevant headers of the
      given type based on the recipient(s) of an e-mail message.
      
      You must pass the decrypted inner part of the message to this
      function, since Autocrypt-Gossip headers are only stored within the
      encrypted layer.
      
      If you don't already have the decrypted inner part available to
      you, you probably want to use
      #g_mime_message_get_autocrypt_gossip_headers instead.
      
      Each header in the returned list will:
      
       - have a valid address
       - be of the type requested
       - be complete
      
      If no Autocrypt header is found for a recipient, no
      #GMimeAutocryptHeader will be in the list associated with that e-mail address.
      
      Note that the following types of Autocrypt headers will not be
      returned by this function:
      
       - headers of an unrequested type
       - headers that do not match an address in "From:"
       - unparseable headers
       - headers with unknown critical attributes
       - duplicate valid headers for a given address
      
      On error (e.g. if this version of GMime cannot handle the requested
      Autocrypt type, or if a parameter is missing or malformed), returns
      null
      
      The returned Autocrypt headers will have their effective_date set
      to the earliest of either:
      
      - the Date: header of the message or
      - now (or the current time, if now is null)
  
      Params:
        now = a #GDateTime object, or null
        innerPart = a #GMimeObject which is the cleartext part of the inner message
      Returns: a new #GMimeAutocryptHeaderList object,
        or null on error.
  */
  gid.gmime3.autocrypt_header_list.AutocryptHeaderList getAutocryptGossipHeadersFromInnerPart(gid.glib2.date_time.DateTime now, gid.gmime3.object.ObjectWrap innerPart) nothrow
  {
    GMimeAutocryptHeaderList* _cretval;
    _cretval = g_mime_message_get_autocrypt_gossip_headers_from_inner_part(cast(GMimeMessage*)this._cPtr, now ? cast(GDateTime*)now._cPtr(No.Dup) : null, innerPart ? cast(GMimeObject*)innerPart._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.autocrypt_header_list.AutocryptHeaderList)(cast(GMimeAutocryptHeaderList*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new #GMimeAutocryptHeader based on the relevant Autocrypt
      header associated with the sender of an e-mail message.
      
      If the message has no sender in the From: field, or has more than
      one sender, then this function will return null.  Autocrypt should
      ignore the message entirely.
      
      If there is one sender, but no single Autocrypt header is found
      that matches that e-mail address, a #GMimeAutocryptHeader will be
      returned for the sender, but it will be incomplete (see
      #g_mime_autocrypt_header_is_complete).
      
      Note that the following types of Autocrypt headers will not be
      returned by this function:
      
       - headers that do not match an address in "From:"
       - unparseable headers
       - headers with unknown critical attributes
       - duplicate valid headers for the sender's address
      
      The returned Autocrypt header will have its effective_date set to
      the earliest of either:
      
      - the Date: header of the message or
      - now (or the current time, if now is null)
  
      Params:
        now = a #GDateTime object, or null
      Returns: a new #GMimeAutocryptHeader object,
        or null if the message should be ignored for purposes of
        Autocrypt.
  */
  gid.gmime3.autocrypt_header.AutocryptHeader getAutocryptHeader(gid.glib2.date_time.DateTime now = null) nothrow
  {
    GMimeAutocryptHeader* _cretval;
    _cretval = g_mime_message_get_autocrypt_header(cast(GMimeMessage*)this._cPtr, now ? cast(GDateTime*)now._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.autocrypt_header.AutocryptHeader)(cast(GMimeAutocryptHeader*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets combined list of parsed addresses in the Bcc header(s).
      Returns: the parsed list of addresses in the Bcc header(s).
  */
  gid.gmime3.internet_address_list.InternetAddressList getBcc() nothrow
  {
    GMimeInternetAddressList* _cretval;
    _cretval = g_mime_message_get_bcc(cast(GMimeMessage*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.internet_address_list.InternetAddressList)(cast(GMimeInternetAddressList*)_cretval, No.Take);
    return _retval;
  }

  /**
      Attempts to identify the MIME part containing the body of the
      message.
      Returns: a #GMimeObject containing the textual
        content that appears to be the main body of the message, or null if no
        body part has been set.
        
        Note: This function is NOT guaranteed to always work as it
        makes some assumptions that are not necessarily true. It is
        recommended that you traverse the MIME structure yourself.
  */
  gid.gmime3.object.ObjectWrap getBody() nothrow
  {
    GMimeObject* _cretval;
    _cretval = g_mime_message_get_body(cast(GMimeMessage*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.object.ObjectWrap)(cast(GMimeObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets combined list of parsed addresses in the Cc header(s).
      Returns: the parsed list of addresses in the Cc header(s).
  */
  gid.gmime3.internet_address_list.InternetAddressList getCc() nothrow
  {
    GMimeInternetAddressList* _cretval;
    _cretval = g_mime_message_get_cc(cast(GMimeMessage*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.internet_address_list.InternetAddressList)(cast(GMimeInternetAddressList*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the parsed date and time value from the Date header.
      Returns: a #GDateTime on success or null if
        the date could not be parsed.
  */
  gid.glib2.date_time.DateTime getDate() nothrow
  {
    GDateTime* _cretval;
    _cretval = g_mime_message_get_date(cast(GMimeMessage*)this._cPtr);
    auto _retval = _cretval ? new gid.glib2.date_time.DateTime(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the parsed list of addresses in the From header.
      Returns: the parsed list of addresses in the From header.
  */
  gid.gmime3.internet_address_list.InternetAddressList getFrom() nothrow
  {
    GMimeInternetAddressList* _cretval;
    _cretval = g_mime_message_get_from(cast(GMimeMessage*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.internet_address_list.InternetAddressList)(cast(GMimeInternetAddressList*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the Message-Id header of message.
      Returns: the Message-Id of a message, or null if not specified.
  */
  string getMessageId() nothrow
  {
    const(char)* _cretval;
    _cretval = g_mime_message_get_message_id(cast(GMimeMessage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the toplevel MIME part contained within message.
      Returns: the toplevel MIME part of message, or
        null if none is present.
  */
  gid.gmime3.object.ObjectWrap getMimePart() nothrow
  {
    GMimeObject* _cretval;
    _cretval = g_mime_message_get_mime_part(cast(GMimeMessage*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.object.ObjectWrap)(cast(GMimeObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the parsed list of addresses in the Reply-To header.
      Returns: the parsed list of addresses in the Reply-To header.
  */
  gid.gmime3.internet_address_list.InternetAddressList getReplyTo() nothrow
  {
    GMimeInternetAddressList* _cretval;
    _cretval = g_mime_message_get_reply_to(cast(GMimeMessage*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.internet_address_list.InternetAddressList)(cast(GMimeInternetAddressList*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the parsed list of addresses in the Sender header.
      Returns: the parsed list of addresses in the Sender header.
  */
  gid.gmime3.internet_address_list.InternetAddressList getSender() nothrow
  {
    GMimeInternetAddressList* _cretval;
    _cretval = g_mime_message_get_sender(cast(GMimeMessage*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.internet_address_list.InternetAddressList)(cast(GMimeInternetAddressList*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the subject of the message.
      Returns: the subject of the message in a form suitable for
        display or null if no subject is set. If not null, the returned string
        will be in UTF-8.
  */
  string getSubject() nothrow
  {
    const(char)* _cretval;
    _cretval = g_mime_message_get_subject(cast(GMimeMessage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets combined list of parsed addresses in the To header(s).
      Returns: the parsed list of addresses in the To header(s).
  */
  gid.gmime3.internet_address_list.InternetAddressList getTo() nothrow
  {
    GMimeInternetAddressList* _cretval;
    _cretval = g_mime_message_get_to(cast(GMimeMessage*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.internet_address_list.InternetAddressList)(cast(GMimeInternetAddressList*)_cretval, No.Take);
    return _retval;
  }

  /**
      Splits message into an array of #GMimeMessage objects each
      containing a single #GMimeMessagePartial object containing
      max_size bytes or fewer. nparts is set to the number of
      #GMimeMessagePartial objects created.
  
      Params:
        maxSize = max size
      Returns: an array of #GMimeMessage objects and
        sets nparts to the number of messages returned or null on fail.
  */
  gid.gmime3.message.Message[] partialSplitMessage(size_t maxSize) nothrow
  {
    GMimeMessage** _cretval;
    size_t _cretlength;
    _cretval = g_mime_message_partial_split_message(cast(GMimeMessage*)this._cPtr, maxSize, &_cretlength);
    gid.gmime3.message.Message[] _retval;

    if (_cretval)
    {
      _retval = new gid.gmime3.message.Message[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.message.Message)(_cretval[i], Yes.Take);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Sets the Date header on a MIME Message.
  
      Params:
        date = a date to be used in the Date header
  */
  void setDate(gid.glib2.date_time.DateTime date) nothrow
  {
    g_mime_message_set_date(cast(GMimeMessage*)this._cPtr, date ? cast(GDateTime*)date._cPtr(No.Dup) : null);
  }

  /**
      Set the Message-Id on a message.
  
      Params:
        messageId = message-id (addr-spec portion)
  */
  void setMessageId(string messageId) nothrow
  {
    const(char)* _messageId = messageId.toCString!(No.Malloc, No.Nullable);
    g_mime_message_set_message_id(cast(GMimeMessage*)this._cPtr, _messageId);
  }

  /**
      Set the root-level MIME part of the message.
  
      Params:
        mimePart = The root-level MIME Part
  */
  void setMimePart(gid.gmime3.object.ObjectWrap mimePart) nothrow
  {
    g_mime_message_set_mime_part(cast(GMimeMessage*)this._cPtr, mimePart ? cast(GMimeObject*)mimePart._cPtr(No.Dup) : null);
  }

  /**
      Set the subject of a message.
      
      Note: The subject string should be in UTF-8.
  
      Params:
        subject = Subject string
        charset = The charset to use for encoding the subject or null to use the default
  */
  void setSubject(string subject, string charset = null) nothrow
  {
    const(char)* _subject = subject.toCString!(No.Malloc, No.Nullable);
    const(char)* _charset = charset.toCString!(No.Malloc, Yes.Nullable);
    g_mime_message_set_subject(cast(GMimeMessage*)this._cPtr, _subject, _charset);
  }
}

/// Fluent builder implementation template for [gid.gmime3.message.Message]
class MessageGidBuilderImpl(T) : gid.gmime3.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gmime3.message.Message]
final class MessageGidBuilder : MessageGidBuilderImpl!MessageGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Message build() nothrow
  {
    return new Message(cast(void*)createGObject(Message._getGType), Yes.Take);
  }
}
