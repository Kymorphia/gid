/// Module for [Paintable] interface mixin
module gid.gdk4.paintable_mixin;

public import gid.core.basictypes;
public import gid.gdk4.paintable;
public import gid.gdk4.paintable_iface_proxy;
public import gid.core.utils;
public import gid.gdk4.c.functions;
public import gid.gdk4.c.types;
public import gid.gdk4.snapshot;
public import gid.gdk4.types;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.dclosure;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;

/**
    An interface for content that can be painted.
    
    The content of a [gid.gdk4.paintable.Paintable] can be painted anywhere at any size
    without requiring any sort of layout. The interface is inspired by
    similar concepts elsewhere, such as
    [ClutterContent](https://developer.gnome.org/clutter/stable/ClutterContent.html),
    [HTML/CSS Paint Sources](https://www.w3.org/TR/css-images-4/#paint-source),
    or [SVG Paint Servers](https://www.w3.org/TR/SVG2/pservers.html).
    
    A [gid.gdk4.paintable.Paintable] can be snapshot at any time and size using
    [gid.gdk4.paintable.Paintable.snapshot]. How the paintable interprets that size and
    if it scales or centers itself into the given rectangle is implementation
    defined, though if you are implementing a [gid.gdk4.paintable.Paintable] and don't know what
    to do, it is suggested that you scale your paintable ignoring any potential
    aspect ratio.
    
    The contents that a [gid.gdk4.paintable.Paintable] produces may depend on the [gid.gdk4.snapshot.Snapshot]
    passed to it. For example, paintables may decide to use more detailed images
    on higher resolution screens or when OpenGL is available. A [gid.gdk4.paintable.Paintable]
    will however always produce the same output for the same snapshot.
    
    A [gid.gdk4.paintable.Paintable] may change its contents, meaning that it will now produce
    a different output with the same snapshot. Once that happens, it will call
    [gid.gdk4.paintable.Paintable.invalidateContents] which will emit the
    [gid.gdk4.paintable.Paintable.invalidateContents] signal. If a paintable is known
    to never change its contents, it will set the [gid.gdk4.types.PaintableFlags.StaticContents]
    flag. If a consumer cannot deal with changing contents, it may call
    [gid.gdk4.paintable.Paintable.getCurrentImage] which will return a static
    paintable and use that.
    
    A paintable can report an intrinsic (or preferred) size or aspect ratio it
    wishes to be rendered at, though it doesn't have to. Consumers of the interface
    can use this information to layout thepaintable appropriately. Just like the
    contents, the size of a paintable can change. A paintable will indicate this
    by calling [gid.gdk4.paintable.Paintable.invalidateSize] which will emit the
    [gid.gdk4.paintable.Paintable.invalidateSize] signal. And just like for contents,
    if a paintable is known to never change its size, it will set the
    [gid.gdk4.types.PaintableFlags.StaticSize] flag.
    
    Besides API for applications, there are some functions that are only
    useful for implementing subclasses and should not be used by applications:
    [gid.gdk4.paintable.Paintable.invalidateContents],
    [gid.gdk4.paintable.Paintable.invalidateSize],
    [gid.gdk4.paintable.Paintable.newEmpty].
*/
template PaintableT()
{


  /**
      Gets an immutable paintable for the current contents displayed by paintable.
      
      This is useful when you want to retain the current state of an animation,
      for example to take a screenshot of a running animation.
      
      If the paintable is already immutable, it will return itself.
      Returns: An immutable paintable for the current
          contents of paintable
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetCurrentImage`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gdk4.paintable.Paintable vfuncGetCurrentImage()
  {
    auto _klass = cast(GdkPaintableInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gdk4.paintable.Paintable._getGType);
    if (!_klass || !_klass.getCurrentImage)
      return typeof(return).init;

    GdkPaintable* _cretval;
    _cretval = _klass.getCurrentImage(cast(GdkPaintable*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.paintable.Paintable)(cast(GdkPaintable*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Get flags for the paintable.
      
      This is oftentimes useful for optimizations.
      
      See [gid.gdk4.types.PaintableFlags] for the flags and what they mean.
      Returns: The [gid.gdk4.types.PaintableFlags] for this paintable
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetFlags`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gdk4.types.PaintableFlags vfuncGetFlags()
  {
    auto _klass = cast(GdkPaintableInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gdk4.paintable.Paintable._getGType);
    if (!_klass || !_klass.getFlags)
      return typeof(return).init;

    GdkPaintableFlags _cretval;
    _cretval = _klass.getFlags(cast(GdkPaintable*)this._cPtr);
    gid.gdk4.types.PaintableFlags _retval = cast(gid.gdk4.types.PaintableFlags)_cretval;
    return _retval;
  }

  /**
      Gets the preferred aspect ratio the paintable would like to be displayed at.
      
      The aspect ratio is the width divided by the height, so a value of 0.5
      means that the paintable prefers to be displayed twice as high as it
      is wide. Consumers of this interface can use this to preserve aspect
      ratio when displaying the paintable.
      
      This is a purely informational value and does not in any way limit the
      values that may be passed to [gid.gdk4.paintable.Paintable.snapshot].
      
      Usually when a paintable returns nonzero values from
      [gid.gdk4.paintable.Paintable.getIntrinsicWidth] and
      [gid.gdk4.paintable.Paintable.getIntrinsicHeight] the aspect ratio
      should conform to those values, though that is not required.
      
      If the paintable does not have a preferred aspect ratio,
      it returns 0. Negative values are never returned.
      Returns: the intrinsic aspect ratio of paintable or 0 if none.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetIntrinsicAspectRatio`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected double vfuncGetIntrinsicAspectRatio()
  {
    auto _klass = cast(GdkPaintableInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gdk4.paintable.Paintable._getGType);
    if (!_klass || !_klass.getIntrinsicAspectRatio)
      return typeof(return).init;

    double _retval;
    _retval = _klass.getIntrinsicAspectRatio(cast(GdkPaintable*)this._cPtr);
    return _retval;
  }

  /**
      Gets the preferred height the paintable would like to be displayed at.
      
      Consumers of this interface can use this to reserve enough space to draw
      the paintable.
      
      This is a purely informational value and does not in any way limit the
      values that may be passed to [gid.gdk4.paintable.Paintable.snapshot].
      
      If the paintable does not have a preferred height, it returns 0.
      Negative values are never returned.
      Returns: the intrinsic height of paintable or 0 if none.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetIntrinsicHeight`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected int vfuncGetIntrinsicHeight()
  {
    auto _klass = cast(GdkPaintableInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gdk4.paintable.Paintable._getGType);
    if (!_klass || !_klass.getIntrinsicHeight)
      return typeof(return).init;

    int _retval;
    _retval = _klass.getIntrinsicHeight(cast(GdkPaintable*)this._cPtr);
    return _retval;
  }

  /**
      Gets the preferred width the paintable would like to be displayed at.
      
      Consumers of this interface can use this to reserve enough space to draw
      the paintable.
      
      This is a purely informational value and does not in any way limit the
      values that may be passed to [gid.gdk4.paintable.Paintable.snapshot].
      
      If the paintable does not have a preferred width, it returns 0.
      Negative values are never returned.
      Returns: the intrinsic width of paintable or 0 if none.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetIntrinsicWidth`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected int vfuncGetIntrinsicWidth()
  {
    auto _klass = cast(GdkPaintableInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gdk4.paintable.Paintable._getGType);
    if (!_klass || !_klass.getIntrinsicWidth)
      return typeof(return).init;

    int _retval;
    _retval = _klass.getIntrinsicWidth(cast(GdkPaintable*)this._cPtr);
    return _retval;
  }

  /**
      Snapshots the given paintable with the given width and height.
      
      The paintable is drawn at the current (0,0) offset of the snapshot.
      If width and height are not larger than zero, this function will
      do nothing.
  
      Params:
        snapshot = a [gid.gdk4.snapshot.Snapshot] to snapshot to
        width = width to snapshot in
        height = height to snapshot in
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSnapshot`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncSnapshot(gid.gdk4.snapshot.Snapshot snapshot, double width, double height)
  {
    auto _klass = cast(GdkPaintableInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gdk4.paintable.Paintable._getGType);
    if (!_klass || !_klass.snapshot)
      return;

    _klass.snapshot(cast(GdkPaintable*)this._cPtr, snapshot ? cast(GdkSnapshot*)snapshot._cPtr(No.Dup) : null, width, height);
  }

  /**
      Compute a concrete size for the [gid.gdk4.paintable.Paintable].
      
      Applies the sizing algorithm outlined in the
      [CSS Image spec](https://drafts.csswg.org/css-images-3/#default-sizing)
      to the given paintable. See that link for more details.
      
      It is not necessary to call this function when both specified_width
      and specified_height are known, but it is useful to call this
      function in GtkWidget:measure implementations to compute the
      other dimension when only one dimension is given.
  
      Params:
        specifiedWidth = the width paintable could be drawn into or
            0.0 if unknown
        specifiedHeight = the height paintable could be drawn into or
            0.0 if unknown
        defaultWidth = the width paintable would be drawn into if
            no other constraints were given
        defaultHeight = the height paintable would be drawn into if
            no other constraints were given
        concreteWidth = will be set to the concrete width computed
        concreteHeight = will be set to the concrete height computed
  */
  override void computeConcreteSize(double specifiedWidth, double specifiedHeight, double defaultWidth, double defaultHeight, out double concreteWidth, out double concreteHeight) nothrow
  {
    gdk_paintable_compute_concrete_size(cast(GdkPaintable*)this._cPtr, specifiedWidth, specifiedHeight, defaultWidth, defaultHeight, cast(double*)&concreteWidth, cast(double*)&concreteHeight);
  }

  /**
      Gets an immutable paintable for the current contents displayed by paintable.
      
      This is useful when you want to retain the current state of an animation,
      for example to take a screenshot of a running animation.
      
      If the paintable is already immutable, it will return itself.
      Returns: An immutable paintable for the current
          contents of paintable
  */
  override gid.gdk4.paintable.Paintable getCurrentImage() nothrow
  {
    GdkPaintable* _cretval;
    _cretval = gdk_paintable_get_current_image(cast(GdkPaintable*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.paintable.Paintable)(cast(GdkPaintable*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Get flags for the paintable.
      
      This is oftentimes useful for optimizations.
      
      See [gid.gdk4.types.PaintableFlags] for the flags and what they mean.
      Returns: The [gid.gdk4.types.PaintableFlags] for this paintable
  */
  override gid.gdk4.types.PaintableFlags getFlags() nothrow
  {
    GdkPaintableFlags _cretval;
    _cretval = gdk_paintable_get_flags(cast(GdkPaintable*)this._cPtr);
    gid.gdk4.types.PaintableFlags _retval = cast(gid.gdk4.types.PaintableFlags)_cretval;
    return _retval;
  }

  /**
      Gets the preferred aspect ratio the paintable would like to be displayed at.
      
      The aspect ratio is the width divided by the height, so a value of 0.5
      means that the paintable prefers to be displayed twice as high as it
      is wide. Consumers of this interface can use this to preserve aspect
      ratio when displaying the paintable.
      
      This is a purely informational value and does not in any way limit the
      values that may be passed to [gid.gdk4.paintable.Paintable.snapshot].
      
      Usually when a paintable returns nonzero values from
      [gid.gdk4.paintable.Paintable.getIntrinsicWidth] and
      [gid.gdk4.paintable.Paintable.getIntrinsicHeight] the aspect ratio
      should conform to those values, though that is not required.
      
      If the paintable does not have a preferred aspect ratio,
      it returns 0. Negative values are never returned.
      Returns: the intrinsic aspect ratio of paintable or 0 if none.
  */
  override double getIntrinsicAspectRatio() nothrow
  {
    double _retval;
    _retval = gdk_paintable_get_intrinsic_aspect_ratio(cast(GdkPaintable*)this._cPtr);
    return _retval;
  }

  /**
      Gets the preferred height the paintable would like to be displayed at.
      
      Consumers of this interface can use this to reserve enough space to draw
      the paintable.
      
      This is a purely informational value and does not in any way limit the
      values that may be passed to [gid.gdk4.paintable.Paintable.snapshot].
      
      If the paintable does not have a preferred height, it returns 0.
      Negative values are never returned.
      Returns: the intrinsic height of paintable or 0 if none.
  */
  override int getIntrinsicHeight() nothrow
  {
    int _retval;
    _retval = gdk_paintable_get_intrinsic_height(cast(GdkPaintable*)this._cPtr);
    return _retval;
  }

  /**
      Gets the preferred width the paintable would like to be displayed at.
      
      Consumers of this interface can use this to reserve enough space to draw
      the paintable.
      
      This is a purely informational value and does not in any way limit the
      values that may be passed to [gid.gdk4.paintable.Paintable.snapshot].
      
      If the paintable does not have a preferred width, it returns 0.
      Negative values are never returned.
      Returns: the intrinsic width of paintable or 0 if none.
  */
  override int getIntrinsicWidth() nothrow
  {
    int _retval;
    _retval = gdk_paintable_get_intrinsic_width(cast(GdkPaintable*)this._cPtr);
    return _retval;
  }

  /**
      Called by implementations of [gid.gdk4.paintable.Paintable] to invalidate their contents.
      
      Unless the contents are invalidated, implementations must guarantee that
      multiple calls of [gid.gdk4.paintable.Paintable.snapshot] produce the same output.
      
      This function will emit the [gid.gdk4.paintable.Paintable.invalidateContents]
      signal.
      
      If a paintable reports the [gid.gdk4.types.PaintableFlags.StaticContents] flag,
      it must not call this function.
  */
  override void invalidateContents() nothrow
  {
    gdk_paintable_invalidate_contents(cast(GdkPaintable*)this._cPtr);
  }

  /**
      Called by implementations of [gid.gdk4.paintable.Paintable] to invalidate their size.
      
      As long as the size is not invalidated, paintable must return the same
      values for its intrinsic width, height and aspect ratio.
      
      This function will emit the [gid.gdk4.paintable.Paintable.invalidateSize]
      signal.
      
      If a paintable reports the [gid.gdk4.types.PaintableFlags.StaticSize] flag,
      it must not call this function.
  */
  override void invalidateSize() nothrow
  {
    gdk_paintable_invalidate_size(cast(GdkPaintable*)this._cPtr);
  }

  /**
      Snapshots the given paintable with the given width and height.
      
      The paintable is drawn at the current (0,0) offset of the snapshot.
      If width and height are not larger than zero, this function will
      do nothing.
  
      Params:
        snapshot = a [gid.gdk4.snapshot.Snapshot] to snapshot to
        width = width to snapshot in
        height = height to snapshot in
  */
  override void snapshot(gid.gdk4.snapshot.Snapshot snapshot, double width, double height) nothrow
  {
    gdk_paintable_snapshot(cast(GdkPaintable*)this._cPtr, snapshot ? cast(GdkSnapshot*)snapshot._cPtr(No.Dup) : null, width, height);
  }

  /**
      Connect to `InvalidateContents` signal.
  
      Emitted when the contents of the paintable change.
        
        Examples for such an event would be videos changing to the next frame or
        the icon theme for an icon changing.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gdk4.paintable.Paintable paintable)`
  
          `paintable` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectInvalidateContents(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gdk4.paintable.Paintable)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gdk4.paintable.Paintable.invalidateContents");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("invalidate-contents", closure, after);
  }

  /**
      Connect to `InvalidateSize` signal.
  
      Emitted when the intrinsic size of the paintable changes.
        
        This means the values reported by at least one of
        [gid.gdk4.paintable.Paintable.getIntrinsicWidth],
        [gid.gdk4.paintable.Paintable.getIntrinsicHeight] or
        [gid.gdk4.paintable.Paintable.getIntrinsicAspectRatio]
        has changed.
        
        Examples for such an event would be a paintable displaying
        the contents of a toplevel surface being resized.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gdk4.paintable.Paintable paintable)`
  
          `paintable` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectInvalidateSize(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gdk4.paintable.Paintable)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gdk4.paintable.Paintable.invalidateSize");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("invalidate-size", closure, after);
  }

  /// True if the D class T overrides any vfunc method of gid.gdk4.paintable.Paintable (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gdk4_paintable_Paintable(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetCurrentImage", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetFlags", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetIntrinsicAspectRatio", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetIntrinsicHeight", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetIntrinsicWidth", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSnapshot", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gdk4.paintable.Paintable vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gdk4_paintable_Paintable(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetCurrentImage", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gdk4_paintable_Paintable(iface, "get_current_image");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetFlags", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gdk4_paintable_Paintable(iface, "get_flags");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetIntrinsicAspectRatio", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gdk4_paintable_Paintable(iface, "get_intrinsic_aspect_ratio");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetIntrinsicHeight", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gdk4_paintable_Paintable(iface, "get_intrinsic_height");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetIntrinsicWidth", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gdk4_paintable_Paintable(iface, "get_intrinsic_width");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSnapshot", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gdk4_paintable_Paintable(iface, "snapshot");
  }

  private static void _installIfaceVfunc_gid_gdk4_paintable_Paintable(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GdkPaintableInterface*)iface;

    switch (vfunc)
    {
      case "get_current_image":
      {
        static extern(C) GdkPaintable* _vfuncGetCurrentImageTramp(GdkPaintable* paintable) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)paintable);
          if (!_obj)
          {
            auto _klass = cast(GdkPaintableInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)paintable), gid.gdk4.paintable.Paintable._getGType);
            if (_klass && _klass.getCurrentImage)
              return (cast(typeof(&_vfuncGetCurrentImageTramp))_klass.getCurrentImage)(paintable);
            return typeof(return).init;
          }

          gid.gdk4.paintable.Paintable _dretval;

          try
          {
            _dretval = _obj.vfuncGetCurrentImage();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gdk4.paintable.Paintable.vfuncGetCurrentImage");
          }
          auto _retval = _dretval ? cast(GdkPaintable*)(cast(gid.gobject2.object.ObjectWrap)_dretval)._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getCurrentImage = cast(typeof(_klass.getCurrentImage))&_vfuncGetCurrentImageTramp;
        break;
      }
      case "get_flags":
      {
        static extern(C) GdkPaintableFlags _vfuncGetFlagsTramp(GdkPaintable* paintable) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)paintable);
          if (!_obj)
          {
            auto _klass = cast(GdkPaintableInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)paintable), gid.gdk4.paintable.Paintable._getGType);
            if (_klass && _klass.getFlags)
              return (cast(typeof(&_vfuncGetFlagsTramp))_klass.getFlags)(paintable);
            return typeof(return).init;
          }

          gid.gdk4.types.PaintableFlags _dretval;

          try
          {
            _dretval = _obj.vfuncGetFlags();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gdk4.paintable.Paintable.vfuncGetFlags");
          }
          auto _retval = cast(GdkPaintableFlags)_dretval;

          return _retval;
        }

        _klass.getFlags = cast(typeof(_klass.getFlags))&_vfuncGetFlagsTramp;
        break;
      }
      case "get_intrinsic_aspect_ratio":
      {
        static extern(C) double _vfuncGetIntrinsicAspectRatioTramp(GdkPaintable* paintable) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)paintable);
          if (!_obj)
          {
            auto _klass = cast(GdkPaintableInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)paintable), gid.gdk4.paintable.Paintable._getGType);
            if (_klass && _klass.getIntrinsicAspectRatio)
              return (cast(typeof(&_vfuncGetIntrinsicAspectRatioTramp))_klass.getIntrinsicAspectRatio)(paintable);
            return typeof(return).init;
          }

          double _retval;

          try
          {
            _retval = _obj.vfuncGetIntrinsicAspectRatio();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gdk4.paintable.Paintable.vfuncGetIntrinsicAspectRatio");
          }
          return _retval;
        }

        _klass.getIntrinsicAspectRatio = cast(typeof(_klass.getIntrinsicAspectRatio))&_vfuncGetIntrinsicAspectRatioTramp;
        break;
      }
      case "get_intrinsic_height":
      {
        static extern(C) int _vfuncGetIntrinsicHeightTramp(GdkPaintable* paintable) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)paintable);
          if (!_obj)
          {
            auto _klass = cast(GdkPaintableInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)paintable), gid.gdk4.paintable.Paintable._getGType);
            if (_klass && _klass.getIntrinsicHeight)
              return (cast(typeof(&_vfuncGetIntrinsicHeightTramp))_klass.getIntrinsicHeight)(paintable);
            return typeof(return).init;
          }

          int _retval;

          try
          {
            _retval = _obj.vfuncGetIntrinsicHeight();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gdk4.paintable.Paintable.vfuncGetIntrinsicHeight");
          }
          return _retval;
        }

        _klass.getIntrinsicHeight = cast(typeof(_klass.getIntrinsicHeight))&_vfuncGetIntrinsicHeightTramp;
        break;
      }
      case "get_intrinsic_width":
      {
        static extern(C) int _vfuncGetIntrinsicWidthTramp(GdkPaintable* paintable) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)paintable);
          if (!_obj)
          {
            auto _klass = cast(GdkPaintableInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)paintable), gid.gdk4.paintable.Paintable._getGType);
            if (_klass && _klass.getIntrinsicWidth)
              return (cast(typeof(&_vfuncGetIntrinsicWidthTramp))_klass.getIntrinsicWidth)(paintable);
            return typeof(return).init;
          }

          int _retval;

          try
          {
            _retval = _obj.vfuncGetIntrinsicWidth();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gdk4.paintable.Paintable.vfuncGetIntrinsicWidth");
          }
          return _retval;
        }

        _klass.getIntrinsicWidth = cast(typeof(_klass.getIntrinsicWidth))&_vfuncGetIntrinsicWidthTramp;
        break;
      }
      case "snapshot":
      {
        static extern(C) void _vfuncSnapshotTramp(GdkPaintable* paintable, GdkSnapshot* snapshot, double width, double height) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)paintable);
          if (!_obj)
          {
            auto _klass = cast(GdkPaintableInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)paintable), gid.gdk4.paintable.Paintable._getGType);
            if (_klass && _klass.snapshot)
              return (cast(typeof(&_vfuncSnapshotTramp))_klass.snapshot)(paintable, snapshot, width, height);
            return;
          }

          try
          {
            _obj.vfuncSnapshot(gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.snapshot.Snapshot)(cast(void*)snapshot, No.Take), width, height);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gdk4.paintable.Paintable.vfuncSnapshot");
          }
        }

        _klass.snapshot = cast(typeof(_klass.snapshot))&_vfuncSnapshotTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gdk4.paintable.Paintable]
template PaintableGidBuilderT()
{
}
