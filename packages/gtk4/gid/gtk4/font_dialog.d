/// Module for [FontDialog] class
module gid.gtk4.font_dialog;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.async_result;
import gid.gio2.cancellable;
import gid.gio2.types;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.filter;
import gid.gtk4.types;
import gid.gtk4.window;
import gid.pango1.font_description;
import gid.pango1.font_face;
import gid.pango1.font_family;
import gid.pango1.font_map;
import gid.pango1.language;

/**
    Asynchronous API to present a font chooser dialog.
    
    [gid.gtk4.font_dialog.FontDialog] collects the arguments that are needed to present
    the dialog to the user, such as a title for the dialog and whether
    it should be modal.
    
    The dialog is shown with the [gid.gtk4.font_dialog.FontDialog.chooseFont]
    function or its variants.
    
    See [gid.gtk4.font_dialog_button.FontDialogButton] for a convenient control
    that uses [gid.gtk4.font_dialog.FontDialog] and presents the results.
*/
class FontDialog : gid.gobject2.object.ObjectWrap
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
    return cast(void function())gtk_font_dialog_get_type != &gidSymbolNotFound ? gtk_font_dialog_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkFontDialog";
  }

  /** Returns `this`, for use in `with` statements. */
  override FontDialog self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.font_dialog.FontDialog]
      Returns: New builder object
  */
  static FontDialogGidBuilder builder() nothrow
  {
    return new FontDialogGidBuilder;
  }

  /**
      Get `filter` property.
      Returns: A filter to restrict what fonts are shown in the font chooser dialog.
  */
  @property gid.gtk4.filter.Filter filter() nothrow
  {
    return getFilter();
  }

  /**
      Set `filter` property.
      Params:
        propval = A filter to restrict what fonts are shown in the font chooser dialog.
  */
  @property void filter(gid.gtk4.filter.Filter propval) nothrow
  {
    setFilter(propval);
  }

  /**
      Get `fontMap` property.
      Returns: A custom font map to select fonts from.
        
        A custom font map can be used to present application-specific
        fonts instead of or in addition to the normal system fonts.
  */
  @property gid.pango1.font_map.FontMap fontMap() nothrow
  {
    return getFontMap();
  }

  /**
      Set `fontMap` property.
      Params:
        propval = A custom font map to select fonts from.
          
          A custom font map can be used to present application-specific
          fonts instead of or in addition to the normal system fonts.
  */
  @property void fontMap(gid.pango1.font_map.FontMap propval) nothrow
  {
    setFontMap(propval);
  }

  /**
      Get `language` property.
      Returns: The language for which the font features are selected.
  */
  @property gid.pango1.language.Language language() nothrow
  {
    return getLanguage();
  }

  /**
      Set `language` property.
      Params:
        propval = The language for which the font features are selected.
  */
  @property void language(gid.pango1.language.Language propval) nothrow
  {
    setLanguage(propval);
  }

  /**
      Get `modal` property.
      Returns: Whether the font chooser dialog is modal.
  */
  @property bool modal() nothrow
  {
    return getModal();
  }

  /**
      Set `modal` property.
      Params:
        propval = Whether the font chooser dialog is modal.
  */
  @property void modal(bool propval) nothrow
  {
    setModal(propval);
  }

  /**
      Get `title` property.
      Returns: A title that may be shown on the font chooser
        dialog that is presented by [gid.gtk4.font_dialog.FontDialog.chooseFont].
  */
  @property string title() nothrow
  {
    return getTitle();
  }

  /**
      Set `title` property.
      Params:
        propval = A title that may be shown on the font chooser
          dialog that is presented by [gid.gtk4.font_dialog.FontDialog.chooseFont].
  */
  @property void title(string propval) nothrow
  {
    setTitle(propval);
  }

  /**
      Creates a new [gid.gtk4.font_dialog.FontDialog] object.
      Returns: the new [gid.gtk4.font_dialog.FontDialog]
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkFontDialog* _cretval;
      _cretval = gtk_font_dialog_new();
      this(_cretval, Yes.Take);
    }
  }

  /**
      Presents a font chooser dialog to the user.
      
      The font chooser dialog will be set up for selecting a font face.
      
      A font face represents a font family and style, but no specific font size.
  
      Params:
        parent = the parent window
        initialValue = the initial value
        cancellable = a cancellable to cancel the operation
        callback = a callback to call when the
            operation is complete
  */
  void chooseFace(gid.gtk4.window.Window parent = null, gid.pango1.font_face.FontFace initialValue = null, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_font_dialog_choose_face(cast(GtkFontDialog*)this._cPtr, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null, initialValue ? cast(PangoFontFace*)initialValue._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes the [gid.gtk4.font_dialog.FontDialog.chooseFace] call.
      
      Note that this function returns a `errorGtk.DialogError.DISMISSED`
      error if the user cancels the dialog.
  
      Params:
        result = the result
      Returns: the selected [gid.pango1.font_face.FontFace]
      Throws: [ErrorWrap]
  */
  gid.pango1.font_face.FontFace chooseFaceFinish(gid.gio2.async_result.AsyncResult result)
  {
    PangoFontFace* _cretval;
    GError *_err;
    _cretval = gtk_font_dialog_choose_face_finish(cast(GtkFontDialog*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.font_face.FontFace)(cast(PangoFontFace*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Presents a font chooser dialog to the user.
      
      The font chooser dialog will be set up for selecting a font family.
  
      Params:
        parent = the parent window
        initialValue = the initial value
        cancellable = a cancellable to cancel the operation
        callback = a callback to call when the
            operation is complete
  */
  void chooseFamily(gid.gtk4.window.Window parent = null, gid.pango1.font_family.FontFamily initialValue = null, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_font_dialog_choose_family(cast(GtkFontDialog*)this._cPtr, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null, initialValue ? cast(PangoFontFamily*)initialValue._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes the [gid.gtk4.font_dialog.FontDialog.chooseFamily] call.
      
      Note that this function returns a `errorGtk.DialogError.DISMISSED`
      error if the user cancels the dialog.
  
      Params:
        result = the result
      Returns: the selected [gid.pango1.font_family.FontFamily]
      Throws: [ErrorWrap]
  */
  gid.pango1.font_family.FontFamily chooseFamilyFinish(gid.gio2.async_result.AsyncResult result)
  {
    PangoFontFamily* _cretval;
    GError *_err;
    _cretval = gtk_font_dialog_choose_family_finish(cast(GtkFontDialog*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.font_family.FontFamily)(cast(PangoFontFamily*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Presents a font chooser dialog to the user.
      
      The font chooser dialog will be set up for selecting a font.
      
      If you want to let the user select font features as well,
      use [gid.gtk4.font_dialog.FontDialog.chooseFontAndFeatures] instead.
  
      Params:
        parent = the parent window
        initialValue = the font to select initially
        cancellable = a cancellable to cancel the operation
        callback = a callback to call when the
            operation is complete
  */
  void chooseFont(gid.gtk4.window.Window parent = null, gid.pango1.font_description.FontDescription initialValue = null, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_font_dialog_choose_font(cast(GtkFontDialog*)this._cPtr, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null, initialValue ? cast(PangoFontDescription*)initialValue._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Presents a font chooser dialog to the user.
      
      The font chooser dialog will be set up for selecting a font
      and specify features for the selected font.
      
      Font features affect how the font is rendered, for example
      enabling glyph variants or ligatures.
  
      Params:
        parent = the parent window
        initialValue = the font to select initially
        cancellable = a cancellable to cancel the operation
        callback = a callback to call when the
            operation is complete
  */
  void chooseFontAndFeatures(gid.gtk4.window.Window parent = null, gid.pango1.font_description.FontDescription initialValue = null, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_font_dialog_choose_font_and_features(cast(GtkFontDialog*)this._cPtr, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null, initialValue ? cast(PangoFontDescription*)initialValue._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes the [gid.gtk4.font_dialog.FontDialog.chooseFontAndFeatures] call.
      
      The selected font and features are returned in font_desc and
      font_features.
      
      Note that this function returns a `errorGtk.DialogError.DISMISSED`
      error if the user cancels the dialog.
  
      Params:
        result = the result
        fontDesc = return location for font description
        fontFeatures = return location for font features
        language = return location for the language
      Returns: true if a font was selected
      Throws: [ErrorWrap]
  */
  bool chooseFontAndFeaturesFinish(gid.gio2.async_result.AsyncResult result, out gid.pango1.font_description.FontDescription fontDesc, out string fontFeatures, out gid.pango1.language.Language language)
  {
    bool _retval;
    PangoFontDescription* _fontDesc;
    char* _fontFeatures;
    PangoLanguage* _language;
    GError *_err;
    _retval = cast(bool)gtk_font_dialog_choose_font_and_features_finish(cast(GtkFontDialog*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_fontDesc, &_fontFeatures, &_language, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    if (_fontDesc)
      fontDesc = new gid.pango1.font_description.FontDescription(cast(void*)_fontDesc, Yes.Take);
    fontFeatures = _fontFeatures.fromCString!(Yes.Free);
    if (_language)
      language = new gid.pango1.language.Language(cast(void*)_language, Yes.Take);
    return _retval;
  }

  /**
      Finishes the [gid.gtk4.font_dialog.FontDialog.chooseFont] call.
      
      Note that this function returns a `errorGtk.DialogError.DISMISSED`
      error if the user cancels the dialog.
  
      Params:
        result = the result
      Returns: a [gid.pango1.font_description.FontDescription] describing
          the selected font
      Throws: [ErrorWrap]
  */
  gid.pango1.font_description.FontDescription chooseFontFinish(gid.gio2.async_result.AsyncResult result)
  {
    PangoFontDescription* _cretval;
    GError *_err;
    _cretval = gtk_font_dialog_choose_font_finish(cast(GtkFontDialog*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = _cretval ? new gid.pango1.font_description.FontDescription(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns the filter that decides which fonts to display
      in the font chooser dialog.
      Returns: the filter
  */
  gid.gtk4.filter.Filter getFilter() nothrow
  {
    GtkFilter* _cretval;
    _cretval = gtk_font_dialog_get_filter(cast(GtkFontDialog*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.filter.Filter)(cast(GtkFilter*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the fontmap from which fonts are selected,
      or `NULL` for the default fontmap.
      Returns: the fontmap
  */
  gid.pango1.font_map.FontMap getFontMap() nothrow
  {
    PangoFontMap* _cretval;
    _cretval = gtk_font_dialog_get_font_map(cast(GtkFontDialog*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.font_map.FontMap)(cast(PangoFontMap*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the language for which font features are applied.
      Returns: the language for font features
  */
  gid.pango1.language.Language getLanguage() nothrow
  {
    PangoLanguage* _cretval;
    _cretval = gtk_font_dialog_get_language(cast(GtkFontDialog*)this._cPtr);
    auto _retval = _cretval ? new gid.pango1.language.Language(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns whether the font chooser dialog blocks interaction
      with the parent window while it is presented.
      Returns: true if the font chooser dialog is modal
  */
  bool getModal() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_font_dialog_get_modal(cast(GtkFontDialog*)this._cPtr);
    return _retval;
  }

  /**
      Returns the title that will be shown on the font chooser dialog.
      Returns: the title
  */
  string getTitle() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_font_dialog_get_title(cast(GtkFontDialog*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Adds a filter that decides which fonts to display
      in the font chooser dialog.
      
      The filter must be able to handle both [gid.pango1.font_family.FontFamily]
      and [gid.pango1.font_face.FontFace] objects.
  
      Params:
        filter = the filter
  */
  void setFilter(gid.gtk4.filter.Filter filter = null) nothrow
  {
    gtk_font_dialog_set_filter(cast(GtkFontDialog*)this._cPtr, filter ? cast(GtkFilter*)filter._cPtr(No.Dup) : null);
  }

  /**
      Sets the fontmap from which fonts are selected.
      
      If fontmap is `NULL`, the default fontmap is used.
  
      Params:
        fontmap = the fontmap
  */
  void setFontMap(gid.pango1.font_map.FontMap fontmap = null) nothrow
  {
    gtk_font_dialog_set_font_map(cast(GtkFontDialog*)this._cPtr, fontmap ? cast(PangoFontMap*)fontmap._cPtr(No.Dup) : null);
  }

  /**
      Sets the language for which font features are applied.
  
      Params:
        language = the language for font features
  */
  void setLanguage(gid.pango1.language.Language language) nothrow
  {
    gtk_font_dialog_set_language(cast(GtkFontDialog*)this._cPtr, language ? cast(PangoLanguage*)language._cPtr(No.Dup) : null);
  }

  /**
      Sets whether the font chooser dialog blocks interaction
      with the parent window while it is presented.
  
      Params:
        modal = the new value
  */
  void setModal(bool modal) nothrow
  {
    gtk_font_dialog_set_modal(cast(GtkFontDialog*)this._cPtr, modal);
  }

  /**
      Sets the title that will be shown on the font chooser dialog.
  
      Params:
        title = the new title
  */
  void setTitle(string title) nothrow
  {
    const(char)* _title = title.toCString!(No.Malloc, No.Nullable);
    gtk_font_dialog_set_title(cast(GtkFontDialog*)this._cPtr, _title);
  }
}

/// Fluent builder implementation template for [gid.gtk4.font_dialog.FontDialog]
class FontDialogGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `filter` property.
      Params:
        propval = A filter to restrict what fonts are shown in the font chooser dialog.
      Returns: Builder instance for fluent chaining
  */
  T filter(gid.gtk4.filter.Filter propval) nothrow
  {
    return setProperty("filter", propval);
  }

  /**
      Set `fontMap` property.
      Params:
        propval = A custom font map to select fonts from.
          
          A custom font map can be used to present application-specific
          fonts instead of or in addition to the normal system fonts.
      Returns: Builder instance for fluent chaining
  */
  T fontMap(gid.pango1.font_map.FontMap propval) nothrow
  {
    return setProperty("font-map", propval);
  }

  /**
      Set `language` property.
      Params:
        propval = The language for which the font features are selected.
      Returns: Builder instance for fluent chaining
  */
  T language(gid.pango1.language.Language propval) nothrow
  {
    return setProperty("language", propval);
  }

  /**
      Set `modal` property.
      Params:
        propval = Whether the font chooser dialog is modal.
      Returns: Builder instance for fluent chaining
  */
  T modal(bool propval) nothrow
  {
    return setProperty("modal", propval);
  }

  /**
      Set `title` property.
      Params:
        propval = A title that may be shown on the font chooser
          dialog that is presented by [gid.gtk4.font_dialog.FontDialog.chooseFont].
      Returns: Builder instance for fluent chaining
  */
  T title(string propval) nothrow
  {
    return setProperty("title", propval);
  }
}

/// Fluent builder for [gid.gtk4.font_dialog.FontDialog]
final class FontDialogGidBuilder : FontDialogGidBuilderImpl!FontDialogGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FontDialog build() nothrow
  {
    return new FontDialog(cast(void*)createGObject(FontDialog._getGType), Yes.Take);
  }
}
