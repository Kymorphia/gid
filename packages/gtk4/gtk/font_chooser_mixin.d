/// Module for [FontChooser] interface mixin
module gtk.font_chooser_mixin;

public import gtk.font_chooser_iface_proxy;
public import gid.gid;
public import gobject.dclosure;
public import gobject.object;
public import gtk.c.functions;
public import gtk.c.types;
public import gtk.types;
public import pango.font_description;
public import pango.font_face;
public import pango.font_family;
public import pango.font_map;

/**
    [gtk.font_chooser.FontChooser] is an interface that can be implemented by widgets
    for choosing fonts.
    
    In GTK, the main objects that implement this interface are
    [gtk.font_chooser_widget.FontChooserWidget], [gtk.font_chooser_dialog.FontChooserDialog] and
    [gtk.font_button.FontButton].

    Deprecated: Use [gtk.font_dialog.FontDialog] and [gtk.font_dialog_button.FontDialogButton]
      instead
*/
template FontChooserT()
{

  /**
      Get `font` property.
      Returns: The font description as a string, e.g. "Sans Italic 12".
  
      Deprecated: Use [gtk.font_dialog.FontDialog] and [gtk.font_dialog_button.FontDialogButton] instead
  */
  @property string font()
  {
    return getFont();
  }

  /**
      Set `font` property.
      Params:
        propval = The font description as a string, e.g. "Sans Italic 12".
  
      Deprecated: Use [gtk.font_dialog.FontDialog] and [gtk.font_dialog_button.FontDialogButton] instead
  */
  @property void font(string propval)
  {
    return setFont(propval);
  }

  /**
      Get `fontDesc` property.
      Returns: The font description as a [pango.font_description.FontDescription].
  
      Deprecated: Use [gtk.font_dialog.FontDialog] and [gtk.font_dialog_button.FontDialogButton] instead
  */
  @property pango.font_description.FontDescription fontDesc()
  {
    return getFontDesc();
  }

  /**
      Set `fontDesc` property.
      Params:
        propval = The font description as a [pango.font_description.FontDescription].
  
      Deprecated: Use [gtk.font_dialog.FontDialog] and [gtk.font_dialog_button.FontDialogButton] instead
  */
  @property void fontDesc(pango.font_description.FontDescription propval)
  {
    return setFontDesc(propval);
  }

  /**
      Get `fontFeatures` property.
      Returns: The selected font features.
        
        The format of the string is compatible with
        CSS and with Pango attributes.
  
      Deprecated: Use [gtk.font_dialog.FontDialog] and [gtk.font_dialog_button.FontDialogButton] instead
  */
  @property string fontFeatures()
  {
    return getFontFeatures();
  }

  /**
      Get `language` property.
      Returns: The language for which the font features were selected.
  
      Deprecated: Use [gtk.font_dialog.FontDialog] and [gtk.font_dialog_button.FontDialogButton] instead
  */
  @property string language()
  {
    return getLanguage();
  }

  /**
      Set `language` property.
      Params:
        propval = The language for which the font features were selected.
  
      Deprecated: Use [gtk.font_dialog.FontDialog] and [gtk.font_dialog_button.FontDialogButton] instead
  */
  @property void language(string propval)
  {
    return setLanguage(propval);
  }

  /**
      Get `level` property.
      Returns: The level of granularity to offer for selecting fonts.
  
      Deprecated: Use [gtk.font_dialog.FontDialog] and [gtk.font_dialog_button.FontDialogButton] instead
  */
  @property gtk.types.FontChooserLevel level()
  {
    return getLevel();
  }

  /**
      Set `level` property.
      Params:
        propval = The level of granularity to offer for selecting fonts.
  
      Deprecated: Use [gtk.font_dialog.FontDialog] and [gtk.font_dialog_button.FontDialogButton] instead
  */
  @property void level(gtk.types.FontChooserLevel propval)
  {
    return setLevel(propval);
  }

  /**
      Get `previewText` property.
      Returns: The string with which to preview the font.
  
      Deprecated: Use [gtk.font_dialog.FontDialog] and [gtk.font_dialog_button.FontDialogButton] instead
  */
  @property string previewText()
  {
    return getPreviewText();
  }

  /**
      Set `previewText` property.
      Params:
        propval = The string with which to preview the font.
  
      Deprecated: Use [gtk.font_dialog.FontDialog] and [gtk.font_dialog_button.FontDialogButton] instead
  */
  @property void previewText(string propval)
  {
    return setPreviewText(propval);
  }

  /**
      Get `showPreviewEntry` property.
      Returns: Whether to show an entry to change the preview text.
  
      Deprecated: Use [gtk.font_dialog.FontDialog] and [gtk.font_dialog_button.FontDialogButton] instead
  */
  @property bool showPreviewEntry()
  {
    return getShowPreviewEntry();
  }

  /**
      Set `showPreviewEntry` property.
      Params:
        propval = Whether to show an entry to change the preview text.
  
      Deprecated: Use [gtk.font_dialog.FontDialog] and [gtk.font_dialog_button.FontDialogButton] instead
  */
  @property void showPreviewEntry(bool propval)
  {
    return setShowPreviewEntry(propval);
  }

  /**
      Gets the currently-selected font name.
      
      Note that this can be a different string than what you set with
      [gtk.font_chooser.FontChooser.setFont], as the font chooser widget may
      normalize font names and thus return a string with a different
      structure. For example, “Helvetica Italic Bold 12” could be
      normalized to “Helvetica Bold Italic 12”.
      
      Use [pango.font_description.FontDescription.equal] if you want to compare two
      font descriptions.
      Returns: A string with the name
          of the current font
  
      Deprecated: Use [gtk.font_dialog.FontDialog] and [gtk.font_dialog_button.FontDialogButton]
        instead
  */
  override string getFont()
  {
    char* _cretval;
    _cretval = gtk_font_chooser_get_font(cast(GtkFontChooser*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the currently-selected font.
      
      Note that this can be a different string than what you set with
      [gtk.font_chooser.FontChooser.setFont], as the font chooser widget may
      normalize font names and thus return a string with a different
      structure. For example, “Helvetica Italic Bold 12” could be
      normalized to “Helvetica Bold Italic 12”.
      
      Use [pango.font_description.FontDescription.equal] if you want to compare two
      font descriptions.
      Returns: A [pango.font_description.FontDescription] for the
          current font
  
      Deprecated: Use [gtk.font_dialog.FontDialog] and [gtk.font_dialog_button.FontDialogButton]
        instead
  */
  override pango.font_description.FontDescription getFontDesc()
  {
    PangoFontDescription* _cretval;
    _cretval = gtk_font_chooser_get_font_desc(cast(GtkFontChooser*)this._cPtr);
    auto _retval = _cretval ? new pango.font_description.FontDescription(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the [pango.font_face.FontFace] representing the selected font group
      details (i.e. family, slant, weight, width, etc).
      
      If the selected font is not installed, returns null.
      Returns: A [pango.font_face.FontFace] representing the
          selected font group details
  
      Deprecated: Use [gtk.font_dialog.FontDialog] and [gtk.font_dialog_button.FontDialogButton]
        instead
  */
  override pango.font_face.FontFace getFontFace()
  {
    PangoFontFace* _cretval;
    _cretval = gtk_font_chooser_get_font_face(cast(GtkFontChooser*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(pango.font_face.FontFace)(cast(PangoFontFace*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the [pango.font_family.FontFamily] representing the selected font family.
      
      Font families are a collection of font faces.
      
      If the selected font is not installed, returns null.
      Returns: A [pango.font_family.FontFamily] representing the
          selected font family
  
      Deprecated: Use [gtk.font_dialog.FontDialog] and [gtk.font_dialog_button.FontDialogButton]
        instead
  */
  override pango.font_family.FontFamily getFontFamily()
  {
    PangoFontFamily* _cretval;
    _cretval = gtk_font_chooser_get_font_family(cast(GtkFontChooser*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(pango.font_family.FontFamily)(cast(PangoFontFamily*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the currently-selected font features.
      
      The format of the returned string is compatible with the
      [CSS font-feature-settings property](https://www.w3.org/TR/css-fonts-4/#font-rend-desc).
      It can be passed to [pango.attr_font_features.AttrFontFeatures.new_].
      Returns: the currently selected font features
  
      Deprecated: Use [gtk.font_dialog.FontDialog] and [gtk.font_dialog_button.FontDialogButton]
        instead
  */
  override string getFontFeatures()
  {
    char* _cretval;
    _cretval = gtk_font_chooser_get_font_features(cast(GtkFontChooser*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the custom font map of this font chooser widget,
      or null if it does not have one.
      Returns: a [pango.font_map.FontMap]
  
      Deprecated: Use [gtk.font_dialog.FontDialog] and [gtk.font_dialog_button.FontDialogButton]
        instead
  */
  override pango.font_map.FontMap getFontMap()
  {
    PangoFontMap* _cretval;
    _cretval = gtk_font_chooser_get_font_map(cast(GtkFontChooser*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(pango.font_map.FontMap)(cast(PangoFontMap*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      The selected font size.
      Returns: A n integer representing the selected font size,
          or -1 if no font size is selected.
  
      Deprecated: Use [gtk.font_dialog.FontDialog] and [gtk.font_dialog_button.FontDialogButton]
        instead
  */
  override int getFontSize()
  {
    int _retval;
    _retval = gtk_font_chooser_get_font_size(cast(GtkFontChooser*)this._cPtr);
    return _retval;
  }

  /**
      Gets the language that is used for font features.
      Returns: the currently selected language
  
      Deprecated: Use [gtk.font_dialog.FontDialog] and [gtk.font_dialog_button.FontDialogButton]
        instead
  */
  override string getLanguage()
  {
    char* _cretval;
    _cretval = gtk_font_chooser_get_language(cast(GtkFontChooser*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Returns the current level of granularity for selecting fonts.
      Returns: the current granularity level
  
      Deprecated: Use [gtk.font_dialog.FontDialog] and [gtk.font_dialog_button.FontDialogButton]
        instead
  */
  override gtk.types.FontChooserLevel getLevel()
  {
    GtkFontChooserLevel _cretval;
    _cretval = gtk_font_chooser_get_level(cast(GtkFontChooser*)this._cPtr);
    gtk.types.FontChooserLevel _retval = cast(gtk.types.FontChooserLevel)_cretval;
    return _retval;
  }

  /**
      Gets the text displayed in the preview area.
      Returns: the text displayed in the preview area
  
      Deprecated: Use [gtk.font_dialog.FontDialog] and [gtk.font_dialog_button.FontDialogButton]
        instead
  */
  override string getPreviewText()
  {
    char* _cretval;
    _cretval = gtk_font_chooser_get_preview_text(cast(GtkFontChooser*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Returns whether the preview entry is shown or not.
      Returns: true if the preview entry is shown or false if it is hidden.
  
      Deprecated: Use [gtk.font_dialog.FontDialog] and [gtk.font_dialog_button.FontDialogButton]
        instead
  */
  override bool getShowPreviewEntry()
  {
    bool _retval;
    _retval = cast(bool)gtk_font_chooser_get_show_preview_entry(cast(GtkFontChooser*)this._cPtr);
    return _retval;
  }

  /**
      Adds a filter function that decides which fonts to display
      in the font chooser.
  
      Params:
        filter = a [gtk.types.FontFilterFunc]
  
      Deprecated: Use [gtk.font_dialog.FontDialog] and [gtk.font_dialog_button.FontDialogButton]
        instead
  */
  override void setFilterFunc(gtk.types.FontFilterFunc filter = null)
  {
    extern(C) gboolean _filterCallback(const(PangoFontFamily)* family, const(PangoFontFace)* face, void* data)
    {
      bool _dretval;
      auto _dlg = cast(gtk.types.FontFilterFunc*)data;

      _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(pango.font_family.FontFamily)(cast(void*)family, No.Take), gobject.object.ObjectWrap._getDObject!(pango.font_face.FontFace)(cast(void*)face, No.Take));
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _filterCB = filter ? &_filterCallback : null;
    auto _filter = filter ? freezeDelegate(cast(void*)&filter) : null;
    GDestroyNotify _filterDestroyCB = filter ? &thawDelegate : null;
    gtk_font_chooser_set_filter_func(cast(GtkFontChooser*)this._cPtr, _filterCB, _filter, _filterDestroyCB);
  }

  /**
      Sets the currently-selected font.
  
      Params:
        fontname = a font name like “Helvetica 12” or “Times Bold 18”
  
      Deprecated: Use [gtk.font_dialog.FontDialog] and [gtk.font_dialog_button.FontDialogButton]
        instead
  */
  override void setFont(string fontname)
  {
    const(char)* _fontname = fontname.toCString(No.Alloc);
    gtk_font_chooser_set_font(cast(GtkFontChooser*)this._cPtr, _fontname);
  }

  /**
      Sets the currently-selected font from font_desc.
  
      Params:
        fontDesc = a [pango.font_description.FontDescription]
  
      Deprecated: Use [gtk.font_dialog.FontDialog] and [gtk.font_dialog_button.FontDialogButton]
        instead
  */
  override void setFontDesc(pango.font_description.FontDescription fontDesc)
  {
    gtk_font_chooser_set_font_desc(cast(GtkFontChooser*)this._cPtr, fontDesc ? cast(const(PangoFontDescription)*)fontDesc._cPtr(No.Dup) : null);
  }

  /**
      Sets a custom font map to use for this font chooser widget.
      
      A custom font map can be used to present application-specific
      fonts instead of or in addition to the normal system fonts.
      
      ```c
      FcConfig *config;
      PangoFontMap *fontmap;
      
      config = FcInitLoadConfigAndFonts ();
      FcConfigAppFontAddFile (config, my_app_font_file);
      
      fontmap = pango_cairo_font_map_new_for_font_type (CAIRO_FONT_TYPE_FT);
      pango_fc_font_map_set_config (PANGO_FC_FONT_MAP (fontmap), config);
      
      gtk_font_chooser_set_font_map (font_chooser, fontmap);
      ```
      
      Note that other GTK widgets will only be able to use the
      application-specific font if it is present in the font map they use:
      
      ```c
      context = gtk_widget_get_pango_context (label);
      pango_context_set_font_map (context, fontmap);
      ```
  
      Params:
        fontmap = a [pango.font_map.FontMap]
  
      Deprecated: Use [gtk.font_dialog.FontDialog] and [gtk.font_dialog_button.FontDialogButton]
        instead
  */
  override void setFontMap(pango.font_map.FontMap fontmap = null)
  {
    gtk_font_chooser_set_font_map(cast(GtkFontChooser*)this._cPtr, fontmap ? cast(PangoFontMap*)fontmap._cPtr(No.Dup) : null);
  }

  /**
      Sets the language to use for font features.
  
      Params:
        language = a language
  
      Deprecated: Use [gtk.font_dialog.FontDialog] and [gtk.font_dialog_button.FontDialogButton]
        instead
  */
  override void setLanguage(string language)
  {
    const(char)* _language = language.toCString(No.Alloc);
    gtk_font_chooser_set_language(cast(GtkFontChooser*)this._cPtr, _language);
  }

  /**
      Sets the desired level of granularity for selecting fonts.
  
      Params:
        level = the desired level of granularity
  
      Deprecated: Use [gtk.font_dialog.FontDialog] and [gtk.font_dialog_button.FontDialogButton]
        instead
  */
  override void setLevel(gtk.types.FontChooserLevel level)
  {
    gtk_font_chooser_set_level(cast(GtkFontChooser*)this._cPtr, level);
  }

  /**
      Sets the text displayed in the preview area.
      
      The text is used to show how the selected font looks.
  
      Params:
        text = the text to display in the preview area
  
      Deprecated: Use [gtk.font_dialog.FontDialog] and [gtk.font_dialog_button.FontDialogButton]
        instead
  */
  override void setPreviewText(string text)
  {
    const(char)* _text = text.toCString(No.Alloc);
    gtk_font_chooser_set_preview_text(cast(GtkFontChooser*)this._cPtr, _text);
  }

  /**
      Shows or hides the editable preview entry.
  
      Params:
        showPreviewEntry = whether to show the editable preview entry or not
  
      Deprecated: Use [gtk.font_dialog.FontDialog] and [gtk.font_dialog_button.FontDialogButton]
        instead
  */
  override void setShowPreviewEntry(bool showPreviewEntry)
  {
    gtk_font_chooser_set_show_preview_entry(cast(GtkFontChooser*)this._cPtr, showPreviewEntry);
  }

  /**
      Connect to `FontActivated` signal.
  
      Emitted when a font is activated.
        
        This usually happens when the user double clicks an item,
        or an item is selected and the user presses one of the keys
        Space, Shift+Space, Return or Enter.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(string fontname, gtk.font_chooser.FontChooser fontChooser))
  
          `fontname` the font name (optional)
  
          `fontChooser` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: Use [gtk.font_dialog.FontDialog] and [gtk.font_dialog_button.FontDialogButton] instead
  */
  ulong connectFontActivated(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.font_chooser.FontChooser)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("font-activated", closure, after);
  }
}
