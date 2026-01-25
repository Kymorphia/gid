/// Module for [SelectionData] class
module gtk.selection_data;

import gdk.atom;
import gdk.display;
import gdkpixbuf.pixbuf;
import gid.gid;
import gobject.boxed;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.text_buffer;
import gtk.types;

/** */
class SelectionData : gobject.boxed.Boxed
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
    return cast(void function())gtk_selection_data_get_type != &gidSymbolNotFound ? gtk_selection_data_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SelectionData self()
  {
    return this;
  }

  /**
      Makes a copy of a #GtkSelectionData-struct and its data.
      Returns: a pointer to a copy of data.
  */
  gtk.selection_data.SelectionData copy()
  {
    GtkSelectionData* _cretval;
    _cretval = gtk_selection_data_copy(cast(const(GtkSelectionData)*)this._cPtr);
    auto _retval = _cretval ? new gtk.selection_data.SelectionData(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Retrieves the data type of the selection.
      Returns: the data type of the selection.
  */
  gdk.atom.Atom getDataType()
  {
    GdkAtom _cretval;
    _cretval = gtk_selection_data_get_data_type(cast(const(GtkSelectionData)*)this._cPtr);
    auto _retval = _cretval ? new gdk.atom.Atom(cast(GdkAtom)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves the raw data of the selection along with its length.
      Returns: the raw data of the selection
  */
  ubyte[] getData()
  {
    const(ubyte)* _cretval;
    int _cretlength;
    _cretval = gtk_selection_data_get_data_with_length(cast(const(GtkSelectionData)*)this._cPtr, &_cretlength);
    ubyte[] _retval;

    if (_cretval)
    {
      _retval = cast(ubyte[])_cretval[0 .. _cretlength].dup;
    }
    return _retval;
  }

  /**
      Retrieves the display of the selection.
      Returns: the display of the selection.
  */
  gdk.display.Display getDisplay()
  {
    GdkDisplay* _cretval;
    _cretval = gtk_selection_data_get_display(cast(const(GtkSelectionData)*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.display.Display)(cast(GdkDisplay*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the format of the selection.
      Returns: the format of the selection.
  */
  int getFormat()
  {
    int _retval;
    _retval = gtk_selection_data_get_format(cast(const(GtkSelectionData)*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the length of the raw data of the selection.
      Returns: the length of the data of the selection.
  */
  int getLength()
  {
    int _retval;
    _retval = gtk_selection_data_get_length(cast(const(GtkSelectionData)*)this._cPtr);
    return _retval;
  }

  /**
      Gets the contents of the selection data as a #GdkPixbuf.
      Returns: if the selection data
          contained a recognized image type and it could be converted to a
          #GdkPixbuf, a newly allocated pixbuf is returned, otherwise
          null.  If the result is non-null it must be freed with
          [gobject.object.ObjectWrap.unref].
  */
  gdkpixbuf.pixbuf.Pixbuf getPixbuf()
  {
    GdkPixbuf* _cretval;
    _cretval = gtk_selection_data_get_pixbuf(cast(const(GtkSelectionData)*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Retrieves the selection #GdkAtom of the selection data.
      Returns: the selection #GdkAtom of the selection data.
  */
  gdk.atom.Atom getSelection()
  {
    GdkAtom _cretval;
    _cretval = gtk_selection_data_get_selection(cast(const(GtkSelectionData)*)this._cPtr);
    auto _retval = _cretval ? new gdk.atom.Atom(cast(GdkAtom)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves the target of the selection.
      Returns: the target of the selection.
  */
  gdk.atom.Atom getTarget()
  {
    GdkAtom _cretval;
    _cretval = gtk_selection_data_get_target(cast(const(GtkSelectionData)*)this._cPtr);
    auto _retval = _cretval ? new gdk.atom.Atom(cast(GdkAtom)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the contents of the selection data as a UTF-8 string.
      Returns: if the selection data contained a
          recognized text type and it could be converted to UTF-8, a newly
          allocated string containing the converted text, otherwise null.
          If the result is non-null it must be freed with [glib.global.gfree].
  */
  string getText()
  {
    ubyte* _cretval;
    _cretval = gtk_selection_data_get_text(cast(const(GtkSelectionData)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the contents of the selection data as array of URIs.
      
      Since 3.24.37, this may involve using the FileTransfer
      portal to send files between sandboxed apps.
      Returns: if
          the selection data contains a list of
          URIs, a newly allocated null-terminated string array
          containing the URIs, otherwise null. If the result is
          non-null it must be freed with [glib.global.strfreev].
  */
  string[] getUris()
  {
    char** _cretval;
    _cretval = gtk_selection_data_get_uris(cast(const(GtkSelectionData)*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Stores new data into a #GtkSelectionData object. Should
      only be called from a selection handler callback.
      Zero-terminates the stored data.
  
      Params:
        type = the type of selection data
        format = format (number of bits in a unit)
        data = pointer to the data (will be copied)
  */
  void set(gdk.atom.Atom type, int format, ubyte[] data)
  {
    int _length;
    if (data)
      _length = cast(int)data.length;

    auto _data = cast(const(ubyte)*)data.ptr;
    gtk_selection_data_set(cast(GtkSelectionData*)this._cPtr, type ? cast(GdkAtom)type._cPtr : null, format, _data, _length);
  }

  /**
      Sets the contents of the selection from a #GdkPixbuf
      The pixbuf is converted to the form determined by
      selection_data->target.
  
      Params:
        pixbuf = a #GdkPixbuf
      Returns: true if the selection was successfully set,
          otherwise false.
  */
  bool setPixbuf(gdkpixbuf.pixbuf.Pixbuf pixbuf)
  {
    bool _retval;
    _retval = cast(bool)gtk_selection_data_set_pixbuf(cast(GtkSelectionData*)this._cPtr, pixbuf ? cast(GdkPixbuf*)pixbuf._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Sets the contents of the selection from a UTF-8 encoded string.
      The string is converted to the form determined by
      selection_data->target.
  
      Params:
        str = a UTF-8 string
      Returns: true if the selection was successfully set,
          otherwise false.
  */
  bool setText(string str)
  {
    bool _retval;
    int _len;
    if (str)
      _len = cast(int)str.length;

    auto _str = cast(const(char)*)str.ptr;
    _retval = cast(bool)gtk_selection_data_set_text(cast(GtkSelectionData*)this._cPtr, _str, _len);
    return _retval;
  }

  /**
      Sets the contents of the selection from a list of URIs.
      The string is converted to the form determined by
      selection_data->target.
      
      Since 3.24.37, this may involve using the FileTransfer
      portal to send files between sandboxed apps.
  
      Params:
        uris = a null-terminated array of
              strings holding URIs
      Returns: true if the selection was successfully set,
          otherwise false.
  */
  bool setUris(string[] uris)
  {
    bool _retval;
    char*[] _tmpuris;
    foreach (s; uris)
      _tmpuris ~= s.toCString(No.Alloc);
    _tmpuris ~= null;
    char** _uris = _tmpuris.ptr;

    _retval = cast(bool)gtk_selection_data_set_uris(cast(GtkSelectionData*)this._cPtr, _uris);
    return _retval;
  }

  /**
      Given a #GtkSelectionData object holding a list of targets,
      determines if any of the targets in targets can be used to
      provide a #GdkPixbuf.
  
      Params:
        writable = whether to accept only targets for which GTK+ knows
            how to convert a pixbuf into the format
      Returns: true if selection_data holds a list of targets,
          and a suitable target for images is included, otherwise false.
  */
  bool targetsIncludeImage(bool writable)
  {
    bool _retval;
    _retval = cast(bool)gtk_selection_data_targets_include_image(cast(const(GtkSelectionData)*)this._cPtr, writable);
    return _retval;
  }

  /**
      Given a #GtkSelectionData object holding a list of targets,
      determines if any of the targets in targets can be used to
      provide rich text.
  
      Params:
        buffer = a #GtkTextBuffer
      Returns: true if selection_data holds a list of targets,
                      and a suitable target for rich text is included,
                      otherwise false.
  */
  bool targetsIncludeRichText(gtk.text_buffer.TextBuffer buffer)
  {
    bool _retval;
    _retval = cast(bool)gtk_selection_data_targets_include_rich_text(cast(const(GtkSelectionData)*)this._cPtr, buffer ? cast(GtkTextBuffer*)buffer._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Given a #GtkSelectionData object holding a list of targets,
      determines if any of the targets in targets can be used to
      provide text.
      Returns: true if selection_data holds a list of targets,
          and a suitable target for text is included, otherwise false.
  */
  bool targetsIncludeText()
  {
    bool _retval;
    _retval = cast(bool)gtk_selection_data_targets_include_text(cast(const(GtkSelectionData)*)this._cPtr);
    return _retval;
  }

  /**
      Given a #GtkSelectionData object holding a list of targets,
      determines if any of the targets in targets can be used to
      provide a list or URIs.
      Returns: true if selection_data holds a list of targets,
          and a suitable target for URI lists is included, otherwise false.
  */
  bool targetsIncludeUri()
  {
    bool _retval;
    _retval = cast(bool)gtk_selection_data_targets_include_uri(cast(const(GtkSelectionData)*)this._cPtr);
    return _retval;
  }
}
