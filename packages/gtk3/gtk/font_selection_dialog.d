/// Module for [FontSelectionDialog] class
module gtk.font_selection_dialog;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.dialog;
import gtk.types;
import gtk.widget;

/** */
class FontSelectionDialog : gtk.dialog.Dialog
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
    return cast(void function())gtk_font_selection_dialog_get_type != &gidSymbolNotFound ? gtk_font_selection_dialog_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FontSelectionDialog self()
  {
    return this;
  }

  /**
      Creates a new #GtkFontSelectionDialog.
  
      Params:
        title = the title of the dialog window
      Returns: a new #GtkFontSelectionDialog
  
      Deprecated: Use #GtkFontChooserDialog
  */
  this(string title)
  {
    GtkWidget* _cretval;
    const(char)* _title = title.toCString(No.Alloc);
    _cretval = gtk_font_selection_dialog_new(_title);
    this(_cretval, No.Take);
  }

  /**
      Gets the “Cancel” button.
      Returns: the #GtkWidget used in the dialog
            for the “Cancel” button.
  
      Deprecated: Use #GtkFontChooserDialog
  */
  gtk.widget.Widget getCancelButton()
  {
    GtkWidget* _cretval;
    _cretval = gtk_font_selection_dialog_get_cancel_button(cast(GtkFontSelectionDialog*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the currently-selected font name.
      
      Note that this can be a different string than what you set with
      [gtk.font_selection_dialog.FontSelectionDialog.setFontName], as the font selection widget
      may normalize font names and thus return a string with a different
      structure. For example, “Helvetica Italic Bold 12” could be normalized
      to “Helvetica Bold Italic 12”.  Use [pango.font_description.FontDescription.equal]
      if you want to compare two font descriptions.
      Returns: A string with the name of the current font, or null if no
            font is selected. You must free this string with [glib.global.gfree].
  
      Deprecated: Use #GtkFontChooserDialog
  */
  string getFontName()
  {
    char* _cretval;
    _cretval = gtk_font_selection_dialog_get_font_name(cast(GtkFontSelectionDialog*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Retrieves the #GtkFontSelection widget embedded in the dialog.
      Returns: the embedded #GtkFontSelection
  
      Deprecated: Use #GtkFontChooserDialog
  */
  gtk.widget.Widget getFontSelection()
  {
    GtkWidget* _cretval;
    _cretval = gtk_font_selection_dialog_get_font_selection(cast(GtkFontSelectionDialog*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the “OK” button.
      Returns: the #GtkWidget used in the dialog
            for the “OK” button.
  
      Deprecated: Use #GtkFontChooserDialog
  */
  gtk.widget.Widget getOkButton()
  {
    GtkWidget* _cretval;
    _cretval = gtk_font_selection_dialog_get_ok_button(cast(GtkFontSelectionDialog*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the text displayed in the preview area.
      Returns: the text displayed in the preview area.
            This string is owned by the widget and should not be
            modified or freed
  
      Deprecated: Use #GtkFontChooserDialog
  */
  string getPreviewText()
  {
    const(char)* _cretval;
    _cretval = gtk_font_selection_dialog_get_preview_text(cast(GtkFontSelectionDialog*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
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
  bool setFontName(string fontname)
  {
    bool _retval;
    const(char)* _fontname = fontname.toCString(No.Alloc);
    _retval = cast(bool)gtk_font_selection_dialog_set_font_name(cast(GtkFontSelectionDialog*)this._cPtr, _fontname);
    return _retval;
  }

  /**
      Sets the text displayed in the preview area.
  
      Params:
        text = the text to display in the preview area
  
      Deprecated: Use #GtkFontChooserDialog
  */
  void setPreviewText(string text)
  {
    const(char)* _text = text.toCString(No.Alloc);
    gtk_font_selection_dialog_set_preview_text(cast(GtkFontSelectionDialog*)this._cPtr, _text);
  }
}
