/// Module for [Message] class
module gmime.message;

import gid.gid;
import glib.date_time;
import glib.error;
import gmime.autocrypt_header;
import gmime.autocrypt_header_list;
import gmime.c.functions;
import gmime.c.types;
import gmime.internet_address_list;
import gmime.object;
import gmime.types;
import gobject.object;

/**
    A MIME Message object.
*/
class Message : gmime.object.ObjectWrap
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
    return cast(void function())g_mime_message_get_type != &gidSymbolNotFound ? g_mime_message_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Message self()
  {
    return this;
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
  this(bool prettyHeaders)
  {
    GMimeMessage* _cretval;
    _cretval = g_mime_message_new(prettyHeaders);
    this(_cretval, Yes.Take);
  }

  /**
      Add a mailbox of a chosen type to the MIME message.
      
      Note: The name (and addr) strings should be in UTF-8.
  
      Params:
        type = A #GMimeAddressType
        name = The name of the mailbox (or null)
        addr = The address of the mailbox
  */
  void addMailbox(gmime.types.AddressType type, string name, string addr)
  {
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _addr = addr.toCString(No.Alloc);
    g_mime_message_add_mailbox(cast(GMimeMessage*)this._cPtr, type, _name, _addr);
  }

  /**
      Recursively calls callback on each of the mime parts in the mime message.
  
      Params:
        callback = function to call on each of the mime parts
            contained by the mime message
  */
  void foreach_(gmime.types.ObjectForeachFunc callback)
  {
    extern(C) void _callbackCallback(GMimeObject* parent, GMimeObject* part, void* userData)
    {
      auto _dlg = cast(gmime.types.ObjectForeachFunc*)userData;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gmime.object.ObjectWrap)(cast(void*)parent, No.Take), gobject.object.ObjectWrap._getDObject!(gmime.object.ObjectWrap)(cast(void*)part, No.Take));
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
  gmime.internet_address_list.InternetAddressList getAddresses(gmime.types.AddressType type)
  {
    GMimeInternetAddressList* _cretval;
    _cretval = g_mime_message_get_addresses(cast(GMimeMessage*)this._cPtr, type);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.internet_address_list.InternetAddressList)(cast(GMimeInternetAddressList*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the complete list of recipients for message.
      Returns: a newly allocated #InternetAddressList
        containing all recipients of the message or null if no recipients
        are set.
  */
  gmime.internet_address_list.InternetAddressList getAllRecipients()
  {
    GMimeInternetAddressList* _cretval;
    _cretval = g_mime_message_get_all_recipients(cast(GMimeMessage*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.internet_address_list.InternetAddressList)(cast(GMimeInternetAddressList*)_cretval, Yes.Take);
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
  gmime.autocrypt_header_list.AutocryptHeaderList getAutocryptGossipHeaders(glib.date_time.DateTime now, gmime.types.DecryptFlags flags, string sessionKey = null)
  {
    GMimeAutocryptHeaderList* _cretval;
    const(char)* _sessionKey = sessionKey.toCString(No.Alloc);
    GError *_err;
    _cretval = g_mime_message_get_autocrypt_gossip_headers(cast(GMimeMessage*)this._cPtr, now ? cast(GDateTime*)now._cPtr(No.Dup) : null, flags, _sessionKey, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.autocrypt_header_list.AutocryptHeaderList)(cast(GMimeAutocryptHeaderList*)_cretval, Yes.Take);
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
      
       $(LIST
          * have a valid address
          * be of the type requested
          * be complete
       )
         
      If no Autocrypt header is found for a recipient, no
      #GMimeAutocryptHeader will be in the list associated with that e-mail address.
      
      Note that the following types of Autocrypt headers will not be
      returned by this function:
      
       $(LIST
          * headers of an unrequested type
          * headers that do not match an address in "From:"
          * unparseable headers
          * headers with unknown critical attributes
          * duplicate valid headers for a given address
       )
         
      On error (e.g. if this version of GMime cannot handle the requested
      Autocrypt type, or if a parameter is missing or malformed), returns
      null
      
      The returned Autocrypt headers will have their effective_date set
      to the earliest of either:
      
      $(LIST
        * the Date: header of the message or
        * now (or the current time, if now is null)
      )
  
      Params:
        now = a #GDateTime object, or null
        innerPart = a #GMimeObject which is the cleartext part of the inner message
      Returns: a new #GMimeAutocryptHeaderList object,
        or null on error.
  */
  gmime.autocrypt_header_list.AutocryptHeaderList getAutocryptGossipHeadersFromInnerPart(glib.date_time.DateTime now, gmime.object.ObjectWrap innerPart)
  {
    GMimeAutocryptHeaderList* _cretval;
    _cretval = g_mime_message_get_autocrypt_gossip_headers_from_inner_part(cast(GMimeMessage*)this._cPtr, now ? cast(GDateTime*)now._cPtr(No.Dup) : null, innerPart ? cast(GMimeObject*)innerPart._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.autocrypt_header_list.AutocryptHeaderList)(cast(GMimeAutocryptHeaderList*)_cretval, Yes.Take);
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
      
       $(LIST
          * headers that do not match an address in "From:"
          * unparseable headers
          * headers with unknown critical attributes
          * duplicate valid headers for the sender's address
       )
         
      The returned Autocrypt header will have its effective_date set to
      the earliest of either:
      
      $(LIST
        * the Date: header of the message or
        * now (or the current time, if now is null)
      )
  
      Params:
        now = a #GDateTime object, or null
      Returns: a new #GMimeAutocryptHeader object,
        or null if the message should be ignored for purposes of
        Autocrypt.
  */
  gmime.autocrypt_header.AutocryptHeader getAutocryptHeader(glib.date_time.DateTime now = null)
  {
    GMimeAutocryptHeader* _cretval;
    _cretval = g_mime_message_get_autocrypt_header(cast(GMimeMessage*)this._cPtr, now ? cast(GDateTime*)now._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.autocrypt_header.AutocryptHeader)(cast(GMimeAutocryptHeader*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets combined list of parsed addresses in the Bcc header(s).
      Returns: the parsed list of addresses in the Bcc header(s).
  */
  gmime.internet_address_list.InternetAddressList getBcc()
  {
    GMimeInternetAddressList* _cretval;
    _cretval = g_mime_message_get_bcc(cast(GMimeMessage*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.internet_address_list.InternetAddressList)(cast(GMimeInternetAddressList*)_cretval, No.Take);
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
  gmime.object.ObjectWrap getBody()
  {
    GMimeObject* _cretval;
    _cretval = g_mime_message_get_body(cast(GMimeMessage*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.object.ObjectWrap)(cast(GMimeObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets combined list of parsed addresses in the Cc header(s).
      Returns: the parsed list of addresses in the Cc header(s).
  */
  gmime.internet_address_list.InternetAddressList getCc()
  {
    GMimeInternetAddressList* _cretval;
    _cretval = g_mime_message_get_cc(cast(GMimeMessage*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.internet_address_list.InternetAddressList)(cast(GMimeInternetAddressList*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the parsed date and time value from the Date header.
      Returns: a #GDateTime on success or null if
        the date could not be parsed.
  */
  glib.date_time.DateTime getDate()
  {
    GDateTime* _cretval;
    _cretval = g_mime_message_get_date(cast(GMimeMessage*)this._cPtr);
    auto _retval = _cretval ? new glib.date_time.DateTime(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the parsed list of addresses in the From header.
      Returns: the parsed list of addresses in the From header.
  */
  gmime.internet_address_list.InternetAddressList getFrom()
  {
    GMimeInternetAddressList* _cretval;
    _cretval = g_mime_message_get_from(cast(GMimeMessage*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.internet_address_list.InternetAddressList)(cast(GMimeInternetAddressList*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the Message-Id header of message.
      Returns: the Message-Id of a message, or null if not specified.
  */
  string getMessageId()
  {
    const(char)* _cretval;
    _cretval = g_mime_message_get_message_id(cast(GMimeMessage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the toplevel MIME part contained within message.
      Returns: the toplevel MIME part of message, or
        null if none is present.
  */
  gmime.object.ObjectWrap getMimePart()
  {
    GMimeObject* _cretval;
    _cretval = g_mime_message_get_mime_part(cast(GMimeMessage*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.object.ObjectWrap)(cast(GMimeObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the parsed list of addresses in the Reply-To header.
      Returns: the parsed list of addresses in the Reply-To header.
  */
  gmime.internet_address_list.InternetAddressList getReplyTo()
  {
    GMimeInternetAddressList* _cretval;
    _cretval = g_mime_message_get_reply_to(cast(GMimeMessage*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.internet_address_list.InternetAddressList)(cast(GMimeInternetAddressList*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the parsed list of addresses in the Sender header.
      Returns: the parsed list of addresses in the Sender header.
  */
  gmime.internet_address_list.InternetAddressList getSender()
  {
    GMimeInternetAddressList* _cretval;
    _cretval = g_mime_message_get_sender(cast(GMimeMessage*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.internet_address_list.InternetAddressList)(cast(GMimeInternetAddressList*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the subject of the message.
      Returns: the subject of the message in a form suitable for
        display or null if no subject is set. If not null, the returned string
        will be in UTF-8.
  */
  string getSubject()
  {
    const(char)* _cretval;
    _cretval = g_mime_message_get_subject(cast(GMimeMessage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets combined list of parsed addresses in the To header(s).
      Returns: the parsed list of addresses in the To header(s).
  */
  gmime.internet_address_list.InternetAddressList getTo()
  {
    GMimeInternetAddressList* _cretval;
    _cretval = g_mime_message_get_to(cast(GMimeMessage*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.internet_address_list.InternetAddressList)(cast(GMimeInternetAddressList*)_cretval, No.Take);
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
  gmime.message.Message[] partialSplitMessage(size_t maxSize)
  {
    GMimeMessage** _cretval;
    size_t _cretlength;
    _cretval = g_mime_message_partial_split_message(cast(GMimeMessage*)this._cPtr, maxSize, &_cretlength);
    gmime.message.Message[] _retval;

    if (_cretval)
    {
      _retval = new gmime.message.Message[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = gobject.object.ObjectWrap._getDObject!(gmime.message.Message)(_cretval[i], Yes.Take);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Sets the Date header on a MIME Message.
  
      Params:
        date = a date to be used in the Date header
  */
  void setDate(glib.date_time.DateTime date)
  {
    g_mime_message_set_date(cast(GMimeMessage*)this._cPtr, date ? cast(GDateTime*)date._cPtr(No.Dup) : null);
  }

  /**
      Set the Message-Id on a message.
  
      Params:
        messageId = message-id (addr-spec portion)
  */
  void setMessageId(string messageId)
  {
    const(char)* _messageId = messageId.toCString(No.Alloc);
    g_mime_message_set_message_id(cast(GMimeMessage*)this._cPtr, _messageId);
  }

  /**
      Set the root-level MIME part of the message.
  
      Params:
        mimePart = The root-level MIME Part
  */
  void setMimePart(gmime.object.ObjectWrap mimePart)
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
  void setSubject(string subject, string charset = null)
  {
    const(char)* _subject = subject.toCString(No.Alloc);
    const(char)* _charset = charset.toCString(No.Alloc);
    g_mime_message_set_subject(cast(GMimeMessage*)this._cPtr, _subject, _charset);
  }
}
