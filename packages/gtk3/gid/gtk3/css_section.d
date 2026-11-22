/// Module for [CssSection] class
module gid.gtk3.css_section;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.file;
import gid.gobject2.boxed;
import gid.gobject2.object;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;

/**
    Defines a part of a CSS document. Because sections are nested into
    one another, you can use [gid.gtk4.css_section.CssSection.getParent] to get the
    containing region.
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
  uint getEndLine() nothrow
  {
    uint _retval;
    _retval = gtk_css_section_get_end_line(cast(const(GtkCssSection)*)this._cPtr);
    return _retval;
  }

  /**
      Returns the offset in bytes from the start of the current line
      returned via [gid.gtk3.css_section.CssSection.getEndLine].
      This value may change in future invocations of this function if
      section is not yet parsed completely. This will for example
      happen in the GtkCssProvider::parsing-error signal.
      The end position and line may be identical to the start
      position and line for sections which failed to parse anything
      successfully.
      Returns: the offset in bytes from the start of the line.
  */
  uint getEndPosition() nothrow
  {
    uint _retval;
    _retval = gtk_css_section_get_end_position(cast(const(GtkCssSection)*)this._cPtr);
    return _retval;
  }

  /**
      Gets the file that section was parsed from. If no such file exists,
      for example because the CSS was loaded via
      @[gid.gtk4.css_provider.CssProvider.loadFromData], then null is returned.
      Returns: the #GFile that section was parsed from
            or null if section was parsed from other data
  */
  gid.gio2.file.File getFile() nothrow
  {
    GFile* _cretval;
    _cretval = gtk_css_section_get_file(cast(const(GtkCssSection)*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.file.File)(cast(GFile*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the parent section for the given section. The parent section is
      the section that contains this section. A special case are sections of
      type #GTK_CSS_SECTION_DOCUMENT. Their parent will either be null
      if they are the original CSS document that was loaded by
      [gid.gtk4.css_provider.CssProvider.loadFromFile] or a section of type
      #GTK_CSS_SECTION_IMPORT if it was loaded with an import rule from
      a different file.
      Returns: the parent section or null if none
  */
  gid.gtk3.css_section.CssSection getParent() nothrow
  {
    GtkCssSection* _cretval;
    _cretval = gtk_css_section_get_parent(cast(const(GtkCssSection)*)this._cPtr);
    auto _retval = _cretval ? new gid.gtk3.css_section.CssSection(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the type of information that section describes.
      Returns: the type of section
  */
  gid.gtk3.types.CssSectionType getSectionType() nothrow
  {
    GtkCssSectionType _cretval;
    _cretval = gtk_css_section_get_section_type(cast(const(GtkCssSection)*)this._cPtr);
    gid.gtk3.types.CssSectionType _retval = cast(gid.gtk3.types.CssSectionType)_cretval;
    return _retval;
  }

  /**
      Returns the line in the CSS document where this section starts.
      The line number is 0-indexed, so the first line of the document
      will return 0.
      Returns: the line number
  */
  uint getStartLine() nothrow
  {
    uint _retval;
    _retval = gtk_css_section_get_start_line(cast(const(GtkCssSection)*)this._cPtr);
    return _retval;
  }

  /**
      Returns the offset in bytes from the start of the current line
      returned via [gid.gtk3.css_section.CssSection.getStartLine].
      Returns: the offset in bytes from the start of the line.
  */
  uint getStartPosition() nothrow
  {
    uint _retval;
    _retval = gtk_css_section_get_start_position(cast(const(GtkCssSection)*)this._cPtr);
    return _retval;
  }
}
