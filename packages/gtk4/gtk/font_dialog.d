/// Module for [FontDialog] class
module gtk.font_dialog;

import gid.gid;
import gio.async_result;
import gio.cancellable;
import gio.types;
import glib.error;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.filter;
import gtk.types;
import gtk.window;
import pango.font_description;
import pango.font_face;
import pango.font_family;
import pango.font_map;
import pango.language;

/**
    A [gtk.font_dialog.FontDialog] object collects the arguments that
    are needed to present a font chooser dialog to the
    user, such as a title for the dialog and whether it
    should be modal.
    
    The dialog is shown with the [gtk.font_dialog.FontDialog.chooseFont]
    function or its variants. This API follows the GIO async pattern,
    and the result can be obtained by calling the corresponding
    finish function, such as [gtk.font_dialog.FontDialog.chooseFontFinish].
    
    See [gtk.font_dialog_button.FontDialogButton] for a convenient control
    that uses [gtk.font_dialog.FontDialog] and presents the results.
*/
class FontDialog : gobject.object.ObjectWrap
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
    return cast(void function())gtk_font_dialog_get_type != &gidSymbolNotFound ? gtk_font_dialog_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FontDialog self()
  {
    return this;
  }

  /**
      Get `filter` property.
      Returns: Sets a filter to restrict what fonts are shown
        in the font chooser dialog.
  */
  @property gtk.filter.Filter filter()
  {
    return getFilter();
  }

  /**
      Set `filter` property.
      Params:
        propval = Sets a filter to restrict what fonts are shown
          in the font chooser dialog.
  */
  @property void filter(gtk.filter.Filter propval)
  {
    return setFilter(propval);
  }

  /**
      Get `fontMap` property.
      Returns: Sets a custom font map to select fonts from.
        
        A custom font map can be used to present application-specific
        fonts instead of or in addition to the normal system fonts.
  */
  @property pango.font_map.FontMap fontMap()
  {
    return getFontMap();
  }

  /**
      Set `fontMap` property.
      Params:
        propval = Sets a custom font map to select fonts from.
          
          A custom font map can be used to present application-specific
          fonts instead of or in addition to the normal system fonts.
  */
  @property void fontMap(pango.font_map.FontMap propval)
  {
    return setFontMap(propval);
  }

  /**
      Get `language` property.
      Returns: The language for which the font features are selected.
  */
  @property pango.language.Language language()
  {
    return getLanguage();
  }

  /**
      Set `language` property.
      Params:
        propval = The language for which the font features are selected.
  */
  @property void language(pango.language.Language propval)
  {
    return setLanguage(propval);
  }

  /**
      Get `modal` property.
      Returns: Whether the font chooser dialog is modal.
  */
  @property bool modal()
  {
    return getModal();
  }

  /**
      Set `modal` property.
      Params:
        propval = Whether the font chooser dialog is modal.
  */
  @property void modal(bool propval)
  {
    return setModal(propval);
  }

  /**
      Get `title` property.
      Returns: A title that may be shown on the font chooser
        dialog that is presented by [gtk.font_dialog.FontDialog.chooseFont].
  */
  @property string title()
  {
    return getTitle();
  }

  /**
      Set `title` property.
      Params:
        propval = A title that may be shown on the font chooser
          dialog that is presented by [gtk.font_dialog.FontDialog.chooseFont].
  */
  @property void title(string propval)
  {
    return setTitle(propval);
  }

  /**
      Creates a new [gtk.font_dialog.FontDialog] object.
      Returns: the new [gtk.font_dialog.FontDialog]
  */
  this()
  {
    GtkFontDialog* _cretval;
    _cretval = gtk_font_dialog_new();
    this(_cretval, Yes.Take);
  }

  /**
      This function initiates a font selection operation by
      presenting a dialog to the user for selecting a font face
      (i.e. a font family and style, but not a specific font size).
      
      The callback will be called when the dialog is dismissed.
      It should call [gtk.font_dialog.FontDialog.chooseFaceFinish]
      to obtain the result.
  
      Params:
        parent = the parent [gtk.window.Window]
        initialValue = the initial value
        cancellable = a [gio.cancellable.Cancellable] to cancel the operation
        callback = a callback to call when the operation is complete
  */
  void chooseFace(gtk.window.Window parent = null, pango.font_face.FontFace initialValue = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_font_dialog_choose_face(cast(GtkFontDialog*)this._cPtr, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null, initialValue ? cast(PangoFontFace*)initialValue._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes the [gtk.font_dialog.FontDialog.chooseFace] call
      and returns the resulting font face.
  
      Params:
        result = a [gio.async_result.AsyncResult]
      Returns: the selected font face
      Throws: [ErrorWrap]
  */
  pango.font_face.FontFace chooseFaceFinish(gio.async_result.AsyncResult result)
  {
    PangoFontFace* _cretval;
    GError *_err;
    _cretval = gtk_font_dialog_choose_face_finish(cast(GtkFontDialog*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(pango.font_face.FontFace)(cast(PangoFontFace*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      This function initiates a font selection operation by
      presenting a dialog to the user for selecting a font family.
      
      The callback will be called when the dialog is dismissed.
      It should call [gtk.font_dialog.FontDialog.chooseFamilyFinish]
      to obtain the result.
  
      Params:
        parent = the parent [gtk.window.Window]
        initialValue = the initial value
        cancellable = a [gio.cancellable.Cancellable] to cancel the operation
        callback = a callback to call when the operation is complete
  */
  void chooseFamily(gtk.window.Window parent = null, pango.font_family.FontFamily initialValue = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_font_dialog_choose_family(cast(GtkFontDialog*)this._cPtr, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null, initialValue ? cast(PangoFontFamily*)initialValue._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes the [gtk.font_dialog.FontDialog.chooseFamily] call
      and returns the resulting family.
      
      This function never returns an error. If the operation is
      not finished successfully, the value passed as initial_value
      to [gtk.font_dialog.FontDialog.chooseFamily] is returned.
  
      Params:
        result = a [gio.async_result.AsyncResult]
      Returns: the selected family
      Throws: [ErrorWrap]
  */
  pango.font_family.FontFamily chooseFamilyFinish(gio.async_result.AsyncResult result)
  {
    PangoFontFamily* _cretval;
    GError *_err;
    _cretval = gtk_font_dialog_choose_family_finish(cast(GtkFontDialog*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(pango.font_family.FontFamily)(cast(PangoFontFamily*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      This function initiates a font selection operation by
      presenting a dialog to the user for selecting a font.
      
      The callback will be called when the dialog is dismissed.
      It should call [gtk.font_dialog.FontDialog.chooseFontFinish]
      to obtain the result.
      
      If you want to let the user select font features as well,
      use [gtk.font_dialog.FontDialog.chooseFontAndFeatures] instead.
  
      Params:
        parent = the parent [gtk.window.Window]
        initialValue = the font to select initially
        cancellable = a [gio.cancellable.Cancellable] to cancel the operation
        callback = a callback to call when the operation is complete
  */
  void chooseFont(gtk.window.Window parent = null, pango.font_description.FontDescription initialValue = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_font_dialog_choose_font(cast(GtkFontDialog*)this._cPtr, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null, initialValue ? cast(PangoFontDescription*)initialValue._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      This function initiates a font selection operation by
      presenting a dialog to the user for selecting a font and
      font features.
      
      Font features affect how the font is rendered, for example
      enabling glyph variants or ligatures.
      
      The callback will be called when the dialog is dismissed.
      It should call [gtk.font_dialog.FontDialog.chooseFontAndFeaturesFinish]
      to obtain the result.
  
      Params:
        parent = the parent [gtk.window.Window]
        initialValue = the font to select initially
        cancellable = a [gio.cancellable.Cancellable] to cancel the operation
        callback = a callback to call when the operation is complete
  */
  void chooseFontAndFeatures(gtk.window.Window parent = null, pango.font_description.FontDescription initialValue = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_font_dialog_choose_font_and_features(cast(GtkFontDialog*)this._cPtr, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null, initialValue ? cast(PangoFontDescription*)initialValue._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes the [gtk.font_dialog.FontDialog.chooseFontAndFeatures]
      call and returns the resulting font description and font features.
  
      Params:
        result = a [gio.async_result.AsyncResult]
        fontDesc = return location for font description
        fontFeatures = return location for font features
        language = return location for the language
      Returns: `TRUE` if a font was selected. Otherwise `FALSE` is returned
          and error is set
      Throws: [ErrorWrap]
  */
  bool chooseFontAndFeaturesFinish(gio.async_result.AsyncResult result, out pango.font_description.FontDescription fontDesc, out string fontFeatures, out pango.language.Language language)
  {
    bool _retval;
    PangoFontDescription* _fontDesc;
    char* _fontFeatures;
    PangoLanguage* _language;
    GError *_err;
    _retval = cast(bool)gtk_font_dialog_choose_font_and_features_finish(cast(GtkFontDialog*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_fontDesc, &_fontFeatures, &_language, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    fontDesc = new pango.font_description.FontDescription(cast(void*)_fontDesc, Yes.Take);
    fontFeatures = _fontFeatures.fromCString(Yes.Free);
    language = new pango.language.Language(cast(void*)_language, Yes.Take);
    return _retval;
  }

  /**
      Finishes the [gtk.font_dialog.FontDialog.chooseFont] call
      and returns the resulting font description.
  
      Params:
        result = a [gio.async_result.AsyncResult]
      Returns: the selected font
      Throws: [ErrorWrap]
  */
  pango.font_description.FontDescription chooseFontFinish(gio.async_result.AsyncResult result)
  {
    PangoFontDescription* _cretval;
    GError *_err;
    _cretval = gtk_font_dialog_choose_font_finish(cast(GtkFontDialog*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new pango.font_description.FontDescription(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns the filter that decides which fonts to display
      in the font chooser dialog.
      Returns: the filter
  */
  gtk.filter.Filter getFilter()
  {
    GtkFilter* _cretval;
    _cretval = gtk_font_dialog_get_filter(cast(GtkFontDialog*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.filter.Filter)(cast(GtkFilter*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the fontmap from which fonts are selected,
      or `NULL` for the default fontmap.
      Returns: the fontmap
  */
  pango.font_map.FontMap getFontMap()
  {
    PangoFontMap* _cretval;
    _cretval = gtk_font_dialog_get_font_map(cast(GtkFontDialog*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(pango.font_map.FontMap)(cast(PangoFontMap*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the language for which font features are applied.
      Returns: the language for font features
  */
  pango.language.Language getLanguage()
  {
    PangoLanguage* _cretval;
    _cretval = gtk_font_dialog_get_language(cast(GtkFontDialog*)this._cPtr);
    auto _retval = _cretval ? new pango.language.Language(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns whether the font chooser dialog
      blocks interaction with the parent window
      while it is presented.
      Returns: `TRUE` if the font chooser dialog is modal
  */
  bool getModal()
  {
    bool _retval;
    _retval = cast(bool)gtk_font_dialog_get_modal(cast(GtkFontDialog*)this._cPtr);
    return _retval;
  }

  /**
      Returns the title that will be shown on the
      font chooser dialog.
      Returns: the title
  */
  string getTitle()
  {
    const(char)* _cretval;
    _cretval = gtk_font_dialog_get_title(cast(GtkFontDialog*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Adds a filter that decides which fonts to display
      in the font chooser dialog.
      
      The [gtk.filter.Filter] must be able to handle both [pango.font_family.FontFamily]
      and [pango.font_face.FontFace] objects.
  
      Params:
        filter = a [gtk.filter.Filter]
  */
  void setFilter(gtk.filter.Filter filter = null)
  {
    gtk_font_dialog_set_filter(cast(GtkFontDialog*)this._cPtr, filter ? cast(GtkFilter*)filter._cPtr(No.Dup) : null);
  }

  /**
      Sets the fontmap from which fonts are selected.
      
      If fontmap is `NULL`, the default fontmap is used.
  
      Params:
        fontmap = the fontmap
  */
  void setFontMap(pango.font_map.FontMap fontmap = null)
  {
    gtk_font_dialog_set_font_map(cast(GtkFontDialog*)this._cPtr, fontmap ? cast(PangoFontMap*)fontmap._cPtr(No.Dup) : null);
  }

  /**
      Sets the language for which font features are applied.
  
      Params:
        language = the language for font features
  */
  void setLanguage(pango.language.Language language)
  {
    gtk_font_dialog_set_language(cast(GtkFontDialog*)this._cPtr, language ? cast(PangoLanguage*)language._cPtr(No.Dup) : null);
  }

  /**
      Sets whether the font chooser dialog
      blocks interaction with the parent window
      while it is presented.
  
      Params:
        modal = the new value
  */
  void setModal(bool modal)
  {
    gtk_font_dialog_set_modal(cast(GtkFontDialog*)this._cPtr, modal);
  }

  /**
      Sets the title that will be shown on the
      font chooser dialog.
  
      Params:
        title = the new title
  */
  void setTitle(string title)
  {
    const(char)* _title = title.toCString(No.Alloc);
    gtk_font_dialog_set_title(cast(GtkFontDialog*)this._cPtr, _title);
  }
}
