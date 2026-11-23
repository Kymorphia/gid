/// Module for [StyleSchemeChooser] interface mixin
module gid.gtksource4.style_scheme_chooser_mixin;

public import gid.core.basictypes;
public import gid.gtksource4.style_scheme_chooser_iface_proxy;
public import gid.core.utils;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gtksource4.c.functions;
public import gid.gtksource4.c.types;
public import gid.gtksource4.style_scheme;
public import gid.gtksource4.types;

/** */
template StyleSchemeChooserT()
{

  /**
      Get `styleScheme` property.
      Returns: The :style-scheme property contains the currently selected style
        scheme. The property can be set to change
        the current selection programmatically.
  */
  @property gid.gtksource4.style_scheme.StyleScheme styleScheme() nothrow
  {
    return getStyleScheme();
  }

  /**
      Set `styleScheme` property.
      Params:
        propval = The :style-scheme property contains the currently selected style
          scheme. The property can be set to change
          the current selection programmatically.
  */
  @property void styleScheme(gid.gtksource4.style_scheme.StyleScheme propval) nothrow
  {
    setStyleScheme(propval);
  }

  /**
      Gets the currently-selected scheme.
      Returns: the currently-selected scheme.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetStyleScheme`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gtksource4.style_scheme.StyleScheme vfuncGetStyleScheme()
  {
    auto _klass = cast(GtkSourceStyleSchemeChooserInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtksource4.style_scheme_chooser.StyleSchemeChooser._getGType);
    if (!_klass || !_klass.getStyleScheme)
      return typeof(return).init;

    GtkSourceStyleScheme* _cretval;
    _cretval = _klass.getStyleScheme(cast(GtkSourceStyleSchemeChooser*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource4.style_scheme.StyleScheme)(cast(GtkSourceStyleScheme*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the scheme.
  
      Params:
        scheme = a #GtkSourceStyleScheme
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetStyleScheme`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncSetStyleScheme(gid.gtksource4.style_scheme.StyleScheme scheme)
  {
    auto _klass = cast(GtkSourceStyleSchemeChooserInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtksource4.style_scheme_chooser.StyleSchemeChooser._getGType);
    if (!_klass || !_klass.setStyleScheme)
      return;

    _klass.setStyleScheme(cast(GtkSourceStyleSchemeChooser*)this._cPtr, scheme ? cast(GtkSourceStyleScheme*)scheme._cPtr(No.Dup) : null);
  }

  /**
      Gets the currently-selected scheme.
      Returns: the currently-selected scheme.
  */
  override gid.gtksource4.style_scheme.StyleScheme getStyleScheme() nothrow
  {
    GtkSourceStyleScheme* _cretval;
    _cretval = gtk_source_style_scheme_chooser_get_style_scheme(cast(GtkSourceStyleSchemeChooser*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource4.style_scheme.StyleScheme)(cast(GtkSourceStyleScheme*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the scheme.
  
      Params:
        scheme = a #GtkSourceStyleScheme
  */
  override void setStyleScheme(gid.gtksource4.style_scheme.StyleScheme scheme) nothrow
  {
    gtk_source_style_scheme_chooser_set_style_scheme(cast(GtkSourceStyleSchemeChooser*)this._cPtr, scheme ? cast(GtkSourceStyleScheme*)scheme._cPtr(No.Dup) : null);
  }

  /// True if the D class T overrides any vfunc method of gid.gtksource4.style_scheme_chooser.StyleSchemeChooser (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gtksource4_style_scheme_chooser_StyleSchemeChooser(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetStyleScheme", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetStyleScheme", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gtksource4.style_scheme_chooser.StyleSchemeChooser vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gobject.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gtksource4_style_scheme_chooser_StyleSchemeChooser(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetStyleScheme", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtksource4_style_scheme_chooser_StyleSchemeChooser(iface, "get_style_scheme");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetStyleScheme", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtksource4_style_scheme_chooser_StyleSchemeChooser(iface, "set_style_scheme");
  }

  private static void _installIfaceVfunc_gid_gtksource4_style_scheme_chooser_StyleSchemeChooser(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GtkSourceStyleSchemeChooserInterface*)iface;

    switch (vfunc)
    {
      case "get_style_scheme":
      {
        static extern(C) GtkSourceStyleScheme* _vfuncGetStyleSchemeTramp(GtkSourceStyleSchemeChooser* chooser) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)chooser);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceStyleSchemeChooserInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)chooser), gid.gtksource4.style_scheme_chooser.StyleSchemeChooser._getGType);
            if (_klass && _klass.getStyleScheme)
              return (cast(typeof(&_vfuncGetStyleSchemeTramp))_klass.getStyleScheme)(chooser);
            return typeof(return).init;
          }

          gid.gtksource4.style_scheme.StyleScheme _dretval;

          try
          {
            _dretval = _obj.vfuncGetStyleScheme();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.style_scheme_chooser.StyleSchemeChooser.vfuncGetStyleScheme");
          }
          auto _retval = _dretval ? cast(GtkSourceStyleScheme*)_dretval._cPtr(No.Dup) : null;

          return _retval;
        }

        _klass.getStyleScheme = cast(typeof(_klass.getStyleScheme))&_vfuncGetStyleSchemeTramp;
        break;
      }
      case "set_style_scheme":
      {
        static extern(C) void _vfuncSetStyleSchemeTramp(GtkSourceStyleSchemeChooser* chooser, GtkSourceStyleScheme* scheme) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)chooser);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceStyleSchemeChooserInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)chooser), gid.gtksource4.style_scheme_chooser.StyleSchemeChooser._getGType);
            if (_klass && _klass.setStyleScheme)
              return (cast(typeof(&_vfuncSetStyleSchemeTramp))_klass.setStyleScheme)(chooser, scheme);
            return;
          }

          try
          {
            _obj.vfuncSetStyleScheme(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource4.style_scheme.StyleScheme)(cast(void*)scheme, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtksource4.style_scheme_chooser.StyleSchemeChooser.vfuncSetStyleScheme");
          }
        }

        _klass.setStyleScheme = cast(typeof(_klass.setStyleScheme))&_vfuncSetStyleSchemeTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtksource4.style_scheme_chooser.StyleSchemeChooser]
template StyleSchemeChooserGidBuilderT()
{

  /**
      Set `styleScheme` property.
      Params:
        propval = The :style-scheme property contains the currently selected style
          scheme. The property can be set to change
          the current selection programmatically.
      Returns: Builder instance for fluent chaining
  */
  T styleScheme(gid.gtksource4.style_scheme.StyleScheme propval) nothrow
  {
    return setProperty("style-scheme", propval);
  }
}
