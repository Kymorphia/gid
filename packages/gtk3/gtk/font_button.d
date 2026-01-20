/// Module for [FontButton] class
module gtk.font_button;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.actionable;
import gtk.actionable_mixin;
import gtk.activatable;
import gtk.activatable_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.button;
import gtk.c.functions;
import gtk.c.types;
import gtk.font_chooser;
import gtk.font_chooser_mixin;
import gtk.types;

/**
    The #GtkFontButton is a button which displays the currently selected
    font an allows to open a font chooser dialog to change the font.
    It is suitable widget for selecting a font in a preference dialog.
    
    # CSS nodes
    
    GtkFontButton has a single CSS node with name button and style class .font.
*/
class FontButton : gtk.button.Button, gtk.font_chooser.FontChooser
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
    return cast(void function())gtk_font_button_get_type != &gidSymbolNotFound ? gtk_font_button_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FontButton self()
  {
    return this;
  }

  /**
      Get `fontName` property.
      Returns: The name of the currently selected font.
  
      Deprecated: Use the #GtkFontChooser::font property instead
  */
  @property string fontName()
  {
    return getFontName();
  }

  /**
      Set `fontName` property.
      Params:
        propval = The name of the currently selected font.
  
      Deprecated: Use the #GtkFontChooser::font property instead
  */
  @property void fontName(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("font-name", propval);
  }

  /**
      Get `showSize` property.
      Returns: If this property is set to true, the selected font size will be shown
        in the label. For a more WYSIWYG way to show the selected size, see the
        ::use-size property.
  */
  @property bool showSize()
  {
    return getShowSize();
  }

  /**
      Set `showSize` property.
      Params:
        propval = If this property is set to true, the selected font size will be shown
          in the label. For a more WYSIWYG way to show the selected size, see the
          ::use-size property.
  */
  @property void showSize(bool propval)
  {
    return setShowSize(propval);
  }

  /**
      Get `showStyle` property.
      Returns: If this property is set to true, the name of the selected font style
        will be shown in the label. For a more WYSIWYG way to show the selected
        style, see the ::use-font property.
  */
  @property bool showStyle()
  {
    return getShowStyle();
  }

  /**
      Set `showStyle` property.
      Params:
        propval = If this property is set to true, the name of the selected font style
          will be shown in the label. For a more WYSIWYG way to show the selected
          style, see the ::use-font property.
  */
  @property void showStyle(bool propval)
  {
    return setShowStyle(propval);
  }

  /**
      Get `title` property.
      Returns: The title of the font chooser dialog.
  */
  @property string title()
  {
    return getTitle();
  }

  /**
      Set `title` property.
      Params:
        propval = The title of the font chooser dialog.
  */
  @property void title(string propval)
  {
    return setTitle(propval);
  }

  /**
      Get `useFont` property.
      Returns: If this property is set to true, the label will be drawn
        in the selected font.
  */
  @property bool useFont()
  {
    return getUseFont();
  }

  /**
      Set `useFont` property.
      Params:
        propval = If this property is set to true, the label will be drawn
          in the selected font.
  */
  @property void useFont(bool propval)
  {
    return setUseFont(propval);
  }

  /**
      Get `useSize` property.
      Returns: If this property is set to true, the label will be drawn
        with the selected font size.
  */
  @property bool useSize()
  {
    return getUseSize();
  }

  /**
      Set `useSize` property.
      Params:
        propval = If this property is set to true, the label will be drawn
          with the selected font size.
  */
  @property void useSize(bool propval)
  {
    return setUseSize(propval);
  }

  mixin FontChooserT!();

  /**
      Creates a new font picker widget.
      Returns: a new font picker widget.
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_font_button_new();
    this(_cretval, No.Take);
  }

  /**
      Creates a new font picker widget.
  
      Params:
        fontname = Name of font to display in font chooser dialog
      Returns: a new font picker widget.
  */
  static gtk.font_button.FontButton newWithFont(string fontname)
  {
    GtkWidget* _cretval;
    const(char)* _fontname = fontname.toCString(No.Alloc);
    _cretval = gtk_font_button_new_with_font(_fontname);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.font_button.FontButton)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the name of the currently selected font. This name includes
      style and size information as well. If you want to render something
      with the font, use this string with [pango.font_description.FontDescription.fromString] .
      If you’re interested in peeking certain values (family name,
      style, size, weight) just query these properties from the
      #PangoFontDescription object.
      Returns: an internal copy of the font name which must not be freed.
  
      Deprecated: Use [gtk.font_chooser.FontChooser.getFont] instead
  */
  string getFontName()
  {
    const(char)* _cretval;
    _cretval = gtk_font_button_get_font_name(cast(GtkFontButton*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns whether the font size will be shown in the label.
      Returns: whether the font size will be shown in the label.
  */
  bool getShowSize()
  {
    bool _retval;
    _retval = cast(bool)gtk_font_button_get_show_size(cast(GtkFontButton*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the name of the font style will be shown in the label.
      Returns: whether the font style will be shown in the label.
  */
  bool getShowStyle()
  {
    bool _retval;
    _retval = cast(bool)gtk_font_button_get_show_style(cast(GtkFontButton*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the title of the font chooser dialog.
      Returns: an internal copy of the title string which must not be freed.
  */
  string getTitle()
  {
    const(char)* _cretval;
    _cretval = gtk_font_button_get_title(cast(GtkFontButton*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns whether the selected font is used in the label.
      Returns: whether the selected font is used in the label.
  */
  bool getUseFont()
  {
    bool _retval;
    _retval = cast(bool)gtk_font_button_get_use_font(cast(GtkFontButton*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the selected size is used in the label.
      Returns: whether the selected size is used in the label.
  */
  bool getUseSize()
  {
    bool _retval;
    _retval = cast(bool)gtk_font_button_get_use_size(cast(GtkFontButton*)this._cPtr);
    return _retval;
  }

  /**
      Sets or updates the currently-displayed font in font picker dialog.
  
      Params:
        fontname = Name of font to display in font chooser dialog
      Returns: true
  
      Deprecated: Use [gtk.font_chooser.FontChooser.setFont] instead
  */
  bool setFontName(string fontname)
  {
    bool _retval;
    const(char)* _fontname = fontname.toCString(No.Alloc);
    _retval = cast(bool)gtk_font_button_set_font_name(cast(GtkFontButton*)this._cPtr, _fontname);
    return _retval;
  }

  /**
      If show_size is true, the font size will be displayed along with the name of the selected font.
  
      Params:
        showSize = true if font size should be displayed in dialog.
  */
  void setShowSize(bool showSize)
  {
    gtk_font_button_set_show_size(cast(GtkFontButton*)this._cPtr, showSize);
  }

  /**
      If show_style is true, the font style will be displayed along with name of the selected font.
  
      Params:
        showStyle = true if font style should be displayed in label.
  */
  void setShowStyle(bool showStyle)
  {
    gtk_font_button_set_show_style(cast(GtkFontButton*)this._cPtr, showStyle);
  }

  /**
      Sets the title for the font chooser dialog.
  
      Params:
        title = a string containing the font chooser dialog title
  */
  void setTitle(string title)
  {
    const(char)* _title = title.toCString(No.Alloc);
    gtk_font_button_set_title(cast(GtkFontButton*)this._cPtr, _title);
  }

  /**
      If use_font is true, the font name will be written using the selected font.
  
      Params:
        useFont = If true, font name will be written using font chosen.
  */
  void setUseFont(bool useFont)
  {
    gtk_font_button_set_use_font(cast(GtkFontButton*)this._cPtr, useFont);
  }

  /**
      If use_size is true, the font name will be written using the selected size.
  
      Params:
        useSize = If true, font name will be written using the selected size.
  */
  void setUseSize(bool useSize)
  {
    gtk_font_button_set_use_size(cast(GtkFontButton*)this._cPtr, useSize);
  }

  /**
      Connect to `FontSet` signal.
  
      The ::font-set signal is emitted when the user selects a font.
        When handling this signal, use [gtk.font_chooser.FontChooser.getFont]
        to find out which font was just selected.
        
        Note that this signal is only emitted when the user
        changes the font. If you need to react to programmatic font changes
        as well, use the notify::font signal.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.font_button.FontButton fontButton))
  
          `fontButton` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectFontSet(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.font_button.FontButton)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("font-set", closure, after);
  }
}
