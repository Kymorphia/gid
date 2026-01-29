/// Module for [ParserOptions] class
module gmime.parser_options;

import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.types;
import gobject.boxed;

/**
    A set of parser options used by #GMimeParser and various other parsing functions.
*/
class ParserOptions : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_mime_parser_options_get_type != &gidSymbolNotFound ? g_mime_parser_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ParserOptions self()
  {
    return this;
  }

  /**
      Creates a new set of #GMimeParserOptions.
      Returns: a newly allocated set of #GMimeParserOptions with the default values.
  */
  this()
  {
    GMimeParserOptions* _cretval;
    _cretval = g_mime_parser_options_new();
    this(_cretval, Yes.Take);
  }

  /**
      Clones a #GMimeParserOptions.
      Returns: a newly allocated #GMimeParserOptions.
  */
  gmime.parser_options.ParserOptions clone()
  {
    GMimeParserOptions* _cretval;
    _cretval = g_mime_parser_options_clone(cast(GMimeParserOptions*)this._cPtr);
    auto _retval = _cretval ? new gmime.parser_options.ParserOptions(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the compliance mode that should be used when parsing rfc822 addresses.
      
      Note: Even in #GMIME_RFC_COMPLIANCE_STRICT mode, the address parser is fairly liberal in
      what it accepts. Setting it to #GMIME_RFC_COMPLIANCE_LOOSE just makes it try harder to
      deal with garbage input.
      Returns: the compliance mode that is currently set.
  */
  gmime.types.RfcComplianceMode getAddressComplianceMode()
  {
    GMimeRfcComplianceMode _cretval;
    _cretval = g_mime_parser_options_get_address_compliance_mode(cast(GMimeParserOptions*)this._cPtr);
    gmime.types.RfcComplianceMode _retval = cast(gmime.types.RfcComplianceMode)_cretval;
    return _retval;
  }

  /**
      Gets whether or not the rfc822 address parser should allow addresses without a domain.
      
      In general, you'll probably want this value to be false (the default) as it allows
      maximum interoperability with existing (broken) mail clients and other mail software
      such as sloppily written perl scripts (aka spambots) that do not properly quote the
      name when it contains a comma.
      
      This option exists in order to allow parsing of mailbox addresses that do not have a
      domain component. These types of addresses are rare and were typically only used when
      sending mail to other users on the same UNIX system.
      Returns: true if the address parser should allow addresses without a domain.
  */
  bool getAllowAddressesWithoutDomain()
  {
    bool _retval;
    _retval = cast(bool)g_mime_parser_options_get_allow_addresses_without_domain(cast(GMimeParserOptions*)this._cPtr);
    return _retval;
  }

  /**
      Gets the fallback charsets to try when decoding 8-bit headers.
      Returns: a null-terminated list of charsets to try when
        decoding 8-bit headers.
  */
  string[] getFallbackCharsets()
  {
    const(char*)* _cretval;
    _cretval = g_mime_parser_options_get_fallback_charsets(cast(GMimeParserOptions*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(No.Free);
    }
    return _retval;
  }

  /**
      Gets the compliance mode that should be used when parsing Content-Type and
      Content-Disposition parameters.
      
      Note: Even in #GMIME_RFC_COMPLIANCE_STRICT mode, the parameter parser is fairly liberal
      in what it accepts. Setting it to #GMIME_RFC_COMPLIANCE_LOOSE just makes it try harder
      to deal with garbage input.
      Returns: the compliance mode that is currently set.
  */
  gmime.types.RfcComplianceMode getParameterComplianceMode()
  {
    GMimeRfcComplianceMode _cretval;
    _cretval = g_mime_parser_options_get_parameter_compliance_mode(cast(GMimeParserOptions*)this._cPtr);
    gmime.types.RfcComplianceMode _retval = cast(gmime.types.RfcComplianceMode)_cretval;
    return _retval;
  }

  /**
      Gets the compliance mode that should be used when parsing rfc2047 encoded words.
      
      Note: Even in #GMIME_RFC_COMPLIANCE_STRICT mode, the rfc2047 parser is fairly liberal
      in what it accepts. Setting it to #GMIME_RFC_COMPLIANCE_LOOSE just makes it try harder
      to deal with garbage input.
      Returns: the compliance mode that is currently set.
  */
  gmime.types.RfcComplianceMode getRfc2047ComplianceMode()
  {
    GMimeRfcComplianceMode _cretval;
    _cretval = g_mime_parser_options_get_rfc2047_compliance_mode(cast(GMimeParserOptions*)this._cPtr);
    gmime.types.RfcComplianceMode _retval = cast(gmime.types.RfcComplianceMode)_cretval;
    return _retval;
  }

  /**
      Sets the compliance mode that should be used when parsing rfc822 addresses.
      
      In general, you'll probably want this value to be #GMIME_RFC_COMPLIANCE_LOOSE
      (the default) as it allows maximum interoperability with existing (broken) mail clients
      and other mail software such as sloppily written perl scripts (aka spambots).
      
      Note: Even in #GMIME_RFC_COMPLIANCE_STRICT mode, the address parser is fairly liberal in
      what it accepts. Setting it to #GMIME_RFC_COMPLIANCE_LOOSE just makes it try harder to
      deal with garbage input.
  
      Params:
        mode = a #GMimeRfcComplianceMode
  */
  void setAddressComplianceMode(gmime.types.RfcComplianceMode mode)
  {
    g_mime_parser_options_set_address_compliance_mode(cast(GMimeParserOptions*)this._cPtr, mode);
  }

  /**
      Sets whether the rfc822 address parser should allow addresses without a domain.
      
      In general, you'll probably want this value to be false (the default) as it allows
      maximum interoperability with existing (broken) mail clients and other mail software
      such as sloppily written perl scripts (aka spambots) that do not properly quote the
      name when it contains a comma.
      
      This option exists in order to allow parsing of mailbox addresses that do not have a
      domain component. These types of addresses are rare and were typically only used when
      sending mail to other users on the same UNIX system.
  
      Params:
        allow = true if the parser should allow addresses without a domain or false otherwise
  */
  void setAllowAddressesWithoutDomain(bool allow)
  {
    g_mime_parser_options_set_allow_addresses_without_domain(cast(GMimeParserOptions*)this._cPtr, allow);
  }

  /**
      Sets the fallback charsets to try when decoding 8-bit headers.
      
      Note: It is recommended that the list of charsets start with utf-8
      and end with iso-8859-1.
  
      Params:
        charsets = a null-terminated list of charsets or null for the default list
  */
  void setFallbackCharsets(string[] charsets)
  {
    const(char)*[] _tmpcharsets;
    foreach (s; charsets)
      _tmpcharsets ~= s.toCString(No.Alloc);
    _tmpcharsets ~= null;
    const(char*)* _charsets = _tmpcharsets.ptr;

    g_mime_parser_options_set_fallback_charsets(cast(GMimeParserOptions*)this._cPtr, _charsets);
  }

  /**
      Sets the compliance mode that should be used when parsing Content-Type and
      Content-Disposition parameters.
      
      In general, you'll probably want this value to be #GMIME_RFC_COMPLIANCE_LOOSE
      (the default) as it allows maximum interoperability with existing (broken) mail clients
      and other mail software such as sloppily written perl scripts (aka spambots).
      
      Note: Even in #GMIME_RFC_COMPLIANCE_STRICT mode, the parameter parser is fairly liberal
      in what it accepts. Setting it to #GMIME_RFC_COMPLIANCE_LOOSE just makes it try harder
      to deal with garbage input.
  
      Params:
        mode = a #GMimeRfcComplianceMode
  */
  void setParameterComplianceMode(gmime.types.RfcComplianceMode mode)
  {
    g_mime_parser_options_set_parameter_compliance_mode(cast(GMimeParserOptions*)this._cPtr, mode);
  }

  /**
      Sets the compliance mode that should be used when parsing rfc2047 encoded words.
      
      In general, you'll probably want this value to be #GMIME_RFC_COMPLIANCE_LOOSE
      (the default) as it allows maximum interoperability with existing (broken) mail clients
      and other mail software such as sloppily written perl scripts (aka spambots).
      
      Note: Even in #GMIME_RFC_COMPLIANCE_STRICT mode, the parameter parser is fairly liberal
      in what it accepts. Setting it to #GMIME_RFC_COMPLIANCE_LOOSE just makes it try harder
      to deal with garbage input.
  
      Params:
        mode = a #GMimeRfcComplianceMode
  */
  void setRfc2047ComplianceMode(gmime.types.RfcComplianceMode mode)
  {
    g_mime_parser_options_set_rfc2047_compliance_mode(cast(GMimeParserOptions*)this._cPtr, mode);
  }

  /**
      Registers the callback function being called if the parser detects any issues.
  
      Params:
        warningCb = a #GMimeParserWarningFunc or null to clear the callback
  */
  void setWarningCallback(gmime.types.ParserWarningFunc warningCb)
  {
    extern(C) void _warningCbCallback(long offset, GMimeParserWarning errcode, const(char)* item, void* userData)
    {
      auto _dlg = cast(gmime.types.ParserWarningFunc*)userData;
      string _item = item.fromCString(No.Free);

      (*_dlg)(offset, errcode, _item);
    }
    auto _warningCbCB = warningCb ? &_warningCbCallback : null;
    auto _warningCb = warningCb ? freezeDelegate(cast(void*)&warningCb) : null;
    GDestroyNotify _warningCbDestroyCB = warningCb ? &thawDelegate : null;
    g_mime_parser_options_set_warning_callback(cast(GMimeParserOptions*)this._cPtr, _warningCbCB, _warningCb, _warningCbDestroyCB);
  }

  /**
      Gets the default parser options.
      Returns: the default parser options.
  */
  static gmime.parser_options.ParserOptions getDefault()
  {
    GMimeParserOptions* _cretval;
    _cretval = g_mime_parser_options_get_default();
    auto _retval = _cretval ? new gmime.parser_options.ParserOptions(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
