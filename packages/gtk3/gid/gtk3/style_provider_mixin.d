/// Module for [StyleProvider] interface mixin
module gid.gtk3.style_provider_mixin;

public import gid.core.basictypes;
public import gid.gtk3.style_provider_iface_proxy;
public import gid.core.utils;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gobject2.param_spec;
public import gid.gobject2.value;
public import gid.gtk3.c.functions;
public import gid.gtk3.c.types;
public import gid.gtk3.icon_factory;
public import gid.gtk3.style_properties;
public import gid.gtk3.types;
public import gid.gtk3.widget_path;

/**
    GtkStyleProvider is an interface used to provide style information to a #GtkStyleContext.
    See [gid.gtk4.style_context.StyleContext.addProvider] and [gid.gtk3.style_context.StyleContext.addProviderForScreen].
*/
template StyleProviderT()
{

  /**
      Returns the #GtkIconFactory defined to be in use for path, or null if none
      is defined.
  
      Params:
        path = #GtkWidgetPath to query (modified in place, changes are seen by the caller)
      Returns: The icon factory to use for path, or null
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetIconFactory`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  
      Deprecated: Will always return null for all GTK-provided style providers.
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gtk3.icon_factory.IconFactory vfuncGetIconFactory(gid.gtk3.widget_path.WidgetPath path)
  {
    auto _klass = cast(GtkStyleProviderIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.style_provider.StyleProvider._getGType);
    if (!_klass || !_klass.getIconFactory)
      return typeof(return).init;

    GtkIconFactory* _cretval;
    _cretval = _klass.getIconFactory(cast(GtkStyleProvider*)this._cPtr, path ? cast(GtkWidgetPath*)path._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.icon_factory.IconFactory)(cast(GtkIconFactory*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the style settings affecting a widget defined by path, or null if
      provider doesn’t contemplate styling path.
  
      Params:
        path = #GtkWidgetPath to query (modified in place, changes are seen by the caller)
      Returns: a #GtkStyleProperties containing the
        style settings affecting path
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetStyle`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  
      Deprecated: Will always return null for all GTK-provided style providers
            as the interface cannot correctly work the way CSS is specified.
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gtk3.style_properties.StyleProperties vfuncGetStyle(gid.gtk3.widget_path.WidgetPath path)
  {
    auto _klass = cast(GtkStyleProviderIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.style_provider.StyleProvider._getGType);
    if (!_klass || !_klass.getStyle)
      return typeof(return).init;

    GtkStyleProperties* _cretval;
    _cretval = _klass.getStyle(cast(GtkStyleProvider*)this._cPtr, path ? cast(GtkWidgetPath*)path._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.style_properties.StyleProperties)(cast(GtkStyleProperties*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Looks up a widget style property as defined by provider for
      the widget represented by path.
  
      Params:
        path = #GtkWidgetPath to query (modified in place, changes are seen by the caller)
        state = state to query the style property for
        pspec = The #GParamSpec to query
        value = return location for the property value
      Returns: true if the property was found and has a value, false otherwise
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetStyleProperty`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncGetStyleProperty(gid.gtk3.widget_path.WidgetPath path, gid.gtk3.types.StateFlags state, gid.gobject2.param_spec.ParamSpec pspec, out gid.gobject2.value.Value value)
  {
    auto _klass = cast(GtkStyleProviderIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.style_provider.StyleProvider._getGType);
    if (!_klass || !_klass.getStyleProperty)
      return typeof(return).init;

    bool _retval;
    auto _value = boxedNew!GValue(gid.gobject2.value.Value._getGType);
    _retval = cast(bool)_klass.getStyleProperty(cast(GtkStyleProvider*)this._cPtr, path ? cast(GtkWidgetPath*)path._cPtr(No.Dup) : null, state, pspec ? cast(GParamSpec*)pspec._cPtr(No.Dup) : null, _value);
    value = new gid.gobject2.value.Value(cast(void*)_value, Yes.Take);
    return _retval;
  }

  /**
      Returns the #GtkIconFactory defined to be in use for path, or null if none
      is defined.
  
      Params:
        path = #GtkWidgetPath to query
      Returns: The icon factory to use for path, or null
  
      Deprecated: Will always return null for all GTK-provided style providers.
  */
  override gid.gtk3.icon_factory.IconFactory getIconFactory(gid.gtk3.widget_path.WidgetPath path) nothrow
  {
    GtkIconFactory* _cretval;
    _cretval = gtk_style_provider_get_icon_factory(cast(GtkStyleProvider*)this._cPtr, path ? cast(GtkWidgetPath*)path._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.icon_factory.IconFactory)(cast(GtkIconFactory*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the style settings affecting a widget defined by path, or null if
      provider doesn’t contemplate styling path.
  
      Params:
        path = #GtkWidgetPath to query
      Returns: a #GtkStyleProperties containing the
        style settings affecting path
  
      Deprecated: Will always return null for all GTK-provided style providers
            as the interface cannot correctly work the way CSS is specified.
  */
  override gid.gtk3.style_properties.StyleProperties getStyle(gid.gtk3.widget_path.WidgetPath path) nothrow
  {
    GtkStyleProperties* _cretval;
    _cretval = gtk_style_provider_get_style(cast(GtkStyleProvider*)this._cPtr, path ? cast(GtkWidgetPath*)path._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.style_properties.StyleProperties)(cast(GtkStyleProperties*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Looks up a widget style property as defined by provider for
      the widget represented by path.
  
      Params:
        path = #GtkWidgetPath to query
        state = state to query the style property for
        pspec = The #GParamSpec to query
        value = return location for the property value
      Returns: true if the property was found and has a value, false otherwise
  */
  override bool getStyleProperty(gid.gtk3.widget_path.WidgetPath path, gid.gtk3.types.StateFlags state, gid.gobject2.param_spec.ParamSpec pspec, out gid.gobject2.value.Value value) nothrow
  {
    bool _retval;
    auto _value = boxedNew!GValue(gid.gobject2.value.Value._getGType);
    _retval = cast(bool)gtk_style_provider_get_style_property(cast(GtkStyleProvider*)this._cPtr, path ? cast(GtkWidgetPath*)path._cPtr(No.Dup) : null, state, pspec ? cast(GParamSpec*)pspec._cPtr(No.Dup) : null, _value);
    value = new gid.gobject2.value.Value(cast(void*)_value, Yes.Take);
    return _retval;
  }

  /// True if the D class T overrides any vfunc method of gid.gtk3.style_provider.StyleProvider (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gtk3_style_provider_StyleProvider(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetIconFactory", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetStyle", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetStyleProperty", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gtk3.style_provider.StyleProvider vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gobject.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gtk3_style_provider_StyleProvider(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetIconFactory", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_style_provider_StyleProvider(iface, "get_icon_factory");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetStyle", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_style_provider_StyleProvider(iface, "get_style");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetStyleProperty", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_style_provider_StyleProvider(iface, "get_style_property");
  }

  private static void _installIfaceVfunc_gid_gtk3_style_provider_StyleProvider(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GtkStyleProviderIface*)iface;

    switch (vfunc)
    {
      case "get_icon_factory":
      {
        static extern(C) GtkIconFactory* _vfuncGetIconFactoryTramp(GtkStyleProvider* provider, GtkWidgetPath* path) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)provider);
          if (!_obj)
          {
            auto _klass = cast(GtkStyleProviderIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)provider), gid.gtk3.style_provider.StyleProvider._getGType);
            if (_klass && _klass.getIconFactory)
              return (cast(typeof(&_vfuncGetIconFactoryTramp))_klass.getIconFactory)(provider, path);
            return typeof(return).init;
          }

          gid.gtk3.icon_factory.IconFactory _dretval;
          auto _path = path ? new gid.gtk3.widget_path.WidgetPath(cast(void*)path, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncGetIconFactory(_path);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.style_provider.StyleProvider.vfuncGetIconFactory");
          }
          auto _retval = _dretval ? cast(GtkIconFactory*)_dretval._cPtr(No.Dup) : null;
          if (_path)
            _path._cUnborrow;

          return _retval;
        }

        _klass.getIconFactory = cast(typeof(_klass.getIconFactory))&_vfuncGetIconFactoryTramp;
        break;
      }
      case "get_style":
      {
        static extern(C) GtkStyleProperties* _vfuncGetStyleTramp(GtkStyleProvider* provider, GtkWidgetPath* path) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)provider);
          if (!_obj)
          {
            auto _klass = cast(GtkStyleProviderIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)provider), gid.gtk3.style_provider.StyleProvider._getGType);
            if (_klass && _klass.getStyle)
              return (cast(typeof(&_vfuncGetStyleTramp))_klass.getStyle)(provider, path);
            return typeof(return).init;
          }

          gid.gtk3.style_properties.StyleProperties _dretval;
          auto _path = path ? new gid.gtk3.widget_path.WidgetPath(cast(void*)path, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncGetStyle(_path);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.style_provider.StyleProvider.vfuncGetStyle");
          }
          auto _retval = _dretval ? cast(GtkStyleProperties*)_dretval._cPtr(Yes.Dup) : null;
          if (_path)
            _path._cUnborrow;

          return _retval;
        }

        _klass.getStyle = cast(typeof(_klass.getStyle))&_vfuncGetStyleTramp;
        break;
      }
      case "get_style_property":
      {
        static extern(C) gboolean _vfuncGetStylePropertyTramp(GtkStyleProvider* provider, GtkWidgetPath* path, GtkStateFlags state, GParamSpec* pspec, GValue* value) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)provider);
          if (!_obj)
          {
            auto _klass = cast(GtkStyleProviderIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)provider), gid.gtk3.style_provider.StyleProvider._getGType);
            if (_klass && _klass.getStyleProperty)
              return (cast(typeof(&_vfuncGetStylePropertyTramp))_klass.getStyleProperty)(provider, path, state, pspec, value);
            return typeof(return).init;
          }

          bool _dretval;
          auto _path = path ? new gid.gtk3.widget_path.WidgetPath(cast(void*)path, Yes.Take)._cBorrow : null;
          gid.gobject2.value.Value _value;

          try
          {
            _dretval = _obj.vfuncGetStyleProperty(_path, state, pspec ? new gid.gobject2.param_spec.ParamSpec(cast(void*)pspec, No.Take) : null, _value);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.style_provider.StyleProvider.vfuncGetStyleProperty");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_path)
            _path._cUnborrow;
          if (_value)
          {
            auto p_ = _value._cPtr(Yes.Dup);
            *value = *cast(GValue*)p_;
            gFree(p_);
          }

          return _retval;
        }

        _klass.getStyleProperty = cast(typeof(_klass.getStyleProperty))&_vfuncGetStylePropertyTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.style_provider.StyleProvider]
template StyleProviderGidBuilderT()
{
}
