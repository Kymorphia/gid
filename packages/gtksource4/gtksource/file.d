/// Module for [File] class
module gtksource.file;

import gid.gid;
import gio.file;
import gobject.object;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.encoding;
import gtksource.types;

/** */
class File : gobject.object.ObjectWrap
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
    return cast(void function())gtk_source_file_get_type != &gidSymbolNotFound ? gtk_source_file_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override File self()
  {
    return this;
  }

  /**
      Get `compressionType` property.
      Returns: The compression type.
  */
  @property gtksource.types.CompressionType compressionType()
  {
    return getCompressionType();
  }

  /**
      Get `encoding` property.
      Returns: The character encoding, initially null. After a successful file
      loading or saving operation, the encoding is non-null.
  */
  @property gtksource.encoding.Encoding encoding()
  {
    return getEncoding();
  }

  /**
      Get `location` property.
      Returns: The location.
  */
  @property gio.file.File location()
  {
    return getLocation();
  }

  /**
      Set `location` property.
      Params:
        propval = The location.
  */
  @property void location(gio.file.File propval)
  {
    return setLocation(propval);
  }

  /**
      Get `newlineType` property.
      Returns: The line ending type.
  */
  @property gtksource.types.NewlineType newlineType()
  {
    return getNewlineType();
  }

  /**
      Get `readOnly` property.
      Returns: Whether the file is read-only or not. The value of this property is
      not updated automatically (there is no file monitors).
  */
  @property bool readOnly()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("read-only");
  }

  /** */
  this()
  {
    GtkSourceFile* _cretval;
    _cretval = gtk_source_file_new();
    this(_cretval, Yes.Take);
  }

  /**
      Checks synchronously the file on disk, to know whether the file is externally
      modified, or has been deleted, and whether the file is read-only.
      
      #GtkSourceFile doesn't create a #GFileMonitor to track those properties, so
      this function needs to be called instead. Creating lots of #GFileMonitor's
      would take lots of resources.
      
      Since this function is synchronous, it is advised to call it only on local
      files. See [gtksource.file.File.isLocal].
  */
  void checkFileOnDisk()
  {
    gtk_source_file_check_file_on_disk(cast(GtkSourceFile*)this._cPtr);
  }

  /** */
  gtksource.types.CompressionType getCompressionType()
  {
    GtkSourceCompressionType _cretval;
    _cretval = gtk_source_file_get_compression_type(cast(GtkSourceFile*)this._cPtr);
    gtksource.types.CompressionType _retval = cast(gtksource.types.CompressionType)_cretval;
    return _retval;
  }

  /**
      The encoding is initially null. After a successful file loading or saving
      operation, the encoding is non-null.
      Returns: the character encoding.
  */
  gtksource.encoding.Encoding getEncoding()
  {
    const(GtkSourceEncoding)* _cretval;
    _cretval = gtk_source_file_get_encoding(cast(GtkSourceFile*)this._cPtr);
    auto _retval = _cretval ? new gtksource.encoding.Encoding(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /** */
  gio.file.File getLocation()
  {
    GFile* _cretval;
    _cretval = gtk_source_file_get_location(cast(GtkSourceFile*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file.File)(cast(GFile*)_cretval, No.Take);
    return _retval;
  }

  /** */
  gtksource.types.NewlineType getNewlineType()
  {
    GtkSourceNewlineType _cretval;
    _cretval = gtk_source_file_get_newline_type(cast(GtkSourceFile*)this._cPtr);
    gtksource.types.NewlineType _retval = cast(gtksource.types.NewlineType)_cretval;
    return _retval;
  }

  /**
      Returns whether the file has been deleted. If the
      #GtkSourceFile:location is null, returns false.
      
      To have an up-to-date value, you must first call
      [gtksource.file.File.checkFileOnDisk].
      Returns: whether the file has been deleted.
  */
  bool isDeleted()
  {
    bool _retval;
    _retval = cast(bool)gtk_source_file_is_deleted(cast(GtkSourceFile*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the file is externally modified. If the
      #GtkSourceFile:location is null, returns false.
      
      To have an up-to-date value, you must first call
      [gtksource.file.File.checkFileOnDisk].
      Returns: whether the file is externally modified.
  */
  bool isExternallyModified()
  {
    bool _retval;
    _retval = cast(bool)gtk_source_file_is_externally_modified(cast(GtkSourceFile*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the file is local. If the #GtkSourceFile:location is null,
      returns false.
      Returns: whether the file is local.
  */
  bool isLocal()
  {
    bool _retval;
    _retval = cast(bool)gtk_source_file_is_local(cast(GtkSourceFile*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the file is read-only. If the
      #GtkSourceFile:location is null, returns false.
      
      To have an up-to-date value, you must first call
      [gtksource.file.File.checkFileOnDisk].
      Returns: whether the file is read-only.
  */
  bool isReadonly()
  {
    bool _retval;
    _retval = cast(bool)gtk_source_file_is_readonly(cast(GtkSourceFile*)this._cPtr);
    return _retval;
  }

  /**
      Sets the location.
  
      Params:
        location = the new #GFile, or null.
  */
  void setLocation(gio.file.File location = null)
  {
    gtk_source_file_set_location(cast(GtkSourceFile*)this._cPtr, location ? cast(GFile*)(cast(gobject.object.ObjectWrap)location)._cPtr(No.Dup) : null);
  }
}
