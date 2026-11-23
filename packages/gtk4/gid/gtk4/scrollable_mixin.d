/// Module for [Scrollable] interface mixin
module gid.gtk4.scrollable_mixin;

public import gid.core.basictypes;
public import gid.gtk4.scrollable_iface_proxy;
public import gid.core.utils;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gtk4.adjustment;
public import gid.gtk4.border;
public import gid.gtk4.c.functions;
public import gid.gtk4.c.types;
public import gid.gtk4.types;

/**
    An interface for widgets with native scrolling ability.
    
    To implement this interface you should override the
    [gid.gtk4.scrollable.Scrollable.hadjustment] and
    [gid.gtk4.scrollable.Scrollable.vadjustment] properties.
    
    ## Creating a scrollable widget
    
    All scrollable widgets should do the following.
    
    - When a parent widget sets the scrollable child widget’s adjustments,
      the widget should connect to the [gid.gtk4.adjustment.Adjustment.valueChanged]
      signal. The child widget should then populate the adjustments’ properties
      as soon as possible, which usually means queueing an allocation right away
      and populating the properties in the `vfunc@Gtk.Widget.size_allocate`
      implementation.
    
    - Because its preferred size is the size for a fully expanded widget,
      the scrollable widget must be able to cope with underallocations.
      This means that it must accept any value passed to its
      `vfunc@Gtk.Widget.size_allocate` implementation.
    
    - When the parent allocates space to the scrollable child widget,
      the widget must ensure the adjustments’ property values are correct and up
      to date, for example using [gid.gtk4.adjustment.Adjustment.configure].
    
    - When any of the adjustments emits the [gid.gtk4.adjustment.Adjustment.valueChanged]
      signal, the scrollable widget should scroll its contents.
*/
template ScrollableT()
{

  /**
      Get `hadjustment` property.
      Returns: Horizontal [gid.gtk4.adjustment.Adjustment] of the scrollable widget.
        
        This adjustment is shared between the scrollable widget and its parent.
  */
  @property gid.gtk4.adjustment.Adjustment hadjustment() nothrow
  {
    return getHadjustment();
  }

  /**
      Set `hadjustment` property.
      Params:
        propval = Horizontal [gid.gtk4.adjustment.Adjustment] of the scrollable widget.
          
          This adjustment is shared between the scrollable widget and its parent.
  */
  @property void hadjustment(gid.gtk4.adjustment.Adjustment propval) nothrow
  {
    setHadjustment(propval);
  }

  /**
      Get `hscrollPolicy` property.
      Returns: Determines when horizontal scrolling should start.
  */
  @property gid.gtk4.types.ScrollablePolicy hscrollPolicy() nothrow
  {
    return getHscrollPolicy();
  }

  /**
      Set `hscrollPolicy` property.
      Params:
        propval = Determines when horizontal scrolling should start.
  */
  @property void hscrollPolicy(gid.gtk4.types.ScrollablePolicy propval) nothrow
  {
    setHscrollPolicy(propval);
  }

  /**
      Get `vadjustment` property.
      Returns: Vertical [gid.gtk4.adjustment.Adjustment] of the scrollable widget.
        
        This adjustment is shared between the scrollable widget and its parent.
  */
  @property gid.gtk4.adjustment.Adjustment vadjustment() nothrow
  {
    return getVadjustment();
  }

  /**
      Set `vadjustment` property.
      Params:
        propval = Vertical [gid.gtk4.adjustment.Adjustment] of the scrollable widget.
          
          This adjustment is shared between the scrollable widget and its parent.
  */
  @property void vadjustment(gid.gtk4.adjustment.Adjustment propval) nothrow
  {
    setVadjustment(propval);
  }

  /**
      Get `vscrollPolicy` property.
      Returns: Determines when vertical scrolling should start.
  */
  @property gid.gtk4.types.ScrollablePolicy vscrollPolicy() nothrow
  {
    return getVscrollPolicy();
  }

  /**
      Set `vscrollPolicy` property.
      Params:
        propval = Determines when vertical scrolling should start.
  */
  @property void vscrollPolicy(gid.gtk4.types.ScrollablePolicy propval) nothrow
  {
    setVscrollPolicy(propval);
  }

  /**
      Returns the size of a non-scrolling border around the
      outside of the scrollable.
      
      An example for this would be treeview headers. GTK can use
      this information to display overlaid graphics, like the
      overshoot indication, at the right position.
  
      Params:
        border = return location for the results
      Returns: true if border has been set
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetBorder`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncGetBorder(out gid.gtk4.border.Border border)
  {
    auto _klass = cast(GtkScrollableInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.scrollable.Scrollable._getGType);
    if (!_klass || !_klass.getBorder)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.getBorder(cast(GtkScrollable*)this._cPtr, cast(GtkBorder*)&border);
    return _retval;
  }

  /**
      Returns the size of a non-scrolling border around the
      outside of the scrollable.
      
      An example for this would be treeview headers. GTK can use
      this information to display overlaid graphics, like the
      overshoot indication, at the right position.
  
      Params:
        border = return location for the results
      Returns: true if border has been set
  */
  override bool getBorder(out gid.gtk4.border.Border border) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_scrollable_get_border(cast(GtkScrollable*)this._cPtr, cast(GtkBorder*)&border);
    return _retval;
  }

  /**
      Retrieves the [gid.gtk4.adjustment.Adjustment] used for horizontal scrolling.
      Returns: horizontal [gid.gtk4.adjustment.Adjustment].
  */
  override gid.gtk4.adjustment.Adjustment getHadjustment() nothrow
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_scrollable_get_hadjustment(cast(GtkScrollable*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the horizontal [gid.gtk4.types.ScrollablePolicy].
      Returns: The horizontal [gid.gtk4.types.ScrollablePolicy].
  */
  override gid.gtk4.types.ScrollablePolicy getHscrollPolicy() nothrow
  {
    GtkScrollablePolicy _cretval;
    _cretval = gtk_scrollable_get_hscroll_policy(cast(GtkScrollable*)this._cPtr);
    gid.gtk4.types.ScrollablePolicy _retval = cast(gid.gtk4.types.ScrollablePolicy)_cretval;
    return _retval;
  }

  /**
      Retrieves the [gid.gtk4.adjustment.Adjustment] used for vertical scrolling.
      Returns: vertical [gid.gtk4.adjustment.Adjustment].
  */
  override gid.gtk4.adjustment.Adjustment getVadjustment() nothrow
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_scrollable_get_vadjustment(cast(GtkScrollable*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the vertical [gid.gtk4.types.ScrollablePolicy].
      Returns: The vertical [gid.gtk4.types.ScrollablePolicy].
  */
  override gid.gtk4.types.ScrollablePolicy getVscrollPolicy() nothrow
  {
    GtkScrollablePolicy _cretval;
    _cretval = gtk_scrollable_get_vscroll_policy(cast(GtkScrollable*)this._cPtr);
    gid.gtk4.types.ScrollablePolicy _retval = cast(gid.gtk4.types.ScrollablePolicy)_cretval;
    return _retval;
  }

  /**
      Sets the horizontal adjustment of the [gid.gtk4.scrollable.Scrollable].
  
      Params:
        hadjustment = a [gid.gtk4.adjustment.Adjustment]
  */
  override void setHadjustment(gid.gtk4.adjustment.Adjustment hadjustment = null) nothrow
  {
    gtk_scrollable_set_hadjustment(cast(GtkScrollable*)this._cPtr, hadjustment ? cast(GtkAdjustment*)hadjustment._cPtr(No.Dup) : null);
  }

  /**
      Sets the [gid.gtk4.types.ScrollablePolicy].
      
      The policy determines whether horizontal scrolling should start
      below the minimum width or below the natural width.
  
      Params:
        policy = the horizontal [gid.gtk4.types.ScrollablePolicy]
  */
  override void setHscrollPolicy(gid.gtk4.types.ScrollablePolicy policy) nothrow
  {
    gtk_scrollable_set_hscroll_policy(cast(GtkScrollable*)this._cPtr, policy);
  }

  /**
      Sets the vertical adjustment of the [gid.gtk4.scrollable.Scrollable].
  
      Params:
        vadjustment = a [gid.gtk4.adjustment.Adjustment]
  */
  override void setVadjustment(gid.gtk4.adjustment.Adjustment vadjustment = null) nothrow
  {
    gtk_scrollable_set_vadjustment(cast(GtkScrollable*)this._cPtr, vadjustment ? cast(GtkAdjustment*)vadjustment._cPtr(No.Dup) : null);
  }

  /**
      Sets the [gid.gtk4.types.ScrollablePolicy].
      
      The policy determines whether vertical scrolling should start
      below the minimum height or below the natural height.
  
      Params:
        policy = the vertical [gid.gtk4.types.ScrollablePolicy]
  */
  override void setVscrollPolicy(gid.gtk4.types.ScrollablePolicy policy) nothrow
  {
    gtk_scrollable_set_vscroll_policy(cast(GtkScrollable*)this._cPtr, policy);
  }

  /// True if the D class T overrides any vfunc method of gid.gtk4.scrollable.Scrollable (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gtk4_scrollable_Scrollable(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetBorder", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gtk4.scrollable.Scrollable vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gtk4_scrollable_Scrollable(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetBorder", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_scrollable_Scrollable(iface, "get_border");
  }

  private static void _installIfaceVfunc_gid_gtk4_scrollable_Scrollable(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GtkScrollableInterface*)iface;

    switch (vfunc)
    {
      case "get_border":
      {
        static extern(C) gboolean _vfuncGetBorderTramp(GtkScrollable* scrollable, GtkBorder* border) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)scrollable);
          if (!_obj)
          {
            auto _klass = cast(GtkScrollableInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)scrollable), gid.gtk4.scrollable.Scrollable._getGType);
            if (_klass && _klass.getBorder)
              return (cast(typeof(&_vfuncGetBorderTramp))_klass.getBorder)(scrollable, border);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncGetBorder(*cast(gid.gtk4.border.Border*)border);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.scrollable.Scrollable.vfuncGetBorder");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.getBorder = cast(typeof(_klass.getBorder))&_vfuncGetBorderTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk4.scrollable.Scrollable]
template ScrollableGidBuilderT()
{

  /**
      Set `hadjustment` property.
      Params:
        propval = Horizontal [gid.gtk4.adjustment.Adjustment] of the scrollable widget.
          
          This adjustment is shared between the scrollable widget and its parent.
      Returns: Builder instance for fluent chaining
  */
  T hadjustment(gid.gtk4.adjustment.Adjustment propval) nothrow
  {
    return setProperty("hadjustment", propval);
  }

  /**
      Set `hscrollPolicy` property.
      Params:
        propval = Determines when horizontal scrolling should start.
      Returns: Builder instance for fluent chaining
  */
  T hscrollPolicy(gid.gtk4.types.ScrollablePolicy propval) nothrow
  {
    return setProperty("hscroll-policy", propval);
  }

  /**
      Set `vadjustment` property.
      Params:
        propval = Vertical [gid.gtk4.adjustment.Adjustment] of the scrollable widget.
          
          This adjustment is shared between the scrollable widget and its parent.
      Returns: Builder instance for fluent chaining
  */
  T vadjustment(gid.gtk4.adjustment.Adjustment propval) nothrow
  {
    return setProperty("vadjustment", propval);
  }

  /**
      Set `vscrollPolicy` property.
      Params:
        propval = Determines when vertical scrolling should start.
      Returns: Builder instance for fluent chaining
  */
  T vscrollPolicy(gid.gtk4.types.ScrollablePolicy propval) nothrow
  {
    return setProperty("vscroll-policy", propval);
  }
}
