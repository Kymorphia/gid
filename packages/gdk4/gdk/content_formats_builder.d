/// Module for [ContentFormatsBuilder] class
module gdk.content_formats_builder;

import gdk.c.functions;
import gdk.c.types;
import gdk.content_formats;
import gdk.types;
import gid.gid;
import gobject.boxed;
import gobject.types;

/**
    A [gdk.content_formats_builder.ContentFormatsBuilder] is an auxiliary struct used to create
    new [gdk.content_formats.ContentFormats], and should not be kept around.
*/
class ContentFormatsBuilder : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gdk_content_formats_builder_get_type != &gidSymbolNotFound ? gdk_content_formats_builder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ContentFormatsBuilder self()
  {
    return this;
  }

  /**
      Create a new [gdk.content_formats_builder.ContentFormatsBuilder] object.
      
      The resulting builder would create an empty [gdk.content_formats.ContentFormats].
      Use addition functions to add types to it.
      Returns: a new [gdk.content_formats_builder.ContentFormatsBuilder]
  */
  this()
  {
    GdkContentFormatsBuilder* _cretval;
    _cretval = gdk_content_formats_builder_new();
    this(_cretval, Yes.Take);
  }

  /**
      Appends all formats from formats to builder, skipping those that
      already exist.
  
      Params:
        formats = the formats to add
  */
  void addFormats(gdk.content_formats.ContentFormats formats)
  {
    gdk_content_formats_builder_add_formats(cast(GdkContentFormatsBuilder*)this._cPtr, formats ? cast(const(GdkContentFormats)*)formats._cPtr(No.Dup) : null);
  }

  /**
      Appends type to builder if it has not already been added.
  
      Params:
        type = a [gobject.types.TYPE_FLAG_RESERVED_ID_BIT]
  */
  void addGtype(gobject.types.GType type)
  {
    gdk_content_formats_builder_add_gtype(cast(GdkContentFormatsBuilder*)this._cPtr, type);
  }

  /**
      Appends mime_type to builder if it has not already been added.
  
      Params:
        mimeType = a mime type
  */
  void addMimeType(string mimeType)
  {
    const(char)* _mimeType = mimeType.toCString(No.Alloc);
    gdk_content_formats_builder_add_mime_type(cast(GdkContentFormatsBuilder*)this._cPtr, _mimeType);
  }

  /**
      Creates a new [gdk.content_formats.ContentFormats] from the given builder.
      
      The given [gdk.content_formats_builder.ContentFormatsBuilder] is reset once this function returns;
      you cannot call this function multiple times on the same builder instance.
      
      This function is intended primarily for bindings. C code should use
      [gdk.content_formats_builder.ContentFormatsBuilder.freeToFormats].
      Returns: the newly created [gdk.content_formats.ContentFormats]
          with all the formats added to builder
  */
  gdk.content_formats.ContentFormats toFormats()
  {
    GdkContentFormats* _cretval;
    _cretval = gdk_content_formats_builder_to_formats(cast(GdkContentFormatsBuilder*)this._cPtr);
    auto _retval = _cretval ? new gdk.content_formats.ContentFormats(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
