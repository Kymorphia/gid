/// Module for [Image] interface mixin
module gid.atk1.image_mixin;

public import gid.core.basictypes;
public import gid.atk1.image;
public import gid.atk1.image_iface_proxy;
public import gid.atk1.c.functions;
public import gid.atk1.c.types;
public import gid.atk1.types;
public import gid.core.utils;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;

/**
    The ATK Interface implemented by components
     which expose image or pixmap content on-screen.
    
    #AtkImage should be implemented by #AtkObject subtypes on behalf of
    components which display image/pixmap information onscreen, and
    which provide information (other than just widget borders, etc.)
    via that image content.  For instance, icons, buttons with icons,
    toolbar elements, and image viewing panes typically should
    implement #AtkImage.
    
    #AtkImage primarily provides two types of information: coordinate
    information (useful for screen review mode of screenreaders, and
    for use by onscreen magnifiers), and descriptive information.  The
    descriptive information is provided for alternative, text-only
    presentation of the most significant information present in the
    image.
*/
template ImageT()
{

  /**
      Get a textual description of this image.
      Returns: a string representing the image description
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetImageDescription`
      to chain up from an override.
      Overriding it from D is not supported (callback string return value with transfer none is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetImageDescription()
  {
    auto _klass = cast(AtkImageIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.image.Image._getGType);
    if (!_klass || !_klass.getImageDescription)
      return typeof(return).init;

    const(char)* _cretval;
    _cretval = _klass.getImageDescription(cast(AtkImage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Retrieves the locale identifier associated to the #AtkImage.
      Returns: a string corresponding to the POSIX
          `LC_MESSAGES` locale used by the image description, or
          null if the image does not specify a locale.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetImageLocale`
      to chain up from an override.
      Overriding it from D is not supported (callback string return value with transfer none is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetImageLocale()
  {
    auto _klass = cast(AtkImageIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.image.Image._getGType);
    if (!_klass || !_klass.getImageLocale)
      return typeof(return).init;

    const(char)* _cretval;
    _cretval = _klass.getImageLocale(cast(AtkImage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the position of the image in the form of a point specifying the
      images top-left corner.
      
      If the position can not be obtained (e.g. missing support), x and y are set
      to -1.
  
      Params:
        x = address of #gint to put x coordinate position; otherwise, -1 if value cannot be obtained.
        y = address of #gint to put y coordinate position; otherwise, -1 if value cannot be obtained.
        coordType = specifies whether the coordinates are relative to the screen
          or to the components top level window
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetImagePosition`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncGetImagePosition(out int x, out int y, gid.atk1.types.CoordType coordType)
  {
    auto _klass = cast(AtkImageIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.image.Image._getGType);
    if (!_klass || !_klass.getImagePosition)
      return;

    _klass.getImagePosition(cast(AtkImage*)this._cPtr, cast(int*)&x, cast(int*)&y, coordType);
  }

  /**
      Get the width and height in pixels for the specified image.
      The values of width and height are returned as -1 if the
      values cannot be obtained (for instance, if the object is not onscreen).
      
      If the size can not be obtained (e.g. missing support), x and y are set
      to -1.
  
      Params:
        width = filled with the image width, or -1 if the value cannot be obtained.
        height = filled with the image height, or -1 if the value cannot be obtained.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetImageSize`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncGetImageSize(out int width, out int height)
  {
    auto _klass = cast(AtkImageIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.image.Image._getGType);
    if (!_klass || !_klass.getImageSize)
      return;

    _klass.getImageSize(cast(AtkImage*)this._cPtr, cast(int*)&width, cast(int*)&height);
  }

  /**
      Sets the textual description for this image.
  
      Params:
        description = a string description to set for image
      Returns: boolean TRUE, or FALSE if operation could
        not be completed.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetImageDescription`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncSetImageDescription(string description)
  {
    auto _klass = cast(AtkImageIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.image.Image._getGType);
    if (!_klass || !_klass.setImageDescription)
      return typeof(return).init;

    bool _retval;
    const(char)* _description = description.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)_klass.setImageDescription(cast(AtkImage*)this._cPtr, _description);
    return _retval;
  }

  /**
      Get a textual description of this image.
      Returns: a string representing the image description
  */
  override string getImageDescription() nothrow
  {
    const(char)* _cretval;
    _cretval = atk_image_get_image_description(cast(AtkImage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Retrieves the locale identifier associated to the #AtkImage.
      Returns: a string corresponding to the POSIX
          `LC_MESSAGES` locale used by the image description, or
          null if the image does not specify a locale.
  */
  override string getImageLocale() nothrow
  {
    const(char)* _cretval;
    _cretval = atk_image_get_image_locale(cast(AtkImage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the position of the image in the form of a point specifying the
      images top-left corner.
      
      If the position can not be obtained (e.g. missing support), x and y are set
      to -1.
  
      Params:
        x = address of #gint to put x coordinate position; otherwise, -1 if value cannot be obtained.
        y = address of #gint to put y coordinate position; otherwise, -1 if value cannot be obtained.
        coordType = specifies whether the coordinates are relative to the screen
          or to the components top level window
  */
  override void getImagePosition(out int x, out int y, gid.atk1.types.CoordType coordType) nothrow
  {
    atk_image_get_image_position(cast(AtkImage*)this._cPtr, cast(int*)&x, cast(int*)&y, coordType);
  }

  /**
      Get the width and height in pixels for the specified image.
      The values of width and height are returned as -1 if the
      values cannot be obtained (for instance, if the object is not onscreen).
      
      If the size can not be obtained (e.g. missing support), x and y are set
      to -1.
  
      Params:
        width = filled with the image width, or -1 if the value cannot be obtained.
        height = filled with the image height, or -1 if the value cannot be obtained.
  */
  override void getImageSize(out int width, out int height) nothrow
  {
    atk_image_get_image_size(cast(AtkImage*)this._cPtr, cast(int*)&width, cast(int*)&height);
  }

  /**
      Sets the textual description for this image.
  
      Params:
        description = a string description to set for image
      Returns: boolean TRUE, or FALSE if operation could
        not be completed.
  */
  override bool setImageDescription(string description) nothrow
  {
    bool _retval;
    const(char)* _description = description.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)atk_image_set_image_description(cast(AtkImage*)this._cPtr, _description);
    return _retval;
  }

  /// True if the D class T overrides any vfunc method of gid.atk1.image.Image (DiG)
  enum bool _ifaceVfuncsOverridden_gid_atk1_image_Image(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetImageDescription", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetImageLocale", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetImagePosition", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetImageSize", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetImageDescription", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.atk1.image.Image vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_atk1_image_Image(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetImageDescription", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.atk1.image.Image.vfuncGetImageDescription is not supported: callback string return value with transfer none is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetImageLocale", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.atk1.image.Image.vfuncGetImageLocale is not supported: callback string return value with transfer none is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetImagePosition", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_image_Image(iface, "get_image_position");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetImageSize", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_image_Image(iface, "get_image_size");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetImageDescription", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_image_Image(iface, "set_image_description");
  }

  private static void _installIfaceVfunc_gid_atk1_image_Image(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(AtkImageIface*)iface;

    switch (vfunc)
    {
      case "get_image_position":
      {
        static extern(C) void _vfuncGetImagePositionTramp(AtkImage* image, int* x, int* y, AtkCoordType coordType) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)image);
          if (!_obj)
          {
            auto _klass = cast(AtkImageIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)image), gid.atk1.image.Image._getGType);
            if (_klass && _klass.getImagePosition)
              return (cast(typeof(&_vfuncGetImagePositionTramp))_klass.getImagePosition)(image, x, y, coordType);
            return;
          }

          typeof(*x) _xNull;
          if (!x)
            x = &_xNull;

          typeof(*y) _yNull;
          if (!y)
            y = &_yNull;

          try
          {
            _obj.vfuncGetImagePosition(*x, *y, coordType);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.image.Image.vfuncGetImagePosition");
          }
        }

        _klass.getImagePosition = cast(typeof(_klass.getImagePosition))&_vfuncGetImagePositionTramp;
        break;
      }
      case "get_image_size":
      {
        static extern(C) void _vfuncGetImageSizeTramp(AtkImage* image, int* width, int* height) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)image);
          if (!_obj)
          {
            auto _klass = cast(AtkImageIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)image), gid.atk1.image.Image._getGType);
            if (_klass && _klass.getImageSize)
              return (cast(typeof(&_vfuncGetImageSizeTramp))_klass.getImageSize)(image, width, height);
            return;
          }

          typeof(*width) _widthNull;
          if (!width)
            width = &_widthNull;

          typeof(*height) _heightNull;
          if (!height)
            height = &_heightNull;

          try
          {
            _obj.vfuncGetImageSize(*width, *height);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.image.Image.vfuncGetImageSize");
          }
        }

        _klass.getImageSize = cast(typeof(_klass.getImageSize))&_vfuncGetImageSizeTramp;
        break;
      }
      case "set_image_description":
      {
        static extern(C) gboolean _vfuncSetImageDescriptionTramp(AtkImage* image, const(char)* description) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)image);
          if (!_obj)
          {
            auto _klass = cast(AtkImageIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)image), gid.atk1.image.Image._getGType);
            if (_klass && _klass.setImageDescription)
              return (cast(typeof(&_vfuncSetImageDescriptionTramp))_klass.setImageDescription)(image, description);
            return typeof(return).init;
          }

          bool _dretval;
          string _description = description.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncSetImageDescription(_description);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.image.Image.vfuncSetImageDescription");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.setImageDescription = cast(typeof(_klass.setImageDescription))&_vfuncSetImageDescriptionTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.atk1.image.Image]
template ImageGidBuilderT()
{
}
