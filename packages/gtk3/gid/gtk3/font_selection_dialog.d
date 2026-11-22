/// Module for [FontSelectionDialog] class
module gid.gtk3.font_selection_dialog;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.dialog;
import gid.gtk3.types;
import gid.gtk3.widget;

/** */
class FontSelectionDialog : gid.gtk3.dialog.Dialog
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
    return cast(void function())gtk_font_selection_dialog_get_type != &gidSymbolNotFound ? gtk_font_selection_dialog_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkFontSelectionDialog";
  }

  /** Returns `this`, for use in `with` statements. */
  override FontSelectionDialog self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.font_selection_dialog.FontSelectionDialog]
      Returns: New builder object
  */
  static FontSelectionDialogGidBuilder builder() nothrow
  {
    return new FontSelectionDialogGidBuilder;
  }

  /**
      Creates a new #GtkFontSelectionDialog.
  
      Params:
        title = the title of the dialog window
      Returns: a new #GtkFontSelectionDialog
  
      Deprecated: Use #GtkFontChooserDialog
  */
  this(string title) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _title = title.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_font_selection_dialog_new(_title);
    this(_cretval, No.Take);
  }

  /**
      Gets the “Cancel” button.
      Returns: the #GtkWidget used in the dialog
            for the “Cancel” button.
  
      Deprecated: Use #GtkFontChooserDialog
  */
  gid.gtk3.widget.Widget getCancelButton() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_font_selection_dialog_get_cancel_button(cast(GtkFontSelectionDialog*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the currently-selected font name.
      
      Note that this can be a different string than what you set with
      [gid.gtk3.font_selection_dialog.FontSelectionDialog.setFontName], as the font selection widget
      may normalize font names and thus return a string with a different
      structure. For example, “Helvetica Italic Bold 12” could be normalized
      to “Helvetica Bold Italic 12”.  Use [gid.pango1.font_description.FontDescription.equal]
      if you want to compare two font descriptions.
      Returns: A string with the name of the current font, or null if no
            font is selected. You must free this string with [gid.glib2.global.gfree].
  
      Deprecated: Use #GtkFontChooserDialog
  */
  string getFontName() nothrow
  {
    char* _cretval;
    _cretval = gtk_font_selection_dialog_get_font_name(cast(GtkFontSelectionDialog*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Retrieves the #GtkFontSelection widget embedded in the dialog.
      Returns: the embedded #GtkFontSelection
  
      Deprecated: Use #GtkFontChooserDialog
  */
  gid.gtk3.widget.Widget getFontSelection() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_font_selection_dialog_get_font_selection(cast(GtkFontSelectionDialog*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the “OK” button.
      Returns: the #GtkWidget used in the dialog
            for the “OK” button.
  
      Deprecated: Use #GtkFontChooserDialog
  */
  gid.gtk3.widget.Widget getOkButton() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_font_selection_dialog_get_ok_button(cast(GtkFontSelectionDialog*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the text displayed in the preview area.
      Returns: the text displayed in the preview area.
            This string is owned by the widget and should not be
            modified or freed
  
      Deprecated: Use #GtkFontChooserDialog
  */
  string getPreviewText() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_font_selection_dialog_get_preview_text(cast(GtkFontSelectionDialog*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Sets the currently selected font.
  
      Params:
        fontname = a font name like “Helvetica 12” or “Times Bold 18”
      Returns: true if the font selected in fsd is now the
            fontname specified, false otherwise.
  
      Deprecated: Use #GtkFontChooserDialog
  */
  bool setFontName(string fontname) nothrow
  {
    bool _retval;
    const(char)* _fontname = fontname.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)gtk_font_selection_dialog_set_font_name(cast(GtkFontSelectionDialog*)this._cPtr, _fontname);
    return _retval;
  }

  /**
      Sets the text displayed in the preview area.
  
      Params:
        text = the text to display in the preview area
  
      Deprecated: Use #GtkFontChooserDialog
  */
  void setPreviewText(string text) nothrow
  {
    const(char)* _text = text.toCString!(No.Malloc, No.Nullable);
    gtk_font_selection_dialog_set_preview_text(cast(GtkFontSelectionDialog*)this._cPtr, _text);
  }
}

/// Fluent builder implementation template for [gid.gtk3.font_selection_dialog.FontSelectionDialog]
class FontSelectionDialogGidBuilderImpl(T) : gid.gtk3.dialog.DialogGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gtk3.font_selection_dialog.FontSelectionDialog]
final class FontSelectionDialogGidBuilder : FontSelectionDialogGidBuilderImpl!FontSelectionDialogGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FontSelectionDialog build() nothrow
  {
    return new FontSelectionDialog(cast(void*)createGObject(FontSelectionDialog._getGType), Yes.Take);
  }
}
