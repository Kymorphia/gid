/// Module for [AppChooserWidget] class
module gtk.app_chooser_widget;

import gid.gid;
import gio.app_info;
import gobject.dclosure;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.app_chooser;
import gtk.app_chooser_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.types;
import gtk.widget;

/**
    [gtk.app_chooser_widget.AppChooserWidget] is a widget for selecting applications.
    
    It is the main building block for [gtk.app_chooser_dialog.AppChooserDialog].
    Most applications only need to use the latter; but you can use
    this widget as part of a larger widget if you have special needs.
    
    [gtk.app_chooser_widget.AppChooserWidget] offers detailed control over what applications
    are shown, using the
    `property@Gtk.AppChooserWidget:show-default`,
    `property@Gtk.AppChooserWidget:show-recommended`,
    `property@Gtk.AppChooserWidget:show-fallback`,
    `property@Gtk.AppChooserWidget:show-other` and
    `property@Gtk.AppChooserWidget:show-all` properties. See the
    [gtk.app_chooser.AppChooser] documentation for more information about these
    groups of applications.
    
    To keep track of the selected application, use the
    `signal@Gtk.AppChooserWidget::application-selected` and
    `signal@Gtk.AppChooserWidget::application-activated` signals.
    
    ## CSS nodes
    
    [gtk.app_chooser_widget.AppChooserWidget] has a single CSS node with name appchooser.

    Deprecated: The application selection widgets should be
        implemented according to the design of each platform and/or
        application requiring them.
*/
class AppChooserWidget : gtk.widget.Widget, gtk.app_chooser.AppChooser
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
    return cast(void function())gtk_app_chooser_widget_get_type != &gidSymbolNotFound ? gtk_app_chooser_widget_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AppChooserWidget self()
  {
    return this;
  }

  /**
      Get `defaultText` property.
      Returns: The text that appears in the widget when there are no applications
      for the given content type.
  */
  @property string defaultText()
  {
    return getDefaultText();
  }

  /**
      Set `defaultText` property.
      Params:
        propval = The text that appears in the widget when there are no applications
        for the given content type.
  */
  @property void defaultText(string propval)
  {
    return setDefaultText(propval);
  }

  /**
      Get `showAll` property.
      Returns: If true, the app chooser presents all applications
      in a single list, without subsections for default,
      recommended or related applications.
  */
  @property bool showAll()
  {
    return getShowAll();
  }

  /**
      Set `showAll` property.
      Params:
        propval = If true, the app chooser presents all applications
        in a single list, without subsections for default,
        recommended or related applications.
  */
  @property void showAll(bool propval)
  {
    return setShowAll(propval);
  }

  /**
      Get `showDefault` property.
      Returns: Determines whether the app chooser should show the default
      handler for the content type in a separate section.
      
      If false, the default handler is listed among the recommended
      applications.
  */
  @property bool showDefault()
  {
    return getShowDefault();
  }

  /**
      Set `showDefault` property.
      Params:
        propval = Determines whether the app chooser should show the default
        handler for the content type in a separate section.
        
        If false, the default handler is listed among the recommended
        applications.
  */
  @property void showDefault(bool propval)
  {
    return setShowDefault(propval);
  }

  /**
      Get `showFallback` property.
      Returns: Determines whether the app chooser should show a section
      for fallback applications.
      
      If false, the fallback applications are listed among the
      other applications.
  */
  @property bool showFallback()
  {
    return getShowFallback();
  }

  /**
      Set `showFallback` property.
      Params:
        propval = Determines whether the app chooser should show a section
        for fallback applications.
        
        If false, the fallback applications are listed among the
        other applications.
  */
  @property void showFallback(bool propval)
  {
    return setShowFallback(propval);
  }

  /**
      Get `showOther` property.
      Returns: Determines whether the app chooser should show a section
      for other applications.
  */
  @property bool showOther()
  {
    return getShowOther();
  }

  /**
      Set `showOther` property.
      Params:
        propval = Determines whether the app chooser should show a section
        for other applications.
  */
  @property void showOther(bool propval)
  {
    return setShowOther(propval);
  }

  /**
      Get `showRecommended` property.
      Returns: Determines whether the app chooser should show a section
      for recommended applications.
      
      If false, the recommended applications are listed
      among the other applications.
  */
  @property bool showRecommended()
  {
    return getShowRecommended();
  }

  /**
      Set `showRecommended` property.
      Params:
        propval = Determines whether the app chooser should show a section
        for recommended applications.
        
        If false, the recommended applications are listed
        among the other applications.
  */
  @property void showRecommended(bool propval)
  {
    return setShowRecommended(propval);
  }

  mixin AppChooserT!();

  /**
      Creates a new [gtk.app_chooser_widget.AppChooserWidget] for applications
      that can handle content of the given type.
  
      Params:
        contentType = the content type to show applications for
      Returns: a newly created [gtk.app_chooser_widget.AppChooserWidget]
  
      Deprecated: This widget will be removed in GTK 5
  */
  this(string contentType)
  {
    GtkWidget* _cretval;
    const(char)* _contentType = contentType.toCString(No.Alloc);
    _cretval = gtk_app_chooser_widget_new(_contentType);
    this(_cretval, No.Take);
  }

  /**
      Returns the text that is shown if there are not applications
      that can handle the content type.
      Returns: the value of `propertyGtk.AppChooserWidget:default-text`
  
      Deprecated: This widget will be removed in GTK 5
  */
  string getDefaultText()
  {
    const(char)* _cretval;
    _cretval = gtk_app_chooser_widget_get_default_text(cast(GtkAppChooserWidget*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets whether the app chooser should show all applications
      in a flat list.
      Returns: the value of `propertyGtk.AppChooserWidget:show-all`
  
      Deprecated: This widget will be removed in GTK 5
  */
  bool getShowAll()
  {
    bool _retval;
    _retval = cast(bool)gtk_app_chooser_widget_get_show_all(cast(GtkAppChooserWidget*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether the app chooser should show the default handler
      for the content type in a separate section.
      Returns: the value of `propertyGtk.AppChooserWidget:show-default`
  
      Deprecated: This widget will be removed in GTK 5
  */
  bool getShowDefault()
  {
    bool _retval;
    _retval = cast(bool)gtk_app_chooser_widget_get_show_default(cast(GtkAppChooserWidget*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether the app chooser should show related applications
      for the content type in a separate section.
      Returns: the value of `propertyGtk.AppChooserWidget:show-fallback`
  
      Deprecated: This widget will be removed in GTK 5
  */
  bool getShowFallback()
  {
    bool _retval;
    _retval = cast(bool)gtk_app_chooser_widget_get_show_fallback(cast(GtkAppChooserWidget*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether the app chooser should show applications
      which are unrelated to the content type.
      Returns: the value of `propertyGtk.AppChooserWidget:show-other`
  
      Deprecated: This widget will be removed in GTK 5
  */
  bool getShowOther()
  {
    bool _retval;
    _retval = cast(bool)gtk_app_chooser_widget_get_show_other(cast(GtkAppChooserWidget*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether the app chooser should show recommended applications
      for the content type in a separate section.
      Returns: the value of `propertyGtk.AppChooserWidget:show-recommended`
  
      Deprecated: This widget will be removed in GTK 5
  */
  bool getShowRecommended()
  {
    bool _retval;
    _retval = cast(bool)gtk_app_chooser_widget_get_show_recommended(cast(GtkAppChooserWidget*)this._cPtr);
    return _retval;
  }

  /**
      Sets the text that is shown if there are not applications
      that can handle the content type.
  
      Params:
        text = the new value for `propertyGtk.AppChooserWidget:default-text`
  
      Deprecated: This widget will be removed in GTK 5
  */
  void setDefaultText(string text)
  {
    const(char)* _text = text.toCString(No.Alloc);
    gtk_app_chooser_widget_set_default_text(cast(GtkAppChooserWidget*)this._cPtr, _text);
  }

  /**
      Sets whether the app chooser should show all applications
      in a flat list.
  
      Params:
        setting = the new value for `propertyGtk.AppChooserWidget:show-all`
  
      Deprecated: This widget will be removed in GTK 5
  */
  void setShowAll(bool setting)
  {
    gtk_app_chooser_widget_set_show_all(cast(GtkAppChooserWidget*)this._cPtr, setting);
  }

  /**
      Sets whether the app chooser should show the default handler
      for the content type in a separate section.
  
      Params:
        setting = the new value for `propertyGtk.AppChooserWidget:show-default`
  
      Deprecated: This widget will be removed in GTK 5
  */
  void setShowDefault(bool setting)
  {
    gtk_app_chooser_widget_set_show_default(cast(GtkAppChooserWidget*)this._cPtr, setting);
  }

  /**
      Sets whether the app chooser should show related applications
      for the content type in a separate section.
  
      Params:
        setting = the new value for `propertyGtk.AppChooserWidget:show-fallback`
  
      Deprecated: This widget will be removed in GTK 5
  */
  void setShowFallback(bool setting)
  {
    gtk_app_chooser_widget_set_show_fallback(cast(GtkAppChooserWidget*)this._cPtr, setting);
  }

  /**
      Sets whether the app chooser should show applications
      which are unrelated to the content type.
  
      Params:
        setting = the new value for `propertyGtk.AppChooserWidget:show-other`
  
      Deprecated: This widget will be removed in GTK 5
  */
  void setShowOther(bool setting)
  {
    gtk_app_chooser_widget_set_show_other(cast(GtkAppChooserWidget*)this._cPtr, setting);
  }

  /**
      Sets whether the app chooser should show recommended applications
      for the content type in a separate section.
  
      Params:
        setting = the new value for `propertyGtk.AppChooserWidget:show-recommended`
  
      Deprecated: This widget will be removed in GTK 5
  */
  void setShowRecommended(bool setting)
  {
    gtk_app_chooser_widget_set_show_recommended(cast(GtkAppChooserWidget*)this._cPtr, setting);
  }

  /**
      Connect to `ApplicationActivated` signal.
  
      Emitted when an application item is activated from the widget's list.
      
      This usually happens when the user double clicks an item, or an item
      is selected and the user presses one of the keys Space, Shift+Space,
      Return or Enter.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gio.app_info.AppInfo application, gtk.app_chooser_widget.AppChooserWidget appChooserWidget))
  
          `application` the activated [gio.app_info.AppInfo] (optional)
  
          `appChooserWidget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectApplicationActivated(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gio.app_info.AppInfo)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.app_chooser_widget.AppChooserWidget)))
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
    return connectSignalClosure("application-activated", closure, after);
  }

  /**
      Connect to `ApplicationSelected` signal.
  
      Emitted when an application item is selected from the widget's list.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gio.app_info.AppInfo application, gtk.app_chooser_widget.AppChooserWidget appChooserWidget))
  
          `application` the selected [gio.app_info.AppInfo] (optional)
  
          `appChooserWidget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectApplicationSelected(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gio.app_info.AppInfo)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.app_chooser_widget.AppChooserWidget)))
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
    return connectSignalClosure("application-selected", closure, after);
  }
}
