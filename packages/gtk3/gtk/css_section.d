/// Module for [CssSection] class
module gtk.css_section;

import gid.gid;
import gio.file;
import gobject.boxed;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    Defines a part of a CSS document. Because sections are nested into
    one another, you can use [gtk.css_section.CssSection.getParent] to get the
    containing region.
*/
class CssSection : gobject.boxed.Boxed
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
    return cast(void function())gtk_css_section_get_type != &gidSymbolNotFound ? gtk_css_section_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CssSection self()
  {
    return this;
  }

  /**
      Returns the line in the CSS document where this section end.
      The line number is 0-indexed, so the first line of the document
      will return 0.
      This value may change in future invocations of this function if
      section is not yet parsed completely. This will for example
      happen in the GtkCssProvider::parsing-error signal.
      The end position and line may be identical to the start
      position and line for sections which failed to parse anything
      successfully.
      Returns: the line number
  */
  uint getEndLine()
  {
    uint _retval;
    _retval = gtk_css_section_get_end_line(cast(const(GtkCssSection)*)this._cPtr);
    return _retval;
  }

  /**
      Returns the offset in bytes from the start of the current line
      returned via [gtk.css_section.CssSection.getEndLine].
      This value may change in future invocations of this function if
      section is not yet parsed completely. This will for example
      happen in the GtkCssProvider::parsing-error signal.
      The end position and line may be identical to the start
      position and line for sections which failed to parse anything
      successfully.
      Returns: the offset in bytes from the start of the line.
  */
  uint getEndPosition()
  {
    uint _retval;
    _retval = gtk_css_section_get_end_position(cast(const(GtkCssSection)*)this._cPtr);
    return _retval;
  }

  /**
      Gets the file that section was parsed from. If no such file exists,
      for example because the CSS was loaded via
      @[gtk.css_provider.CssProvider.loadFromData], then null is returned.
      Returns: the #GFile that section was parsed from
            or null if section was parsed from other data
  */
  gio.file.File getFile()
  {
    GFile* _cretval;
    _cretval = gtk_css_section_get_file(cast(const(GtkCssSection)*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file.File)(cast(GFile*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the parent section for the given section. The parent section is
      the section that contains this section. A special case are sections of
      type #GTK_CSS_SECTION_DOCUMENT. Their parent will either be null
      if they are the original CSS document that was loaded by
      [gtk.css_provider.CssProvider.loadFromFile] or a section of type
      #GTK_CSS_SECTION_IMPORT if it was loaded with an import rule from
      a different file.
      Returns: the parent section or null if none
  */
  gtk.css_section.CssSection getParent()
  {
    GtkCssSection* _cretval;
    _cretval = gtk_css_section_get_parent(cast(const(GtkCssSection)*)this._cPtr);
    auto _retval = _cretval ? new gtk.css_section.CssSection(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the type of information that section describes.
      Returns: the type of section
  */
  gtk.types.CssSectionType getSectionType()
  {
    GtkCssSectionType _cretval;
    _cretval = gtk_css_section_get_section_type(cast(const(GtkCssSection)*)this._cPtr);
    gtk.types.CssSectionType _retval = cast(gtk.types.CssSectionType)_cretval;
    return _retval;
  }

  /**
      Returns the line in the CSS document where this section starts.
      The line number is 0-indexed, so the first line of the document
      will return 0.
      Returns: the line number
  */
  uint getStartLine()
  {
    uint _retval;
    _retval = gtk_css_section_get_start_line(cast(const(GtkCssSection)*)this._cPtr);
    return _retval;
  }

  /**
      Returns the offset in bytes from the start of the current line
      returned via [gtk.css_section.CssSection.getStartLine].
      Returns: the offset in bytes from the start of the line.
  */
  uint getStartPosition()
  {
    uint _retval;
    _retval = gtk_css_section_get_start_position(cast(const(GtkCssSection)*)this._cPtr);
    return _retval;
  }
}
