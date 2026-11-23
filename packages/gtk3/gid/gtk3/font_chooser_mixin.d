/// Module for [FontChooser] interface mixin
module gid.gtk3.font_chooser_mixin;

public import gid.core.basictypes;
public import gid.gtk3.font_chooser_iface_proxy;
public import gid.core.utils;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.dclosure;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gtk3.c.functions;
public import gid.gtk3.c.types;
public import gid.gtk3.types;
public import gid.pango1.font_description;
public import gid.pango1.font_face;
public import gid.pango1.font_family;
public import gid.pango1.font_map;

/**
    #GtkFontChooser is an interface that can be implemented by widgets
    displaying the list of fonts. In GTK+, the main objects
    that implement this interface are #GtkFontChooserWidget,
    #GtkFontChooserDialog and #GtkFontButton. The GtkFontChooser interface
    has been introducted in GTK+ 3.2.
*/
template FontChooserT()
{

  /**
      Get `font` property.
      Returns: The font description as a string, e.g. "Sans Italic 12".
  */
  @property string font() nothrow
  {
    return getFont();
  }

  /**
      Set `font` property.
      Params:
        propval = The font description as a string, e.g. "Sans Italic 12".
  */
  @property void font(string propval) nothrow
  {
    setFont(propval);
  }

  /**
      Get `fontDesc` property.
      Returns: The font description as a #PangoFontDescription.
  */
  @property gid.pango1.font_description.FontDescription fontDesc() nothrow
  {
    return getFontDesc();
  }

  /**
      Set `fontDesc` property.
      Params:
        propval = The font description as a #PangoFontDescription.
  */
  @property void fontDesc(gid.pango1.font_description.FontDescription propval) nothrow
  {
    setFontDesc(propval);
  }

  /**
      Get `fontFeatures` property.
      Returns: The selected font features, in a format that is compatible with
        CSS and with Pango attributes.
  */
  @property string fontFeatures() nothrow
  {
    return getFontFeatures();
  }

  /**
      Get `language` property.
      Returns: The language for which the #GtkFontChooser:font-features were
        selected, in a format that is compatible with CSS and with Pango
        attributes.
  */
  @property string language() nothrow
  {
    return getLanguage();
  }

  /**
      Set `language` property.
      Params:
        propval = The language for which the #GtkFontChooser:font-features were
          selected, in a format that is compatible with CSS and with Pango
          attributes.
  */
  @property void language(string propval) nothrow
  {
    setLanguage(propval);
  }

  /**
      Get `level` property.
      Returns: The level of granularity to offer for selecting fonts.
  */
  @property gid.gtk3.types.FontChooserLevel level() nothrow
  {
    return getLevel();
  }

  /**
      Set `level` property.
      Params:
        propval = The level of granularity to offer for selecting fonts.
  */
  @property void level(gid.gtk3.types.FontChooserLevel propval) nothrow
  {
    setLevel(propval);
  }

  /**
      Get `previewText` property.
      Returns: The string with which to preview the font.
  */
  @property string previewText() nothrow
  {
    return getPreviewText();
  }

  /**
      Set `previewText` property.
      Params:
        propval = The string with which to preview the font.
  */
  @property void previewText(string propval) nothrow
  {
    setPreviewText(propval);
  }

  /**
      Get `showPreviewEntry` property.
      Returns: Whether to show an entry to change the preview text.
  */
  @property bool showPreviewEntry() nothrow
  {
    return getShowPreviewEntry();
  }

  /**
      Set `showPreviewEntry` property.
      Params:
        propval = Whether to show an entry to change the preview text.
  */
  @property void showPreviewEntry(bool propval) nothrow
  {
    setShowPreviewEntry(propval);
  }

  /** */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncFontActivated(string fontname)
  {
    auto _klass = cast(GtkFontChooserIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.font_chooser.FontChooser._getGType);
    if (!_klass || !_klass.fontActivated)
      return;

    const(char)* _fontname = fontname.toCString!(No.Malloc, No.Nullable);
    _klass.fontActivated(cast(GtkFontChooser*)this._cPtr, _fontname);
  }

  /**
      Gets the #PangoFontFace representing the selected font group
      details (i.e. family, slant, weight, width, etc).
      
      If the selected font is not installed, returns null.
      Returns: A #PangoFontFace representing the
            selected font group details, or null. The returned object is owned by
            fontchooser and must not be modified or freed.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetFontFace`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.pango1.font_face.FontFace vfuncGetFontFace()
  {
    auto _klass = cast(GtkFontChooserIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.font_chooser.FontChooser._getGType);
    if (!_klass || !_klass.getFontFace)
      return typeof(return).init;

    PangoFontFace* _cretval;
    _cretval = _klass.getFontFace(cast(GtkFontChooser*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.font_face.FontFace)(cast(PangoFontFace*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the #PangoFontFamily representing the selected font family.
      Font families are a collection of font faces.
      
      If the selected font is not installed, returns null.
      Returns: A #PangoFontFamily representing the
            selected font family, or null. The returned object is owned by fontchooser
            and must not be modified or freed.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetFontFamily`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.pango1.font_family.FontFamily vfuncGetFontFamily()
  {
    auto _klass = cast(GtkFontChooserIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.font_chooser.FontChooser._getGType);
    if (!_klass || !_klass.getFontFamily)
      return typeof(return).init;

    PangoFontFamily* _cretval;
    _cretval = _klass.getFontFamily(cast(GtkFontChooser*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.font_family.FontFamily)(cast(PangoFontFamily*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the custom font map of this font chooser widget,
      or null if it does not have one.
      Returns: a #PangoFontMap, or null
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetFontMap`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.pango1.font_map.FontMap vfuncGetFontMap()
  {
    auto _klass = cast(GtkFontChooserIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.font_chooser.FontChooser._getGType);
    if (!_klass || !_klass.getFontMap)
      return typeof(return).init;

    PangoFontMap* _cretval;
    _cretval = _klass.getFontMap(cast(GtkFontChooser*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.font_map.FontMap)(cast(PangoFontMap*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      The selected font size.
      Returns: A n integer representing the selected font size,
            or -1 if no font size is selected.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetFontSize`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected int vfuncGetFontSize()
  {
    auto _klass = cast(GtkFontChooserIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.font_chooser.FontChooser._getGType);
    if (!_klass || !_klass.getFontSize)
      return typeof(return).init;

    int _retval;
    _retval = _klass.getFontSize(cast(GtkFontChooser*)this._cPtr);
    return _retval;
  }

  /**
      Adds a filter function that decides which fonts to display
      in the font chooser.
  
      Params:
        filter = a #GtkFontFilterFunc, or null
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetFilterFunc`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'filter' of kind 'Callback' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncSetFilterFunc(gid.gtk3.types.FontFilterFunc filter = null)
  {
    auto _klass = cast(GtkFontChooserIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.font_chooser.FontChooser._getGType);
    if (!_klass || !_klass.setFilterFunc)
      return;

    extern(C) gboolean _filterCallback(const(PangoFontFamily)* family, const(PangoFontFace)* face, void* data) nothrow
    {
      gidAttachThread();
      bool _dretval;
      auto _dlg = cast(gid.gtk3.types.FontFilterFunc*)data;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.font_family.FontFamily)(cast(void*)family, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.font_face.FontFace)(cast(void*)face, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.types.FontFilterFunc");
      }
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _filterCB = filter ? &_filterCallback : null;
    auto _filter = filter ? freezeDelegate(cast(void*)&filter) : null;
    GDestroyNotify _filterDestroyCB = filter ? &thawDelegate : null;
    _klass.setFilterFunc(cast(GtkFontChooser*)this._cPtr, _filterCB, _filter, _filterDestroyCB);
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
      
      Note that other GTK+ widgets will only be able to use the application-specific
      font if it is present in the font map they use:
      
      ```
      context = gtk_widget_get_pango_context (label);
      pango_context_set_font_map (context, fontmap);
      ```
  
      Params:
        fontmap = a #PangoFontMap
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetFontMap`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncSetFontMap(gid.pango1.font_map.FontMap fontmap = null)
  {
    auto _klass = cast(GtkFontChooserIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.font_chooser.FontChooser._getGType);
    if (!_klass || !_klass.setFontMap)
      return;

    _klass.setFontMap(cast(GtkFontChooser*)this._cPtr, fontmap ? cast(PangoFontMap*)fontmap._cPtr(No.Dup) : null);
  }

  /**
      Gets the currently-selected font name.
      
      Note that this can be a different string than what you set with
      [gid.gtk4.font_chooser.FontChooser.setFont], as the font chooser widget may
      normalize font names and thus return a string with a different
      structure. For example, “Helvetica Italic Bold 12” could be
      normalized to “Helvetica Bold Italic 12”.
      
      Use [gid.pango1.font_description.FontDescription.equal] if you want to compare two
      font descriptions.
      Returns: A string with the name
            of the current font, or null if  no font is selected. You must
            free this string with [gid.glib2.global.gfree].
  */
  override string getFont() nothrow
  {
    char* _cretval;
    _cretval = gtk_font_chooser_get_font(cast(GtkFontChooser*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the currently-selected font.
      
      Note that this can be a different string than what you set with
      [gid.gtk4.font_chooser.FontChooser.setFont], as the font chooser widget may
      normalize font names and thus return a string with a different
      structure. For example, “Helvetica Italic Bold 12” could be
      normalized to “Helvetica Bold Italic 12”.
      
      Use [gid.pango1.font_description.FontDescription.equal] if you want to compare two
      font descriptions.
      Returns: A #PangoFontDescription for the
            current font, or null if  no font is selected.
  */
  override gid.pango1.font_description.FontDescription getFontDesc() nothrow
  {
    PangoFontDescription* _cretval;
    _cretval = gtk_font_chooser_get_font_desc(cast(GtkFontChooser*)this._cPtr);
    auto _retval = _cretval ? new gid.pango1.font_description.FontDescription(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the #PangoFontFace representing the selected font group
      details (i.e. family, slant, weight, width, etc).
      
      If the selected font is not installed, returns null.
      Returns: A #PangoFontFace representing the
            selected font group details, or null. The returned object is owned by
            fontchooser and must not be modified or freed.
  */
  override gid.pango1.font_face.FontFace getFontFace() nothrow
  {
    PangoFontFace* _cretval;
    _cretval = gtk_font_chooser_get_font_face(cast(GtkFontChooser*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.font_face.FontFace)(cast(PangoFontFace*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the #PangoFontFamily representing the selected font family.
      Font families are a collection of font faces.
      
      If the selected font is not installed, returns null.
      Returns: A #PangoFontFamily representing the
            selected font family, or null. The returned object is owned by fontchooser
            and must not be modified or freed.
  */
  override gid.pango1.font_family.FontFamily getFontFamily() nothrow
  {
    PangoFontFamily* _cretval;
    _cretval = gtk_font_chooser_get_font_family(cast(GtkFontChooser*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.font_family.FontFamily)(cast(PangoFontFamily*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the currently-selected font features.
      Returns: the currently selected font features
  */
  override string getFontFeatures() nothrow
  {
    char* _cretval;
    _cretval = gtk_font_chooser_get_font_features(cast(GtkFontChooser*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the custom font map of this font chooser widget,
      or null if it does not have one.
      Returns: a #PangoFontMap, or null
  */
  override gid.pango1.font_map.FontMap getFontMap() nothrow
  {
    PangoFontMap* _cretval;
    _cretval = gtk_font_chooser_get_font_map(cast(GtkFontChooser*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.font_map.FontMap)(cast(PangoFontMap*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      The selected font size.
      Returns: A n integer representing the selected font size,
            or -1 if no font size is selected.
  */
  override int getFontSize() nothrow
  {
    int _retval;
    _retval = gtk_font_chooser_get_font_size(cast(GtkFontChooser*)this._cPtr);
    return _retval;
  }

  /**
      Gets the language that is used for font features.
      Returns: the currently selected language
  */
  override string getLanguage() nothrow
  {
    char* _cretval;
    _cretval = gtk_font_chooser_get_language(cast(GtkFontChooser*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Returns the current level of granularity for selecting fonts.
      Returns: the current granularity level
  */
  override gid.gtk3.types.FontChooserLevel getLevel() nothrow
  {
    GtkFontChooserLevel _cretval;
    _cretval = gtk_font_chooser_get_level(cast(GtkFontChooser*)this._cPtr);
    gid.gtk3.types.FontChooserLevel _retval = cast(gid.gtk3.types.FontChooserLevel)_cretval;
    return _retval;
  }

  /**
      Gets the text displayed in the preview area.
      Returns: the text displayed in the
            preview area
  */
  override string getPreviewText() nothrow
  {
    char* _cretval;
    _cretval = gtk_font_chooser_get_preview_text(cast(GtkFontChooser*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Returns whether the preview entry is shown or not.
      Returns: true if the preview entry is shown
            or false if it is hidden.
  */
  override bool getShowPreviewEntry() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_font_chooser_get_show_preview_entry(cast(GtkFontChooser*)this._cPtr);
    return _retval;
  }

  /**
      Adds a filter function that decides which fonts to display
      in the font chooser.
  
      Params:
        filter = a #GtkFontFilterFunc, or null
  */
  override void setFilterFunc(gid.gtk3.types.FontFilterFunc filter = null) nothrow
  {
    extern(C) gboolean _filterCallback(const(PangoFontFamily)* family, const(PangoFontFace)* face, void* data) nothrow
    {
      gidAttachThread();
      bool _dretval;
      auto _dlg = cast(gid.gtk3.types.FontFilterFunc*)data;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.font_family.FontFamily)(cast(void*)family, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.font_face.FontFace)(cast(void*)face, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.types.FontFilterFunc");
      }
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
  */
  override void setFont(string fontname) nothrow
  {
    const(char)* _fontname = fontname.toCString!(No.Malloc, No.Nullable);
    gtk_font_chooser_set_font(cast(GtkFontChooser*)this._cPtr, _fontname);
  }

  /**
      Sets the currently-selected font from font_desc.
  
      Params:
        fontDesc = a #PangoFontDescription
  */
  override void setFontDesc(gid.pango1.font_description.FontDescription fontDesc) nothrow
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
      
      Note that other GTK+ widgets will only be able to use the application-specific
      font if it is present in the font map they use:
      
      ```
      context = gtk_widget_get_pango_context (label);
      pango_context_set_font_map (context, fontmap);
      ```
  
      Params:
        fontmap = a #PangoFontMap
  */
  override void setFontMap(gid.pango1.font_map.FontMap fontmap = null) nothrow
  {
    gtk_font_chooser_set_font_map(cast(GtkFontChooser*)this._cPtr, fontmap ? cast(PangoFontMap*)fontmap._cPtr(No.Dup) : null);
  }

  /**
      Sets the language to use for font features.
  
      Params:
        language = a language
  */
  override void setLanguage(string language) nothrow
  {
    const(char)* _language = language.toCString!(No.Malloc, No.Nullable);
    gtk_font_chooser_set_language(cast(GtkFontChooser*)this._cPtr, _language);
  }

  /**
      Sets the desired level of granularity for selecting fonts.
  
      Params:
        level = the desired level of granularity
  */
  override void setLevel(gid.gtk3.types.FontChooserLevel level) nothrow
  {
    gtk_font_chooser_set_level(cast(GtkFontChooser*)this._cPtr, level);
  }

  /**
      Sets the text displayed in the preview area.
      The text is used to show how the selected font looks.
  
      Params:
        text = the text to display in the preview area
  */
  override void setPreviewText(string text) nothrow
  {
    const(char)* _text = text.toCString!(No.Malloc, No.Nullable);
    gtk_font_chooser_set_preview_text(cast(GtkFontChooser*)this._cPtr, _text);
  }

  /**
      Shows or hides the editable preview entry.
  
      Params:
        showPreviewEntry = whether to show the editable preview entry or not
  */
  override void setShowPreviewEntry(bool showPreviewEntry) nothrow
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
  
          `void callback(string fontname, gid.gtk3.font_chooser.FontChooser fontChooser)`
  
          `fontname` the font name (optional)
  
          `fontChooser` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectFontActivated(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.font_chooser.FontChooser)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.font_chooser.FontChooser.fontActivated");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("font-activated", closure, after);
  }

  /// True if the D class T overrides any vfunc method of gid.gtk3.font_chooser.FontChooser (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gtk3_font_chooser_FontChooser(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncFontActivated", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetFontFace", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetFontFamily", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetFontMap", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetFontSize", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetFilterFunc", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetFontMap", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gtk3.font_chooser.FontChooser vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gtk3_font_chooser_FontChooser(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncFontActivated", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_font_chooser_FontChooser(iface, "font_activated");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetFontFace", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_font_chooser_FontChooser(iface, "get_font_face");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetFontFamily", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_font_chooser_FontChooser(iface, "get_font_family");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetFontMap", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_font_chooser_FontChooser(iface, "get_font_map");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetFontSize", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_font_chooser_FontChooser(iface, "get_font_size");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetFilterFunc", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gtk3.font_chooser.FontChooser.vfuncSetFilterFunc is not supported: parameter 'filter' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetFontMap", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_font_chooser_FontChooser(iface, "set_font_map");
  }

  private static void _installIfaceVfunc_gid_gtk3_font_chooser_FontChooser(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GtkFontChooserIface*)iface;

    switch (vfunc)
    {
      case "font_activated":
      {
        static extern(C) void _vfuncFontActivatedTramp(GtkFontChooser* chooser, const(char)* fontname) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)chooser);
          if (!_obj)
          {
            auto _klass = cast(GtkFontChooserIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)chooser), gid.gtk3.font_chooser.FontChooser._getGType);
            if (_klass && _klass.fontActivated)
              return (cast(typeof(&_vfuncFontActivatedTramp))_klass.fontActivated)(chooser, fontname);
            return;
          }

          string _fontname = fontname.fromCString!(No.Free);

          try
          {
            _obj.vfuncFontActivated(_fontname);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.font_chooser.FontChooser.vfuncFontActivated");
          }
        }

        _klass.fontActivated = cast(typeof(_klass.fontActivated))&_vfuncFontActivatedTramp;
        break;
      }
      case "get_font_face":
      {
        static extern(C) PangoFontFace* _vfuncGetFontFaceTramp(GtkFontChooser* fontchooser) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)fontchooser);
          if (!_obj)
          {
            auto _klass = cast(GtkFontChooserIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)fontchooser), gid.gtk3.font_chooser.FontChooser._getGType);
            if (_klass && _klass.getFontFace)
              return (cast(typeof(&_vfuncGetFontFaceTramp))_klass.getFontFace)(fontchooser);
            return typeof(return).init;
          }

          gid.pango1.font_face.FontFace _dretval;

          try
          {
            _dretval = _obj.vfuncGetFontFace();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.font_chooser.FontChooser.vfuncGetFontFace");
          }
          auto _retval = _dretval ? cast(PangoFontFace*)_dretval._cPtr(No.Dup) : null;

          return _retval;
        }

        _klass.getFontFace = cast(typeof(_klass.getFontFace))&_vfuncGetFontFaceTramp;
        break;
      }
      case "get_font_family":
      {
        static extern(C) PangoFontFamily* _vfuncGetFontFamilyTramp(GtkFontChooser* fontchooser) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)fontchooser);
          if (!_obj)
          {
            auto _klass = cast(GtkFontChooserIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)fontchooser), gid.gtk3.font_chooser.FontChooser._getGType);
            if (_klass && _klass.getFontFamily)
              return (cast(typeof(&_vfuncGetFontFamilyTramp))_klass.getFontFamily)(fontchooser);
            return typeof(return).init;
          }

          gid.pango1.font_family.FontFamily _dretval;

          try
          {
            _dretval = _obj.vfuncGetFontFamily();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.font_chooser.FontChooser.vfuncGetFontFamily");
          }
          auto _retval = _dretval ? cast(PangoFontFamily*)_dretval._cPtr(No.Dup) : null;

          return _retval;
        }

        _klass.getFontFamily = cast(typeof(_klass.getFontFamily))&_vfuncGetFontFamilyTramp;
        break;
      }
      case "get_font_map":
      {
        static extern(C) PangoFontMap* _vfuncGetFontMapTramp(GtkFontChooser* fontchooser) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)fontchooser);
          if (!_obj)
          {
            auto _klass = cast(GtkFontChooserIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)fontchooser), gid.gtk3.font_chooser.FontChooser._getGType);
            if (_klass && _klass.getFontMap)
              return (cast(typeof(&_vfuncGetFontMapTramp))_klass.getFontMap)(fontchooser);
            return typeof(return).init;
          }

          gid.pango1.font_map.FontMap _dretval;

          try
          {
            _dretval = _obj.vfuncGetFontMap();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.font_chooser.FontChooser.vfuncGetFontMap");
          }
          auto _retval = _dretval ? cast(PangoFontMap*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getFontMap = cast(typeof(_klass.getFontMap))&_vfuncGetFontMapTramp;
        break;
      }
      case "get_font_size":
      {
        static extern(C) int _vfuncGetFontSizeTramp(GtkFontChooser* fontchooser) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)fontchooser);
          if (!_obj)
          {
            auto _klass = cast(GtkFontChooserIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)fontchooser), gid.gtk3.font_chooser.FontChooser._getGType);
            if (_klass && _klass.getFontSize)
              return (cast(typeof(&_vfuncGetFontSizeTramp))_klass.getFontSize)(fontchooser);
            return typeof(return).init;
          }

          int _retval;

          try
          {
            _retval = _obj.vfuncGetFontSize();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.font_chooser.FontChooser.vfuncGetFontSize");
          }
          return _retval;
        }

        _klass.getFontSize = cast(typeof(_klass.getFontSize))&_vfuncGetFontSizeTramp;
        break;
      }
      case "set_font_map":
      {
        static extern(C) void _vfuncSetFontMapTramp(GtkFontChooser* fontchooser, PangoFontMap* fontmap) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)fontchooser);
          if (!_obj)
          {
            auto _klass = cast(GtkFontChooserIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)fontchooser), gid.gtk3.font_chooser.FontChooser._getGType);
            if (_klass && _klass.setFontMap)
              return (cast(typeof(&_vfuncSetFontMapTramp))_klass.setFontMap)(fontchooser, fontmap);
            return;
          }

          try
          {
            _obj.vfuncSetFontMap(gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.font_map.FontMap)(cast(void*)fontmap, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.font_chooser.FontChooser.vfuncSetFontMap");
          }
        }

        _klass.setFontMap = cast(typeof(_klass.setFontMap))&_vfuncSetFontMapTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.font_chooser.FontChooser]
template FontChooserGidBuilderT()
{

  /**
      Set `font` property.
      Params:
        propval = The font description as a string, e.g. "Sans Italic 12".
      Returns: Builder instance for fluent chaining
  */
  T font(string propval) nothrow
  {
    return setProperty("font", propval);
  }

  /**
      Set `fontDesc` property.
      Params:
        propval = The font description as a #PangoFontDescription.
      Returns: Builder instance for fluent chaining
  */
  T fontDesc(gid.pango1.font_description.FontDescription propval) nothrow
  {
    return setProperty("font-desc", propval);
  }

  /**
      Set `language` property.
      Params:
        propval = The language for which the #GtkFontChooser:font-features were
          selected, in a format that is compatible with CSS and with Pango
          attributes.
      Returns: Builder instance for fluent chaining
  */
  T language(string propval) nothrow
  {
    return setProperty("language", propval);
  }

  /**
      Set `level` property.
      Params:
        propval = The level of granularity to offer for selecting fonts.
      Returns: Builder instance for fluent chaining
  */
  T level(gid.gtk3.types.FontChooserLevel propval) nothrow
  {
    return setProperty("level", propval);
  }

  /**
      Set `previewText` property.
      Params:
        propval = The string with which to preview the font.
      Returns: Builder instance for fluent chaining
  */
  T previewText(string propval) nothrow
  {
    return setProperty("preview-text", propval);
  }

  /**
      Set `showPreviewEntry` property.
      Params:
        propval = Whether to show an entry to change the preview text.
      Returns: Builder instance for fluent chaining
  */
  T showPreviewEntry(bool propval) nothrow
  {
    return setProperty("show-preview-entry", propval);
  }
}
