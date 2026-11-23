/// Module for [Hypertext] interface mixin
module gid.atk1.hypertext_mixin;

public import gid.core.basictypes;
public import gid.atk1.hypertext_iface_proxy;
public import gid.atk1.c.functions;
public import gid.atk1.c.types;
public import gid.atk1.hyperlink;
public import gid.atk1.types;
public import gid.core.utils;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.dclosure;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;

/**
    The ATK interface which provides standard mechanism for manipulating hyperlinks.
    
    An interface used for objects which implement linking between
    multiple resource or content locations, or multiple 'markers'
    within a single document.  A Hypertext instance is associated with
    one or more Hyperlinks, which are associated with particular
    offsets within the Hypertext's included content.  While this
    interface is derived from Text, there is no requirement that
    Hypertext instances have textual content; they may implement Image
    as well, and Hyperlinks need not have non-zero text offsets.
*/
template HypertextT()
{

  /**
      Gets the link in this hypertext document at index
      link_index
  
      Params:
        linkIndex = an integer specifying the desired link
      Returns: the link in this hypertext document at
        index link_index
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetLink`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.atk1.hyperlink.Hyperlink vfuncGetLink(int linkIndex)
  {
    auto _klass = cast(AtkHypertextIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.hypertext.Hypertext._getGType);
    if (!_klass || !_klass.getLink)
      return typeof(return).init;

    AtkHyperlink* _cretval;
    _cretval = _klass.getLink(cast(AtkHypertext*)this._cPtr, linkIndex);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.atk1.hyperlink.Hyperlink)(cast(AtkHyperlink*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the index into the array of hyperlinks that is associated with
      the character specified by char_index.
  
      Params:
        charIndex = a character index
      Returns: an index into the array of hyperlinks in hypertext,
        or -1 if there is no hyperlink associated with this character.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetLinkIndex`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected int vfuncGetLinkIndex(int charIndex)
  {
    auto _klass = cast(AtkHypertextIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.hypertext.Hypertext._getGType);
    if (!_klass || !_klass.getLinkIndex)
      return typeof(return).init;

    int _retval;
    _retval = _klass.getLinkIndex(cast(AtkHypertext*)this._cPtr, charIndex);
    return _retval;
  }

  /**
      Gets the number of links within this hypertext document.
      Returns: the number of links within this hypertext document
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetNLinks`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected int vfuncGetNLinks()
  {
    auto _klass = cast(AtkHypertextIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.hypertext.Hypertext._getGType);
    if (!_klass || !_klass.getNLinks)
      return typeof(return).init;

    int _retval;
    _retval = _klass.getNLinks(cast(AtkHypertext*)this._cPtr);
    return _retval;
  }

  /** */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncLinkSelected(int linkIndex)
  {
    auto _klass = cast(AtkHypertextIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.atk1.hypertext.Hypertext._getGType);
    if (!_klass || !_klass.linkSelected)
      return;

    _klass.linkSelected(cast(AtkHypertext*)this._cPtr, linkIndex);
  }

  /**
      Gets the link in this hypertext document at index
      link_index
  
      Params:
        linkIndex = an integer specifying the desired link
      Returns: the link in this hypertext document at
        index link_index
  */
  override gid.atk1.hyperlink.Hyperlink getLink(int linkIndex) nothrow
  {
    AtkHyperlink* _cretval;
    _cretval = atk_hypertext_get_link(cast(AtkHypertext*)this._cPtr, linkIndex);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.atk1.hyperlink.Hyperlink)(cast(AtkHyperlink*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the index into the array of hyperlinks that is associated with
      the character specified by char_index.
  
      Params:
        charIndex = a character index
      Returns: an index into the array of hyperlinks in hypertext,
        or -1 if there is no hyperlink associated with this character.
  */
  override int getLinkIndex(int charIndex) nothrow
  {
    int _retval;
    _retval = atk_hypertext_get_link_index(cast(AtkHypertext*)this._cPtr, charIndex);
    return _retval;
  }

  /**
      Gets the number of links within this hypertext document.
      Returns: the number of links within this hypertext document
  */
  override int getNLinks() nothrow
  {
    int _retval;
    _retval = atk_hypertext_get_n_links(cast(AtkHypertext*)this._cPtr);
    return _retval;
  }

  /**
      Connect to `LinkSelected` signal.
  
      The "link-selected" signal is emitted by an AtkHyperText
        object when one of the hyperlinks associated with the object
        is selected.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(int arg1, gid.atk1.hypertext.Hypertext hypertext)`
  
          `arg1` the index of the hyperlink which is selected (optional)
  
          `hypertext` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectLinkSelected(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.atk1.hypertext.Hypertext)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
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
        gidInvokeCallbackExceptionHandler(e, "gid.atk1.hypertext.Hypertext.linkSelected");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("link-selected", closure, after);
  }

  /// True if the D class T overrides any vfunc method of gid.atk1.hypertext.Hypertext (DiG)
  enum bool _ifaceVfuncsOverridden_gid_atk1_hypertext_Hypertext(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetLink", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetLinkIndex", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetNLinks", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncLinkSelected", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.atk1.hypertext.Hypertext vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gobject.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_atk1_hypertext_Hypertext(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetLink", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_hypertext_Hypertext(iface, "get_link");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetLinkIndex", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_hypertext_Hypertext(iface, "get_link_index");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetNLinks", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_hypertext_Hypertext(iface, "get_n_links");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncLinkSelected", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_atk1_hypertext_Hypertext(iface, "link_selected");
  }

  private static void _installIfaceVfunc_gid_atk1_hypertext_Hypertext(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(AtkHypertextIface*)iface;

    switch (vfunc)
    {
      case "get_link":
      {
        static extern(C) AtkHyperlink* _vfuncGetLinkTramp(AtkHypertext* hypertext, int linkIndex) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)hypertext);
          if (!_obj)
          {
            auto _klass = cast(AtkHypertextIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)hypertext), gid.atk1.hypertext.Hypertext._getGType);
            if (_klass && _klass.getLink)
              return (cast(typeof(&_vfuncGetLinkTramp))_klass.getLink)(hypertext, linkIndex);
            return typeof(return).init;
          }

          gid.atk1.hyperlink.Hyperlink _dretval;

          try
          {
            _dretval = _obj.vfuncGetLink(linkIndex);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.hypertext.Hypertext.vfuncGetLink");
          }
          auto _retval = _dretval ? cast(AtkHyperlink*)_dretval._cPtr(No.Dup) : null;

          return _retval;
        }

        _klass.getLink = cast(typeof(_klass.getLink))&_vfuncGetLinkTramp;
        break;
      }
      case "get_link_index":
      {
        static extern(C) int _vfuncGetLinkIndexTramp(AtkHypertext* hypertext, int charIndex) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)hypertext);
          if (!_obj)
          {
            auto _klass = cast(AtkHypertextIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)hypertext), gid.atk1.hypertext.Hypertext._getGType);
            if (_klass && _klass.getLinkIndex)
              return (cast(typeof(&_vfuncGetLinkIndexTramp))_klass.getLinkIndex)(hypertext, charIndex);
            return typeof(return).init;
          }

          int _retval;

          try
          {
            _retval = _obj.vfuncGetLinkIndex(charIndex);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.hypertext.Hypertext.vfuncGetLinkIndex");
          }
          return _retval;
        }

        _klass.getLinkIndex = cast(typeof(_klass.getLinkIndex))&_vfuncGetLinkIndexTramp;
        break;
      }
      case "get_n_links":
      {
        static extern(C) int _vfuncGetNLinksTramp(AtkHypertext* hypertext) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)hypertext);
          if (!_obj)
          {
            auto _klass = cast(AtkHypertextIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)hypertext), gid.atk1.hypertext.Hypertext._getGType);
            if (_klass && _klass.getNLinks)
              return (cast(typeof(&_vfuncGetNLinksTramp))_klass.getNLinks)(hypertext);
            return typeof(return).init;
          }

          int _retval;

          try
          {
            _retval = _obj.vfuncGetNLinks();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.hypertext.Hypertext.vfuncGetNLinks");
          }
          return _retval;
        }

        _klass.getNLinks = cast(typeof(_klass.getNLinks))&_vfuncGetNLinksTramp;
        break;
      }
      case "link_selected":
      {
        static extern(C) void _vfuncLinkSelectedTramp(AtkHypertext* hypertext, int linkIndex) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)hypertext);
          if (!_obj)
          {
            auto _klass = cast(AtkHypertextIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)hypertext), gid.atk1.hypertext.Hypertext._getGType);
            if (_klass && _klass.linkSelected)
              return (cast(typeof(&_vfuncLinkSelectedTramp))_klass.linkSelected)(hypertext, linkIndex);
            return;
          }

          try
          {
            _obj.vfuncLinkSelected(linkIndex);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.hypertext.Hypertext.vfuncLinkSelected");
          }
        }

        _klass.linkSelected = cast(typeof(_klass.linkSelected))&_vfuncLinkSelectedTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.atk1.hypertext.Hypertext]
template HypertextGidBuilderT()
{
}
