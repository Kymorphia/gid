/// Module for [Hyperlink] class
module gid.atk1.hyperlink;

public import gid.core.basictypes;
import gid.atk1.action;
import gid.atk1.action_mixin;
import gid.atk1.c.functions;
import gid.atk1.c.types;
import gid.atk1.object;
import gid.atk1.types;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    An ATK object which encapsulates a link or set of links in a hypertext document.
    
    An ATK object which encapsulates a link or set of links (for
    instance in the case of client-side image maps) in a hypertext
    document.  It may implement the AtkAction interface.  AtkHyperlink
    may also be used to refer to inline embedded content, since it
    allows specification of a start and end offset within the host
    AtkHypertext object.
*/
class Hyperlink : gid.gobject2.object.ObjectWrap, gid.atk1.action.Action
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())atk_hyperlink_get_type != &gidSymbolNotFound ? atk_hyperlink_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AtkHyperlink";
  }

  /** Returns `this`, for use in `with` statements. */
  override Hyperlink self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.atk1.hyperlink.Hyperlink]
      Returns: New builder object
  */
  static HyperlinkGidBuilder builder() nothrow
  {
    return new HyperlinkGidBuilder;
  }

  /** */
  @property int endIndex() nothrow
  {
    return getEndIndex();
  }

  /** */
  @property int numberOfAnchors() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("number-of-anchors");
  }

  /**
      Get `selectedLink` property.
      Returns: Selected link
  
      Deprecated: Please use ATK_STATE_FOCUSABLE for all links, and
        ATK_STATE_FOCUSED for focused links.
  */
  @property bool selectedLink() nothrow
  {
    return isSelectedLink();
  }

  /** */
  @property int startIndex() nothrow
  {
    return getStartIndex();
  }

  mixin ActionT!();

  /**
      Gets the index with the hypertext document at which this link ends.
      Returns: the index with the hypertext document at which this link ends
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetEndIndex` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected int vfuncGetEndIndex()
  {
    auto _klass = cast(AtkHyperlinkClass*)_vfuncClass;
    if (!_klass.getEndIndex)
      return typeof(return).init;

    int _retval;
    _retval = _klass.getEndIndex(cast(AtkHyperlink*)this._cPtr);
    return _retval;
  }

  /**
      Gets the number of anchors associated with this hyperlink.
      Returns: the number of anchors associated with this hyperlink
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetNAnchors` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected int vfuncGetNAnchors()
  {
    auto _klass = cast(AtkHyperlinkClass*)_vfuncClass;
    if (!_klass.getNAnchors)
      return typeof(return).init;

    int _retval;
    _retval = _klass.getNAnchors(cast(AtkHyperlink*)this._cPtr);
    return _retval;
  }

  /**
      Returns the item associated with this hyperlinks nth anchor.
      For instance, the returned #AtkObject will implement #AtkText
      if link_ is a text hyperlink, #AtkImage if link_ is an image
      hyperlink etc.
      
      Multiple anchors are primarily used by client-side image maps.
  
      Params:
        i = a (zero-index) integer specifying the desired anchor
      Returns: an #AtkObject associated with this hyperlinks
        i-th anchor
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetObject` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected gid.atk1.object.ObjectWrap vfuncGetObject(int i)
  {
    auto _klass = cast(AtkHyperlinkClass*)_vfuncClass;
    if (!_klass.getObject)
      return typeof(return).init;

    AtkObject* _cretval;
    _cretval = _klass.getObject(cast(AtkHyperlink*)this._cPtr, i);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.atk1.object.ObjectWrap)(cast(AtkObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the index with the hypertext document at which this link begins.
      Returns: the index with the hypertext document at which this link begins
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetStartIndex` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected int vfuncGetStartIndex()
  {
    auto _klass = cast(AtkHyperlinkClass*)_vfuncClass;
    if (!_klass.getStartIndex)
      return typeof(return).init;

    int _retval;
    _retval = _klass.getStartIndex(cast(AtkHyperlink*)this._cPtr);
    return _retval;
  }

  /**
      Get a the URI associated with the anchor specified
      by `i` of link_.
      
      Multiple anchors are primarily used by client-side image maps.
  
      Params:
        i = a (zero-index) integer specifying the desired anchor
      Returns: a string specifying the URI
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetUri` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected string vfuncGetUri(int i)
  {
    auto _klass = cast(AtkHyperlinkClass*)_vfuncClass;
    if (!_klass.getUri)
      return typeof(return).init;

    char* _cretval;
    _cretval = _klass.getUri(cast(AtkHyperlink*)this._cPtr, i);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Determines whether this AtkHyperlink is selected
      Returns: True if the AtkHyperlink is selected, False otherwise
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncIsSelectedLink` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  
      Deprecated: Please use ATK_STATE_FOCUSABLE for all links,
        and ATK_STATE_FOCUSED for focused links.
  */
  protected bool vfuncIsSelectedLink()
  {
    auto _klass = cast(AtkHyperlinkClass*)_vfuncClass;
    if (!_klass.isSelectedLink)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.isSelectedLink(cast(AtkHyperlink*)this._cPtr);
    return _retval;
  }

  /**
      Since the document that a link is associated with may have changed
      this method returns true if the link is still valid (with
      respect to the document it references) and false otherwise.
      Returns: whether or not this link is still valid
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncIsValid` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected bool vfuncIsValid()
  {
    auto _klass = cast(AtkHyperlinkClass*)_vfuncClass;
    if (!_klass.isValid)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.isValid(cast(AtkHyperlink*)this._cPtr);
    return _retval;
  }

  /** */
  protected void vfuncLinkActivated()
  {
    auto _klass = cast(AtkHyperlinkClass*)_vfuncClass;
    if (!_klass.linkActivated)
      return;

    _klass.linkActivated(cast(AtkHyperlink*)this._cPtr);
  }

  /** */
  protected uint vfuncLinkState()
  {
    auto _klass = cast(AtkHyperlinkClass*)_vfuncClass;
    if (!_klass.linkState)
      return typeof(return).init;

    uint _retval;
    _retval = _klass.linkState(cast(AtkHyperlink*)this._cPtr);
    return _retval;
  }

  /**
      Gets the index with the hypertext document at which this link ends.
      Returns: the index with the hypertext document at which this link ends
  */
  int getEndIndex() nothrow
  {
    int _retval;
    _retval = atk_hyperlink_get_end_index(cast(AtkHyperlink*)this._cPtr);
    return _retval;
  }

  /**
      Gets the number of anchors associated with this hyperlink.
      Returns: the number of anchors associated with this hyperlink
  */
  int getNAnchors() nothrow
  {
    int _retval;
    _retval = atk_hyperlink_get_n_anchors(cast(AtkHyperlink*)this._cPtr);
    return _retval;
  }

  /**
      Returns the item associated with this hyperlinks nth anchor.
      For instance, the returned #AtkObject will implement #AtkText
      if link_ is a text hyperlink, #AtkImage if link_ is an image
      hyperlink etc.
      
      Multiple anchors are primarily used by client-side image maps.
  
      Params:
        i = a (zero-index) integer specifying the desired anchor
      Returns: an #AtkObject associated with this hyperlinks
        i-th anchor
  */
  gid.atk1.object.ObjectWrap getObject(int i) nothrow
  {
    AtkObject* _cretval;
    _cretval = atk_hyperlink_get_object(cast(AtkHyperlink*)this._cPtr, i);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.atk1.object.ObjectWrap)(cast(AtkObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the index with the hypertext document at which this link begins.
      Returns: the index with the hypertext document at which this link begins
  */
  int getStartIndex() nothrow
  {
    int _retval;
    _retval = atk_hyperlink_get_start_index(cast(AtkHyperlink*)this._cPtr);
    return _retval;
  }

  /**
      Get a the URI associated with the anchor specified
      by `i` of link_.
      
      Multiple anchors are primarily used by client-side image maps.
  
      Params:
        i = a (zero-index) integer specifying the desired anchor
      Returns: a string specifying the URI
  */
  string getUri(int i) nothrow
  {
    char* _cretval;
    _cretval = atk_hyperlink_get_uri(cast(AtkHyperlink*)this._cPtr, i);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Indicates whether the link currently displays some or all of its
                content inline.  Ordinary HTML links will usually return
                false, but an inline &lt;src&gt; HTML element will return
                true.
      Returns: whether or not this link displays its content inline.
  */
  bool isInline() nothrow
  {
    bool _retval;
    _retval = cast(bool)atk_hyperlink_is_inline(cast(AtkHyperlink*)this._cPtr);
    return _retval;
  }

  /**
      Determines whether this AtkHyperlink is selected
      Returns: True if the AtkHyperlink is selected, False otherwise
  
      Deprecated: Please use ATK_STATE_FOCUSABLE for all links,
        and ATK_STATE_FOCUSED for focused links.
  */
  bool isSelectedLink() nothrow
  {
    bool _retval;
    _retval = cast(bool)atk_hyperlink_is_selected_link(cast(AtkHyperlink*)this._cPtr);
    return _retval;
  }

  /**
      Since the document that a link is associated with may have changed
      this method returns true if the link is still valid (with
      respect to the document it references) and false otherwise.
      Returns: whether or not this link is still valid
  */
  bool isValid() nothrow
  {
    bool _retval;
    _retval = cast(bool)atk_hyperlink_is_valid(cast(AtkHyperlink*)this._cPtr);
    return _retval;
  }

  /**
      Connect to `LinkActivated` signal.
  
      The signal link-activated is emitted when a link is activated.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.atk1.hyperlink.Hyperlink hyperlink)`
  
          `hyperlink` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectLinkActivated(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.atk1.hyperlink.Hyperlink)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.atk1.hyperlink.Hyperlink.linkActivated");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("link-activated", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gobject.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from Hyperlink
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.atk1.hyperlink.Hyperlink), T.stringof ~ " is not derived from gid.atk1.hyperlink.Hyperlink");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetEndIndex", true)[0]) == gid.atk1.hyperlink.Hyperlink))
      _installVfunc(klass, "get_end_index");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetNAnchors", true)[0]) == gid.atk1.hyperlink.Hyperlink))
      _installVfunc(klass, "get_n_anchors");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetObject", true)[0]) == gid.atk1.hyperlink.Hyperlink))
      _installVfunc(klass, "get_object");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetStartIndex", true)[0]) == gid.atk1.hyperlink.Hyperlink))
      _installVfunc(klass, "get_start_index");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetUri", true)[0]) == gid.atk1.hyperlink.Hyperlink))
      _installVfunc(klass, "get_uri");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncIsSelectedLink", true)[0]) == gid.atk1.hyperlink.Hyperlink))
      _installVfunc(klass, "is_selected_link");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncIsValid", true)[0]) == gid.atk1.hyperlink.Hyperlink))
      _installVfunc(klass, "is_valid");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncLinkActivated", true)[0]) == gid.atk1.hyperlink.Hyperlink))
      _installVfunc(klass, "link_activated");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncLinkState", true)[0]) == gid.atk1.hyperlink.Hyperlink))
      _installVfunc(klass, "link_state");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(AtkHyperlinkClass*)klass;

    switch (vfunc)
    {
      case "get_end_index":
      {
        static extern(C) int _vfuncGetEndIndexTramp(AtkHyperlink* link) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.atk1.hyperlink.Hyperlink)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)link);
          if (!_obj)
          {
            auto _klass = cast(AtkHyperlinkClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)link);
            if (_klass.getEndIndex)
              return (cast(typeof(&_vfuncGetEndIndexTramp))_klass.getEndIndex)(link);
            return typeof(return).init;
          }

          int _retval;

          try
          {
            _retval = _obj.vfuncGetEndIndex();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.hyperlink.Hyperlink.vfuncGetEndIndex");
          }
          return _retval;
        }

        _klass.getEndIndex = cast(typeof(_klass.getEndIndex))&_vfuncGetEndIndexTramp;
        break;
      }
      case "get_n_anchors":
      {
        static extern(C) int _vfuncGetNAnchorsTramp(AtkHyperlink* link) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.atk1.hyperlink.Hyperlink)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)link);
          if (!_obj)
          {
            auto _klass = cast(AtkHyperlinkClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)link);
            if (_klass.getNAnchors)
              return (cast(typeof(&_vfuncGetNAnchorsTramp))_klass.getNAnchors)(link);
            return typeof(return).init;
          }

          int _retval;

          try
          {
            _retval = _obj.vfuncGetNAnchors();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.hyperlink.Hyperlink.vfuncGetNAnchors");
          }
          return _retval;
        }

        _klass.getNAnchors = cast(typeof(_klass.getNAnchors))&_vfuncGetNAnchorsTramp;
        break;
      }
      case "get_object":
      {
        static extern(C) AtkObject* _vfuncGetObjectTramp(AtkHyperlink* link, int i) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.atk1.hyperlink.Hyperlink)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)link);
          if (!_obj)
          {
            auto _klass = cast(AtkHyperlinkClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)link);
            if (_klass.getObject)
              return (cast(typeof(&_vfuncGetObjectTramp))_klass.getObject)(link, i);
            return typeof(return).init;
          }

          gid.atk1.object.ObjectWrap _dretval;

          try
          {
            _dretval = _obj.vfuncGetObject(i);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.hyperlink.Hyperlink.vfuncGetObject");
          }
          auto _retval = _dretval ? cast(AtkObject*)_dretval._cPtr(No.Dup) : null;

          return _retval;
        }

        _klass.getObject = cast(typeof(_klass.getObject))&_vfuncGetObjectTramp;
        break;
      }
      case "get_start_index":
      {
        static extern(C) int _vfuncGetStartIndexTramp(AtkHyperlink* link) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.atk1.hyperlink.Hyperlink)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)link);
          if (!_obj)
          {
            auto _klass = cast(AtkHyperlinkClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)link);
            if (_klass.getStartIndex)
              return (cast(typeof(&_vfuncGetStartIndexTramp))_klass.getStartIndex)(link);
            return typeof(return).init;
          }

          int _retval;

          try
          {
            _retval = _obj.vfuncGetStartIndex();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.hyperlink.Hyperlink.vfuncGetStartIndex");
          }
          return _retval;
        }

        _klass.getStartIndex = cast(typeof(_klass.getStartIndex))&_vfuncGetStartIndexTramp;
        break;
      }
      case "get_uri":
      {
        static extern(C) char* _vfuncGetUriTramp(AtkHyperlink* link, int i) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.atk1.hyperlink.Hyperlink)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)link);
          if (!_obj)
          {
            auto _klass = cast(AtkHyperlinkClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)link);
            if (_klass.getUri)
              return (cast(typeof(&_vfuncGetUriTramp))_klass.getUri)(link, i);
            return typeof(return).init;
          }

          string _dretval;

          try
          {
            _dretval = _obj.vfuncGetUri(i);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.hyperlink.Hyperlink.vfuncGetUri");
          }
          auto _retval = toCString!(Yes.Malloc, No.Nullable)(_dretval);

          return _retval;
        }

        _klass.getUri = cast(typeof(_klass.getUri))&_vfuncGetUriTramp;
        break;
      }
      case "is_selected_link":
      {
        static extern(C) gboolean _vfuncIsSelectedLinkTramp(AtkHyperlink* link) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.atk1.hyperlink.Hyperlink)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)link);
          if (!_obj)
          {
            auto _klass = cast(AtkHyperlinkClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)link);
            if (_klass.isSelectedLink)
              return (cast(typeof(&_vfuncIsSelectedLinkTramp))_klass.isSelectedLink)(link);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncIsSelectedLink();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.hyperlink.Hyperlink.vfuncIsSelectedLink");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.isSelectedLink = cast(typeof(_klass.isSelectedLink))&_vfuncIsSelectedLinkTramp;
        break;
      }
      case "is_valid":
      {
        static extern(C) gboolean _vfuncIsValidTramp(AtkHyperlink* link) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.atk1.hyperlink.Hyperlink)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)link);
          if (!_obj)
          {
            auto _klass = cast(AtkHyperlinkClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)link);
            if (_klass.isValid)
              return (cast(typeof(&_vfuncIsValidTramp))_klass.isValid)(link);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncIsValid();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.hyperlink.Hyperlink.vfuncIsValid");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.isValid = cast(typeof(_klass.isValid))&_vfuncIsValidTramp;
        break;
      }
      case "link_activated":
      {
        static extern(C) void _vfuncLinkActivatedTramp(AtkHyperlink* link) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.atk1.hyperlink.Hyperlink)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)link);
          if (!_obj)
          {
            auto _klass = cast(AtkHyperlinkClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)link);
            if (_klass.linkActivated)
              return (cast(typeof(&_vfuncLinkActivatedTramp))_klass.linkActivated)(link);
            return;
          }

          try
          {
            _obj.vfuncLinkActivated();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.hyperlink.Hyperlink.vfuncLinkActivated");
          }
        }

        _klass.linkActivated = cast(typeof(_klass.linkActivated))&_vfuncLinkActivatedTramp;
        break;
      }
      case "link_state":
      {
        static extern(C) uint _vfuncLinkStateTramp(AtkHyperlink* link) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.atk1.hyperlink.Hyperlink)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)link);
          if (!_obj)
          {
            auto _klass = cast(AtkHyperlinkClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)link);
            if (_klass.linkState)
              return (cast(typeof(&_vfuncLinkStateTramp))_klass.linkState)(link);
            return typeof(return).init;
          }

          uint _retval;

          try
          {
            _retval = _obj.vfuncLinkState();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.hyperlink.Hyperlink.vfuncLinkState");
          }
          return _retval;
        }

        _klass.linkState = cast(typeof(_klass.linkState))&_vfuncLinkStateTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.atk1.hyperlink.Hyperlink]
class HyperlinkGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.atk1.action.ActionGidBuilderImpl!T
{

  mixin ActionGidBuilderT!();
}

/// Fluent builder for [gid.atk1.hyperlink.Hyperlink]
final class HyperlinkGidBuilder : HyperlinkGidBuilderImpl!HyperlinkGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Hyperlink build() nothrow
  {
    return new Hyperlink(cast(void*)createGObject(Hyperlink._getGType), Yes.Take);
  }
}
