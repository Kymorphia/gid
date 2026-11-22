/// Module for [Format] enum namespace
module gid.gst1.format;

import gid.core.utils;
import gid.glib2.types;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.format_definition;
import gid.gst1.iterator;
import gid.gst1.types;

/// Namespace for [Format] enum
struct Format
{
  alias Enum = gid.gst1.types.Format; ///

  /**
      Return the format registered with the given nick.
  
      Params:
        nick = The nick of the format
      Returns: The format with nick or GST_FORMAT_UNDEFINED
        if the format was not registered.
  */
  static gid.gst1.types.Format getByNick(string nick) nothrow
  {
    GstFormat _cretval;
    const(char)* _nick = nick.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_format_get_by_nick(_nick);
    gid.gst1.types.Format _retval = cast(gid.gst1.types.Format)_cretval;
    return _retval;
  }

  /**
      Get details about the given format.
  
      Params:
        format = The format to get details of
      Returns: The #GstFormatDefinition for format or null
        on failure.
        
        MT safe.
  */
  static gid.gst1.format_definition.FormatDefinition getDetails(gid.gst1.types.Format format) nothrow
  {
    const(GstFormatDefinition)* _cretval;
    _cretval = gst_format_get_details(format);
    auto _retval = _cretval ? new gid.gst1.format_definition.FormatDefinition(cast(GstFormatDefinition*)_cretval, null) : null;
    return _retval;
  }

  /**
      Get a printable name for the given format. Do not modify or free.
  
      Params:
        format = a #GstFormat
      Returns: a reference to the static name of the format
        or null if the format is unknown.
  */
  static string getName(gid.gst1.types.Format format) nothrow
  {
    const(char)* _cretval;
    _cretval = gst_format_get_name(format);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Iterate all the registered formats. The format definition is read
      only.
      Returns: a GstIterator of #GstFormatDefinition.
  */
  static gid.gst1.iterator.Iterator iterateDefinitions() nothrow
  {
    GstIterator* _cretval;
    _cretval = gst_format_iterate_definitions();
    auto _retval = _cretval ? new gid.gst1.iterator.Iterator(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new GstFormat based on the nick or return an
      already registered format with that nick.
  
      Params:
        nick = The nick of the new format
        description = The description of the new format
      Returns: A new GstFormat or an already registered format
        with the same nick.
        
        MT safe.
  */
  static gid.gst1.types.Format register(string nick, string description) nothrow
  {
    GstFormat _cretval;
    const(char)* _nick = nick.toCString!(No.Malloc, No.Nullable);
    const(char)* _description = description.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_format_register(_nick, _description);
    gid.gst1.types.Format _retval = cast(gid.gst1.types.Format)_cretval;
    return _retval;
  }

  /**
      Get the unique quark for the given format.
  
      Params:
        format = a #GstFormat
      Returns: the quark associated with the format or 0 if the format
        is unknown.
  */
  static gid.glib2.types.Quark toQuark(gid.gst1.types.Format format) nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = gst_format_to_quark(format);
    return _retval;
  }
}
