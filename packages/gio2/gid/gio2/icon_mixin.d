/// Module for [Icon] interface mixin
module gid.gio2.icon_mixin;

public import gid.core.basictypes;
public import gid.gio2.icon_iface_proxy;
public import gid.core.utils;
public import gid.gio2.c.functions;
public import gid.gio2.c.types;
public import gid.gio2.types;
public import gid.glib2.error;
public import gid.glib2.variant;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;

/**
    [gid.gio2.icon.Icon] is a very minimal interface for icons. It provides functions
    for checking the equality of two icons, hashing of icons and
    serializing an icon to and from strings.
    
    [gid.gio2.icon.Icon] does not provide the actual pixmap for the icon as this is out
    of GIO's scope, however implementations of [gid.gio2.icon.Icon] may contain the name
    of an icon (see [gid.gio2.themed_icon.ThemedIcon]), or the path to an icon
    (see [gid.gio2.loadable_icon.LoadableIcon]).
    
    To obtain a hash of a [gid.gio2.icon.Icon], see [gid.gio2.icon.Icon.hash].
    
    To check if two [gid.gio2.icon.Icon]s are equal, see [gid.gio2.icon.Icon.equal].
    
    For serializing a [gid.gio2.icon.Icon], use [gid.gio2.icon.Icon.serialize] and
    [gid.gio2.icon.Icon.deserialize].
    
    If you want to consume [gid.gio2.icon.Icon] (for example, in a toolkit) you must
    be prepared to handle at least the three following cases:
    [gid.gio2.loadable_icon.LoadableIcon], [gid.gio2.themed_icon.ThemedIcon] and [gid.gio2.emblemed_icon.EmblemedIcon].
    It may also make sense to have fast-paths for other cases (like handling
    [[gid.gdkpixbuf2.pixbuf.Pixbuf]](https://docs.gtk.org/gdk-pixbuf/class.Pixbuf.html) directly,
    for example) but all compliant [gid.gio2.icon.Icon] implementations outside of GIO must
    implement [gid.gio2.loadable_icon.LoadableIcon].
    
    If your application or library provides one or more [gid.gio2.icon.Icon]
    implementations you need to ensure that your new implementation also
    implements [gid.gio2.loadable_icon.LoadableIcon].  Additionally, you must provide an
    implementation of [gid.gio2.icon.Icon.serialize] that gives a result that is
    understood by [gid.gio2.icon.Icon.deserialize], yielding one of the built-in
    icon types.
*/
template IconT()
{



  /**
      Checks if two icons are equal.
  
      Params:
        icon2 = pointer to the second #GIcon.
      Returns: true if icon1 is equal to icon2. false otherwise.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncEqual`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncEqual(gid.gio2.icon.Icon icon2 = null)
  {
    auto _klass = cast(GIconIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.icon.Icon._getGType);
    if (!_klass || !_klass.equal)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.equal(cast(GIcon*)this._cPtr, icon2 ? cast(GIcon*)(cast(gid.gobject2.object.ObjectWrap)icon2)._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets a hash for an icon.
      Returns: a #guint containing a hash for the icon, suitable for
          use in a #GHashTable or similar data structure.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncHash`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected uint vfuncHash()
  {
    auto _klass = cast(GIconIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.icon.Icon._getGType);
    if (!_klass || !_klass.hash)
      return typeof(return).init;

    uint _retval;
    _retval = _klass.hash(cast(GIcon*)this._cPtr);
    return _retval;
  }

  /**
      Serializes a #GIcon into a #GVariant. An equivalent #GIcon can be retrieved
      back by calling [gid.gio2.icon.Icon.deserialize] on the returned value.
      As serialization will avoid using raw icon data when possible, it only
      makes sense to transfer the #GVariant between processes on the same machine,
      (as opposed to over the network), and within the same file system namespace.
      Returns: a #GVariant, or null when serialization fails. The #GVariant will not be floating.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSerialize`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.glib2.variant.Variant vfuncSerialize()
  {
    auto _klass = cast(GIconIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.icon.Icon._getGType);
    if (!_klass || !_klass.serialize)
      return typeof(return).init;

    GVariant* _cretval;
    _cretval = _klass.serialize(cast(GIcon*)this._cPtr);
    auto _retval = _cretval ? new gid.glib2.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Serializes the icon into string tokens.
      This is can be invoked when [gid.gio2.icon.Icon.newForString] is called.
  
      Params:
        tokens = The array to fill with tokens
        outVersion = version of serialized tokens
      Returns: true if serialization took place, false otherwise
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncToTokens`
      to chain up from an override.
      Overriding it from D is not supported (Out container parameter 'tokens' in callback with ownership 'None' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncToTokens(out string[] tokens, out int outVersion)
  {
    auto _klass = cast(GIconIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.icon.Icon._getGType);
    if (!_klass || !_klass.toTokens)
      return typeof(return).init;

    bool _retval;
    auto _tokens = gPtrArrayFromD(tokens);
    scope(failure) containerFree!(GPtrArray*, string, GidOwnership.None)(_tokens);
    _retval = cast(bool)_klass.toTokens(cast(GIcon*)this._cPtr, _tokens, cast(int*)&outVersion);
    tokens = gPtrArrayToD!(string, GidOwnership.Full)(_tokens);
    return _retval;
  }

  /**
      Checks if two icons are equal.
  
      Params:
        icon2 = pointer to the second #GIcon.
      Returns: true if icon1 is equal to icon2. false otherwise.
  */
  override bool equal(gid.gio2.icon.Icon icon2 = null) nothrow
  {
    bool _retval;
    _retval = cast(bool)g_icon_equal(cast(GIcon*)this._cPtr, icon2 ? cast(GIcon*)(cast(gid.gobject2.object.ObjectWrap)icon2)._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets a hash for an icon.
      Returns: a #guint containing a hash for the icon, suitable for
          use in a #GHashTable or similar data structure.
  */
  override uint hash() nothrow
  {
    uint _retval;
    _retval = g_icon_hash(cast(GIcon*)this._cPtr);
    return _retval;
  }

  /**
      Serializes a #GIcon into a #GVariant. An equivalent #GIcon can be retrieved
      back by calling [gid.gio2.icon.Icon.deserialize] on the returned value.
      As serialization will avoid using raw icon data when possible, it only
      makes sense to transfer the #GVariant between processes on the same machine,
      (as opposed to over the network), and within the same file system namespace.
      Returns: a #GVariant, or null when serialization fails. The #GVariant will not be floating.
  */
  override gid.glib2.variant.Variant serialize() nothrow
  {
    GVariant* _cretval;
    _cretval = g_icon_serialize(cast(GIcon*)this._cPtr);
    auto _retval = _cretval ? new gid.glib2.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Generates a textual representation of icon that can be used for
      serialization such as when passing icon to a different process or
      saving it to persistent storage. Use [gid.gio2.icon.Icon.newForString] to
      get icon back from the returned string.
      
      The encoding of the returned string is proprietary to #GIcon except
      in the following two cases
      
      - If icon is a #GFileIcon, the returned string is a native path
        (such as `/path/to/my icon.png`) without escaping
        if the #GFile for icon is a native file.  If the file is not
        native, the returned string is the result of [gid.gio2.file.File.getUri]
        (such as `sftp://path/to/my%20icon.png`).
      
      - If icon is a #GThemedIcon with exactly one name and no fallbacks,
        the encoding is simply the name (such as `network-server`).
      Returns: An allocated NUL-terminated UTF8 string or
        null if icon can't be serialized. Use [gid.glib2.global.gfree] to free.
  */
  override string toString_() nothrow
  {
    char* _cretval;
    _cretval = g_icon_to_string(cast(GIcon*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /// True if the D class T overrides any vfunc method of gid.gio2.icon.Icon (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gio2_icon_Icon(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEqual", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncHash", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSerialize", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncToTokens", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gio2.icon.Icon vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gio2_icon_Icon(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEqual", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_icon_Icon(iface, "equal");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncHash", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_icon_Icon(iface, "hash");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSerialize", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_icon_Icon(iface, "serialize");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncToTokens", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.icon.Icon.vfuncToTokens is not supported: Out container parameter 'tokens' in callback with ownership 'None' is not supported");
  }

  private static void _installIfaceVfunc_gid_gio2_icon_Icon(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GIconIface*)iface;

    switch (vfunc)
    {
      case "equal":
      {
        static extern(C) gboolean _vfuncEqualTramp(GIcon* icon1, GIcon* icon2) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)icon1);
          if (!_obj)
          {
            auto _klass = cast(GIconIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)icon1), gid.gio2.icon.Icon._getGType);
            if (_klass && _klass.equal)
              return (cast(typeof(&_vfuncEqualTramp))_klass.equal)(icon1, icon2);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncEqual(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.icon.Icon)(cast(void*)icon2, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.icon.Icon.vfuncEqual");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.equal = cast(typeof(_klass.equal))&_vfuncEqualTramp;
        break;
      }
      case "hash":
      {
        static extern(C) uint _vfuncHashTramp(GIcon* icon) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)icon);
          if (!_obj)
          {
            auto _klass = cast(GIconIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)icon), gid.gio2.icon.Icon._getGType);
            if (_klass && _klass.hash)
              return (cast(typeof(&_vfuncHashTramp))_klass.hash)(icon);
            return typeof(return).init;
          }

          uint _retval;

          try
          {
            _retval = _obj.vfuncHash();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.icon.Icon.vfuncHash");
          }
          return _retval;
        }

        _klass.hash = cast(typeof(_klass.hash))&_vfuncHashTramp;
        break;
      }
      case "serialize":
      {
        static extern(C) GVariant* _vfuncSerializeTramp(GIcon* icon) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)icon);
          if (!_obj)
          {
            auto _klass = cast(GIconIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)icon), gid.gio2.icon.Icon._getGType);
            if (_klass && _klass.serialize)
              return (cast(typeof(&_vfuncSerializeTramp))_klass.serialize)(icon);
            return typeof(return).init;
          }

          gid.glib2.variant.Variant _dretval;

          try
          {
            _dretval = _obj.vfuncSerialize();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.icon.Icon.vfuncSerialize");
          }
          auto _retval = _dretval ? cast(GVariant*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.serialize = cast(typeof(_klass.serialize))&_vfuncSerializeTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.icon.Icon]
template IconGidBuilderT()
{
}
