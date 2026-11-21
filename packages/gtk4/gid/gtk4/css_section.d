/// Module for [CssSection] class
module gid.gtk4.css_section;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gio2.file;
import gid.glib2.bytes;
import gid.glib2.string_;
import gid.gobject2.boxed;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;

/**
    Defines a part of a CSS document.
    
    Because sections are nested into one another, you can use
    [gid.gtk4.css_section.CssSection.getParent] to get the containing region.
*/
class CssSection : gid.gobject2.boxed.BoxedWrap!(gtk_css_section_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override CssSection self() nothrow
  {
    return this;
  }

  /**
      Creates a new [gid.gtk4.css_section.CssSection] referring to the section
      in the given `file` from the `start` location to the
      `end` location.
  
      Params:
        file = The file this section refers to
        start = The start location
        end = The end location
      Returns: a new [gid.gtk4.css_section.CssSection]
  */
  this(gid.gio2.file.File file, gid.gtk4.types.CssLocation start, gid.gtk4.types.CssLocation end) nothrow
  {
    GtkCssSection* _cretval;
    _cretval = gtk_css_section_new(file ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)file)._cPtr(No.Dup) : null, cast(const(GtkCssLocation)*)&start, cast(const(GtkCssLocation)*)&end);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new [gid.gtk4.css_section.CssSection] referring to the section
      in the given `file` or the given `bytes` from the `start` location to the
      `end` location.
  
      Params:
        file = The file this section refers to
        bytes = The bytes this sections refers to
        start = The start location
        end = The end location
      Returns: a new [gid.gtk4.css_section.CssSection]
  */
  static gid.gtk4.css_section.CssSection newWithBytes(gid.gio2.file.File file, gid.glib2.bytes.Bytes bytes, gid.gtk4.types.CssLocation start, gid.gtk4.types.CssLocation end) nothrow
  {
    GtkCssSection* _cretval;
    _cretval = gtk_css_section_new_with_bytes(file ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)file)._cPtr(No.Dup) : null, bytes ? cast(GBytes*)bytes._cPtr(No.Dup) : null, cast(const(GtkCssLocation)*)&start, cast(const(GtkCssLocation)*)&end);
    auto _retval = _cretval ? new gid.gtk4.css_section.CssSection(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the bytes that section was parsed from.
      Returns: the [gid.glib2.bytes.Bytes] from which the `section`
          was parsed
  */
  gid.glib2.bytes.Bytes getBytes() nothrow
  {
    GBytes* _cretval;
    _cretval = gtk_css_section_get_bytes(cast(const(GtkCssSection)*)this._cPtr);
    auto _retval = _cretval ? new gid.glib2.bytes.Bytes(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns the location in the CSS document where this section ends.
      Returns: The end location of
          this section
  */
  gid.gtk4.types.CssLocation getEndLocation() nothrow
  {
    const(GtkCssLocation)* _cretval;
    _cretval = gtk_css_section_get_end_location(cast(const(GtkCssSection)*)this._cPtr);
    gid.gtk4.types.CssLocation _retval;
    if (_cretval)
      _retval = *cast(gid.gtk4.types.CssLocation*)_cretval;
    return _retval;
  }

  /**
      Gets the file that section was parsed from.
      
      If no such file exists, for example because the CSS was loaded via
      [gid.gtk4.css_provider.CssProvider.loadFromData], then `NULL` is returned.
      Returns: the [gid.gio2.file.File] from which the `section`
          was parsed
  */
  gid.gio2.file.File getFile() nothrow
  {
    GFile* _cretval;
    _cretval = gtk_css_section_get_file(cast(const(GtkCssSection)*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file.File)(cast(GFile*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the parent section for the given `section`.
      
      The parent section is the section that contains this `section`. A special
      case are sections of  type [gid.gtk3.types.CssSectionType.Document]. Their parent will
      either be `NULL` if they are the original CSS document that was loaded by
      [gid.gtk4.css_provider.CssProvider.loadFromFile] or a section of type
      [gid.gtk3.types.CssSectionType.Import] if it was loaded with an `import` rule from
      a different file.
      Returns: the parent section
  */
  gid.gtk4.css_section.CssSection getParent() nothrow
  {
    GtkCssSection* _cretval;
    _cretval = gtk_css_section_get_parent(cast(const(GtkCssSection)*)this._cPtr);
    auto _retval = _cretval ? new gid.gtk4.css_section.CssSection(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns the location in the CSS document where this section starts.
      Returns: The start location of
          this section
  */
  gid.gtk4.types.CssLocation getStartLocation() nothrow
  {
    const(GtkCssLocation)* _cretval;
    _cretval = gtk_css_section_get_start_location(cast(const(GtkCssSection)*)this._cPtr);
    gid.gtk4.types.CssLocation _retval;
    if (_cretval)
      _retval = *cast(gid.gtk4.types.CssLocation*)_cretval;
    return _retval;
  }

  /**
      Prints the `section` into `string` in a human-readable form.
      
      This is a form like `gtk.css:32:1-23` to denote line 32, characters
      1 to 23 in the file `gtk.css`.
  
      Params:
        string_ = a [gid.glib2.string_.String] to print to
  */
  void print(gid.glib2.string_.String string_) nothrow
  {
    gtk_css_section_print(cast(const(GtkCssSection)*)this._cPtr, string_ ? cast(GString*)string_._cPtr(No.Dup) : null);
  }

  /**
      Prints the section into a human-readable text form using
      [gid.gtk4.css_section.CssSection.print].
      Returns: A new string.
  */
  string toString_() nothrow
  {
    char* _cretval;
    _cretval = gtk_css_section_to_string(cast(const(GtkCssSection)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }
}
