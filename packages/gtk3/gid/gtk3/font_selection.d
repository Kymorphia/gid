/// Module for [FontSelection] class
module gid.gtk3.font_selection;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.box;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.orientable;
import gid.gtk3.orientable_mixin;
import gid.gtk3.types;
import gid.gtk3.widget;
import gid.pango1.font_face;
import gid.pango1.font_family;

/** */
class FontSelection : gid.gtk3.box.Box
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_font_selection_get_type != &gidSymbolNotFound ? gtk_font_selection_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkFontSelection";
  }

  /** Returns `this`, for use in `with` statements. */
  override FontSelection self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.font_selection.FontSelection]
      Returns: New builder object
  */
  static FontSelectionGidBuilder builder() nothrow
  {
    return new FontSelectionGidBuilder;
  }

  /** */
  @property string fontName() nothrow
  {
    return getFontName();
  }

  /** */
  @property void fontName(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("font-name", propval);
  }

  /** */
  @property string previewText() nothrow
  {
    return getPreviewText();
  }

  /** */
  @property void previewText(string propval) nothrow
  {
    setPreviewText(propval);
  }

  /**
      Creates a new #GtkFontSelection.
      Returns: a new #GtkFontSelection
  
      Deprecated: Use #GtkFontChooserWidget instead
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_font_selection_new();
    this(_cretval, No.Take);
  }

  /**
      Gets the #PangoFontFace representing the selected font group
      details (i.e. family, slant, weight, width, etc).
      Returns: A #PangoFontFace representing the
            selected font group details. The returned object is owned by
            fontsel and must not be modified or freed.
  
      Deprecated: Use #GtkFontChooser
  */
  gid.pango1.font_face.FontFace getFace() nothrow
  {
    PangoFontFace* _cretval;
    _cretval = gtk_font_selection_get_face(cast(GtkFontSelection*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.font_face.FontFace)(cast(PangoFontFace*)_cretval, No.Take);
    return _retval;
  }

  /**
      This returns the #GtkTreeView which lists all styles available for
      the selected font. For example, “Regular”, “Bold”, etc.
      Returns: A #GtkWidget that is part of fontsel
  
      Deprecated: Use #GtkFontChooser
  */
  gid.gtk3.widget.Widget getFaceList() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_font_selection_get_face_list(cast(GtkFontSelection*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the #PangoFontFamily representing the selected font family.
      Returns: A #PangoFontFamily representing the
            selected font family. Font families are a collection of font
            faces. The returned object is owned by fontsel and must not
            be modified or freed.
  
      Deprecated: Use #GtkFontChooser
  */
  gid.pango1.font_family.FontFamily getFamily() nothrow
  {
    PangoFontFamily* _cretval;
    _cretval = gtk_font_selection_get_family(cast(GtkFontSelection*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.font_family.FontFamily)(cast(PangoFontFamily*)_cretval, No.Take);
    return _retval;
  }

  /**
      This returns the #GtkTreeView that lists font families, for
      example, “Sans”, “Serif”, etc.
      Returns: A #GtkWidget that is part of fontsel
  
      Deprecated: Use #GtkFontChooser
  */
  gid.gtk3.widget.Widget getFamilyList() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_font_selection_get_family_list(cast(GtkFontSelection*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the currently-selected font name.
      
      Note that this can be a different string than what you set with
      [gid.gtk3.font_selection.FontSelection.setFontName], as the font selection widget may
      normalize font names and thus return a string with a different structure.
      For example, “Helvetica Italic Bold 12” could be normalized to
      “Helvetica Bold Italic 12”. Use [gid.pango1.font_description.FontDescription.equal]
      if you want to compare two font descriptions.
      Returns: A string with the name of the current font, or null if
            no font is selected. You must free this string with [gid.glib2.global.gfree].
  
      Deprecated: Use #GtkFontChooser
  */
  string getFontName() nothrow
  {
    char* _cretval;
    _cretval = gtk_font_selection_get_font_name(cast(GtkFontSelection*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      This returns the #GtkEntry used to display the font as a preview.
      Returns: A #GtkWidget that is part of fontsel
  
      Deprecated: Use #GtkFontChooser
  */
  gid.gtk3.widget.Widget getPreviewEntry() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_font_selection_get_preview_entry(cast(GtkFontSelection*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the text displayed in the preview area.
      Returns: the text displayed in the preview area.
            This string is owned by the widget and should not be
            modified or freed
  
      Deprecated: Use #GtkFontChooser
  */
  string getPreviewText() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_font_selection_get_preview_text(cast(GtkFontSelection*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      The selected font size.
      Returns: A n integer representing the selected font size,
            or -1 if no font size is selected.
  
      Deprecated: Use #GtkFontChooser
  */
  int getSize() nothrow
  {
    int _retval;
    _retval = gtk_font_selection_get_size(cast(GtkFontSelection*)this._cPtr);
    return _retval;
  }

  /**
      This returns the #GtkEntry used to allow the user to edit the font
      number manually instead of selecting it from the list of font sizes.
      Returns: A #GtkWidget that is part of fontsel
  
      Deprecated: Use #GtkFontChooser
  */
  gid.gtk3.widget.Widget getSizeEntry() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_font_selection_get_size_entry(cast(GtkFontSelection*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      This returns the #GtkTreeView used to list font sizes.
      Returns: A #GtkWidget that is part of fontsel
  
      Deprecated: Use #GtkFontChooser
  */
  gid.gtk3.widget.Widget getSizeList() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_font_selection_get_size_list(cast(GtkFontSelection*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the currently-selected font.
      
      Note that the fontsel needs to know the screen in which it will appear
      for this to work; this can be guaranteed by simply making sure that the
      fontsel is inserted in a toplevel window before you call this function.
  
      Params:
        fontname = a font name like “Helvetica 12” or “Times Bold 18”
      Returns: true if the font could be set successfully; false if no
            such font exists or if the fontsel doesn’t belong to a particular
            screen yet.
  
      Deprecated: Use #GtkFontChooser
  */
  bool setFontName(string fontname) nothrow
  {
    bool _retval;
    const(char)* _fontname = fontname.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)gtk_font_selection_set_font_name(cast(GtkFontSelection*)this._cPtr, _fontname);
    return _retval;
  }

  /**
      Sets the text displayed in the preview area.
      The text is used to show how the selected font looks.
  
      Params:
        text = the text to display in the preview area
  
      Deprecated: Use #GtkFontChooser
  */
  void setPreviewText(string text) nothrow
  {
    const(char)* _text = text.toCString!(No.Malloc, No.Nullable);
    gtk_font_selection_set_preview_text(cast(GtkFontSelection*)this._cPtr, _text);
  }
}

/// Fluent builder implementation template for [gid.gtk3.font_selection.FontSelection]
class FontSelectionGidBuilderImpl(T) : gid.gtk3.box.BoxGidBuilderImpl!T
{


  /** */
  T fontName(string propval) nothrow
  {
    return setProperty("font-name", propval);
  }

  /** */
  T previewText(string propval) nothrow
  {
    return setProperty("preview-text", propval);
  }
}

/// Fluent builder for [gid.gtk3.font_selection.FontSelection]
final class FontSelectionGidBuilder : FontSelectionGidBuilderImpl!FontSelectionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FontSelection build() nothrow
  {
    return new FontSelection(cast(void*)createGObject(FontSelection._getGType), Yes.Take);
  }
}
