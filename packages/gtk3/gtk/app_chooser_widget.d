/// Module for [AppChooserWidget] class
module gtk.app_chooser_widget;

public import gid.basictypes;
import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gio.app_info;
import gobject.dclosure;
import gobject.gid_builder;
import gtk.app_chooser;
import gtk.app_chooser_mixin;
import gtk.box;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.menu;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.types;
import gtk.widget;

/**
    #GtkAppChooserWidget is a widget for selecting applications.
    It is the main building block for #GtkAppChooserDialog. Most
    applications only need to use the latter; but you can use
    this widget as part of a larger widget if you have special needs.
    
    #GtkAppChooserWidget offers detailed control over what applications
    are shown, using the
    #GtkAppChooserWidget:show-default,
    #GtkAppChooserWidget:show-recommended,
    #GtkAppChooserWidget:show-fallback,
    #GtkAppChooserWidget:show-other and
    #GtkAppChooserWidget:show-all
    properties. See the #GtkAppChooser documentation for more information
    about these groups of applications.
    
    To keep track of the selected application, use the
    #GtkAppChooserWidget::application-selected and #GtkAppChooserWidget::application-activated signals.
    
    # CSS nodes
    
    GtkAppChooserWidget has a single CSS node with name appchooser.
*/
class AppChooserWidget : gtk.box.Box, gtk.app_chooser.AppChooser
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_app_chooser_widget_get_type != &gidSymbolNotFound ? gtk_app_chooser_widget_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AppChooserWidget self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtk.app_chooser_widget.AppChooserWidget]
      Returns: New builder object
  */
  static AppChooserWidgetGidBuilder builder() nothrow
  {
    return new AppChooserWidgetGidBuilder;
  }

  /**
      Get `defaultText` property.
      Returns: The #GtkAppChooserWidget:default-text property determines the text
        that appears in the widget when there are no applications for the
        given content type.
        See also [gtk.app_chooser_widget.AppChooserWidget.setDefaultText].
  */
  @property string defaultText() nothrow
  {
    return getDefaultText();
  }

  /**
      Set `defaultText` property.
      Params:
        propval = The #GtkAppChooserWidget:default-text property determines the text
          that appears in the widget when there are no applications for the
          given content type.
          See also [gtk.app_chooser_widget.AppChooserWidget.setDefaultText].
  */
  @property void defaultText(string propval) nothrow
  {
    setDefaultText(propval);
  }

  alias showAll = gtk.widget.Widget.showAll;

  /**
      Get `showAll` property.
      Returns: If the #GtkAppChooserWidget:show-all property is true, the app
        chooser presents all applications in a single list, without
        subsections for default, recommended or related applications.
  */
  @property bool showAll() nothrow
  {
    return getShowAll();
  }

  alias showAll = gtk.widget.Widget.showAll;

  /**
      Set `showAll` property.
      Params:
        propval = If the #GtkAppChooserWidget:show-all property is true, the app
          chooser presents all applications in a single list, without
          subsections for default, recommended or related applications.
  */
  @property void showAll(bool propval) nothrow
  {
    setShowAll(propval);
  }

  /**
      Get `showDefault` property.
      Returns: The ::show-default property determines whether the app chooser
        should show the default handler for the content type in a
        separate section. If false, the default handler is listed
        among the recommended applications.
  */
  @property bool showDefault() nothrow
  {
    return getShowDefault();
  }

  /**
      Set `showDefault` property.
      Params:
        propval = The ::show-default property determines whether the app chooser
          should show the default handler for the content type in a
          separate section. If false, the default handler is listed
          among the recommended applications.
  */
  @property void showDefault(bool propval) nothrow
  {
    setShowDefault(propval);
  }

  /**
      Get `showFallback` property.
      Returns: The #GtkAppChooserWidget:show-fallback property determines whether
        the app chooser should show a section for fallback applications.
        If false, the fallback applications are listed among the other
        applications.
  */
  @property bool showFallback() nothrow
  {
    return getShowFallback();
  }

  /**
      Set `showFallback` property.
      Params:
        propval = The #GtkAppChooserWidget:show-fallback property determines whether
          the app chooser should show a section for fallback applications.
          If false, the fallback applications are listed among the other
          applications.
  */
  @property void showFallback(bool propval) nothrow
  {
    setShowFallback(propval);
  }

  /**
      Get `showOther` property.
      Returns: The #GtkAppChooserWidget:show-other property determines whether
        the app chooser should show a section for other applications.
  */
  @property bool showOther() nothrow
  {
    return getShowOther();
  }

  /**
      Set `showOther` property.
      Params:
        propval = The #GtkAppChooserWidget:show-other property determines whether
          the app chooser should show a section for other applications.
  */
  @property void showOther(bool propval) nothrow
  {
    setShowOther(propval);
  }

  /**
      Get `showRecommended` property.
      Returns: The #GtkAppChooserWidget:show-recommended property determines
        whether the app chooser should show a section for recommended
        applications. If false, the recommended applications are listed
        among the other applications.
  */
  @property bool showRecommended() nothrow
  {
    return getShowRecommended();
  }

  /**
      Set `showRecommended` property.
      Params:
        propval = The #GtkAppChooserWidget:show-recommended property determines
          whether the app chooser should show a section for recommended
          applications. If false, the recommended applications are listed
          among the other applications.
  */
  @property void showRecommended(bool propval) nothrow
  {
    setShowRecommended(propval);
  }

  mixin AppChooserT!();

  /**
      Creates a new #GtkAppChooserWidget for applications
      that can handle content of the given type.
  
      Params:
        contentType = the content type to show applications for
      Returns: a newly created #GtkAppChooserWidget
  */
  this(string contentType) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _contentType = contentType.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_app_chooser_widget_new(_contentType);
    this(_cretval, No.Take);
  }

  /**
      Returns the text that is shown if there are not applications
      that can handle the content type.
      Returns: the value of #GtkAppChooserWidget:default-text
  */
  string getDefaultText() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_app_chooser_widget_get_default_text(cast(GtkAppChooserWidget*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Returns the current value of the #GtkAppChooserWidget:show-all
      property.
      Returns: the value of #GtkAppChooserWidget:show-all
  */
  bool getShowAll() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_app_chooser_widget_get_show_all(cast(GtkAppChooserWidget*)this._cPtr);
    return _retval;
  }

  /**
      Returns the current value of the #GtkAppChooserWidget:show-default
      property.
      Returns: the value of #GtkAppChooserWidget:show-default
  */
  bool getShowDefault() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_app_chooser_widget_get_show_default(cast(GtkAppChooserWidget*)this._cPtr);
    return _retval;
  }

  /**
      Returns the current value of the #GtkAppChooserWidget:show-fallback
      property.
      Returns: the value of #GtkAppChooserWidget:show-fallback
  */
  bool getShowFallback() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_app_chooser_widget_get_show_fallback(cast(GtkAppChooserWidget*)this._cPtr);
    return _retval;
  }

  /**
      Returns the current value of the #GtkAppChooserWidget:show-other
      property.
      Returns: the value of #GtkAppChooserWidget:show-other
  */
  bool getShowOther() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_app_chooser_widget_get_show_other(cast(GtkAppChooserWidget*)this._cPtr);
    return _retval;
  }

  /**
      Returns the current value of the #GtkAppChooserWidget:show-recommended
      property.
      Returns: the value of #GtkAppChooserWidget:show-recommended
  */
  bool getShowRecommended() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_app_chooser_widget_get_show_recommended(cast(GtkAppChooserWidget*)this._cPtr);
    return _retval;
  }

  /**
      Sets the text that is shown if there are not applications
      that can handle the content type.
  
      Params:
        text = the new value for #GtkAppChooserWidget:default-text
  */
  void setDefaultText(string text) nothrow
  {
    const(char)* _text = text.toCString!(No.Malloc, No.Nullable);
    gtk_app_chooser_widget_set_default_text(cast(GtkAppChooserWidget*)this._cPtr, _text);
  }

  /**
      Sets whether the app chooser should show all applications
      in a flat list.
  
      Params:
        setting = the new value for #GtkAppChooserWidget:show-all
  */
  void setShowAll(bool setting) nothrow
  {
    gtk_app_chooser_widget_set_show_all(cast(GtkAppChooserWidget*)this._cPtr, setting);
  }

  /**
      Sets whether the app chooser should show the default handler
      for the content type in a separate section.
  
      Params:
        setting = the new value for #GtkAppChooserWidget:show-default
  */
  void setShowDefault(bool setting) nothrow
  {
    gtk_app_chooser_widget_set_show_default(cast(GtkAppChooserWidget*)this._cPtr, setting);
  }

  /**
      Sets whether the app chooser should show related applications
      for the content type in a separate section.
  
      Params:
        setting = the new value for #GtkAppChooserWidget:show-fallback
  */
  void setShowFallback(bool setting) nothrow
  {
    gtk_app_chooser_widget_set_show_fallback(cast(GtkAppChooserWidget*)this._cPtr, setting);
  }

  /**
      Sets whether the app chooser should show applications
      which are unrelated to the content type.
  
      Params:
        setting = the new value for #GtkAppChooserWidget:show-other
  */
  void setShowOther(bool setting) nothrow
  {
    gtk_app_chooser_widget_set_show_other(cast(GtkAppChooserWidget*)this._cPtr, setting);
  }

  /**
      Sets whether the app chooser should show recommended applications
      for the content type in a separate section.
  
      Params:
        setting = the new value for #GtkAppChooserWidget:show-recommended
  */
  void setShowRecommended(bool setting) nothrow
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
  
          `void callback(gio.app_info.AppInfo application, gtk.app_chooser_widget.AppChooserWidget appChooserWidget)`
  
          `application` the activated #GAppInfo (optional)
  
          `appChooserWidget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectApplicationActivated(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gio.app_info.AppInfo)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.app_chooser_widget.AppChooserWidget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
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
        gidInvokeCallbackExceptionHandler(e, "gtk.app_chooser_widget.AppChooserWidget.applicationActivated");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("application-activated", closure, after);
  }

  /**
      Connect to `ApplicationSelected` signal.
  
      Emitted when an application item is selected from the widget's list.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gio.app_info.AppInfo application, gtk.app_chooser_widget.AppChooserWidget appChooserWidget)`
  
          `application` the selected #GAppInfo (optional)
  
          `appChooserWidget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectApplicationSelected(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gio.app_info.AppInfo)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.app_chooser_widget.AppChooserWidget)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
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
        gidInvokeCallbackExceptionHandler(e, "gtk.app_chooser_widget.AppChooserWidget.applicationSelected");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("application-selected", closure, after);
  }

  /**
      Connect to `PopulatePopup` signal.
  
      Emitted when a context menu is about to popup over an application item.
        Clients can insert menu items into the provided #GtkMenu object in the
        callback of this signal; the context menu will be shown over the item
        if at least one item has been added to the menu.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gtk.menu.Menu menu, gio.app_info.AppInfo application, gtk.app_chooser_widget.AppChooserWidget appChooserWidget)`
  
          `menu` the #GtkMenu to populate (optional)
  
          `application` the current #GAppInfo (optional)
  
          `appChooserWidget` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPopulatePopup(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.menu.Menu)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gio.app_info.AppInfo)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.app_chooser_widget.AppChooserWidget)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gtk.app_chooser_widget.AppChooserWidget.populatePopup");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("populate-popup", closure, after);
  }
}

/// Fluent builder implementation template for [gtk.app_chooser_widget.AppChooserWidget]
class AppChooserWidgetGidBuilderImpl(T) : gtk.box.BoxGidBuilderImpl!T, gtk.app_chooser.AppChooserGidBuilderImpl!T
{

  mixin AppChooserGidBuilderT!();

  /**
      Set `defaultText` property.
      Params:
        propval = The #GtkAppChooserWidget:default-text property determines the text
          that appears in the widget when there are no applications for the
          given content type.
          See also [gtk.app_chooser_widget.AppChooserWidget.setDefaultText].
      Returns: Builder instance for fluent chaining
  */
  T defaultText(string propval) nothrow
  {
    return setProperty("default-text", propval);
  }

  /**
      Set `showAll` property.
      Params:
        propval = If the #GtkAppChooserWidget:show-all property is true, the app
          chooser presents all applications in a single list, without
          subsections for default, recommended or related applications.
      Returns: Builder instance for fluent chaining
  */
  T showAll(bool propval) nothrow
  {
    return setProperty("show-all", propval);
  }

  /**
      Set `showDefault` property.
      Params:
        propval = The ::show-default property determines whether the app chooser
          should show the default handler for the content type in a
          separate section. If false, the default handler is listed
          among the recommended applications.
      Returns: Builder instance for fluent chaining
  */
  T showDefault(bool propval) nothrow
  {
    return setProperty("show-default", propval);
  }

  /**
      Set `showFallback` property.
      Params:
        propval = The #GtkAppChooserWidget:show-fallback property determines whether
          the app chooser should show a section for fallback applications.
          If false, the fallback applications are listed among the other
          applications.
      Returns: Builder instance for fluent chaining
  */
  T showFallback(bool propval) nothrow
  {
    return setProperty("show-fallback", propval);
  }

  /**
      Set `showOther` property.
      Params:
        propval = The #GtkAppChooserWidget:show-other property determines whether
          the app chooser should show a section for other applications.
      Returns: Builder instance for fluent chaining
  */
  T showOther(bool propval) nothrow
  {
    return setProperty("show-other", propval);
  }

  /**
      Set `showRecommended` property.
      Params:
        propval = The #GtkAppChooserWidget:show-recommended property determines
          whether the app chooser should show a section for recommended
          applications. If false, the recommended applications are listed
          among the other applications.
      Returns: Builder instance for fluent chaining
  */
  T showRecommended(bool propval) nothrow
  {
    return setProperty("show-recommended", propval);
  }
}

/// Fluent builder for [gtk.app_chooser_widget.AppChooserWidget]
final class AppChooserWidgetGidBuilder : AppChooserWidgetGidBuilderImpl!AppChooserWidgetGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  AppChooserWidget build() nothrow
  {
    return new AppChooserWidget(cast(void*)createGObject(AppChooserWidget._getGType), No.Take);
  }
}
