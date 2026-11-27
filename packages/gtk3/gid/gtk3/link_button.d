/// Module for [LinkButton] class
module gid.gtk3.link_button;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.actionable;
import gid.gtk3.actionable_mixin;
import gid.gtk3.activatable;
import gid.gtk3.activatable_mixin;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.button;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;

/**
    A GtkLinkButton is a #GtkButton with a hyperlink, similar to the one
    used by web browsers, which triggers an action when clicked. It is useful
    to show quick links to resources.
    
    A link button is created by calling either [gid.gtk4.link_button.LinkButton.new_] or
    [gid.gtk4.link_button.LinkButton.newWithLabel]. If using the former, the URI you pass
    to the constructor is used as a label for the widget.
    
    The URI bound to a GtkLinkButton can be set specifically using
    [gid.gtk4.link_button.LinkButton.setUri], and retrieved using [gid.gtk4.link_button.LinkButton.getUri].
    
    By default, GtkLinkButton calls [gid.gtk3.global.showUriOnWindow] when the button is
    clicked. This behaviour can be overridden by connecting to the
    #GtkLinkButton::activate-link signal and returning true from the
    signal handler.
    
    # CSS nodes
    
    GtkLinkButton has a single CSS node with name button. To differentiate
    it from a plain #GtkButton, it gets the .link style class.
*/
@gidGir("LinkButton", "LinkButtonClass")
class LinkButton : gid.gtk3.button.Button
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_link_button_get_type != &gidSymbolNotFound ? gtk_link_button_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkLinkButton";
  }

  /** Returns `this`, for use in `with` statements. */
  override LinkButton self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.link_button.LinkButton]
      Returns: New builder object
  */
  static LinkButtonGidBuilder builder() nothrow
  {
    return new LinkButtonGidBuilder;
  }

  /**
      Get `uri` property.
      Returns: The URI bound to this button.
  */
  @property string uri() nothrow
  {
    return getUri();
  }

  /**
      Set `uri` property.
      Params:
        propval = The URI bound to this button.
  */
  @property void uri(string propval) nothrow
  {
    setUri(propval);
  }

  /**
      Get `visited` property.
      Returns: The 'visited' state of this button. A visited link is drawn in a
        different color.
  */
  @property bool visited() nothrow
  {
    return getVisited();
  }

  /**
      Set `visited` property.
      Params:
        propval = The 'visited' state of this button. A visited link is drawn in a
          different color.
  */
  @property void visited(bool propval) nothrow
  {
    setVisited(propval);
  }

  /**
      Creates a new #GtkLinkButton with the URI as its text.
  
      Params:
        uri = a valid URI
      Returns: a new link button widget.
  */
  this(string uri) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      const(char)* _uri = uri.toCString!(No.Malloc, No.Nullable);
      _cretval = gtk_link_button_new(_uri);
      this(_cretval, No.Take);
    }
  }

  /**
      Creates a new #GtkLinkButton containing a label.
  
      Params:
        uri = a valid URI
        label = the text of the button
      Returns: a new link button widget.
  */
  static gid.gtk3.link_button.LinkButton newWithLabel(string uri, string label = null) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _uri = uri.toCString!(No.Malloc, No.Nullable);
    const(char)* _label = label.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gtk_link_button_new_with_label(_uri, _label);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.link_button.LinkButton)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      class handler for the #GtkLinkButton::activate-link signal
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncActivateLink` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncActivateLink()
  {
    auto _klass = cast(GtkLinkButtonClass*)_vfuncClass;
    if (!_klass.activateLink)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.activateLink(cast(GtkLinkButton*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the URI set using [gid.gtk4.link_button.LinkButton.setUri].
      Returns: a valid URI.  The returned string is owned by the link button
          and should not be modified or freed.
  */
  string getUri() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_link_button_get_uri(cast(GtkLinkButton*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Retrieves the “visited” state of the URI where the #GtkLinkButton
      points. The button becomes visited when it is clicked. If the URI
      is changed on the button, the “visited” state is unset again.
      
      The state may also be changed using [gid.gtk4.link_button.LinkButton.setVisited].
      Returns: true if the link has been visited, false otherwise
  */
  bool getVisited() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_link_button_get_visited(cast(GtkLinkButton*)this._cPtr);
    return _retval;
  }

  /**
      Sets uri as the URI where the #GtkLinkButton points. As a side-effect
      this unsets the “visited” state of the button.
  
      Params:
        uri = a valid URI
  */
  void setUri(string uri) nothrow
  {
    const(char)* _uri = uri.toCString!(No.Malloc, No.Nullable);
    gtk_link_button_set_uri(cast(GtkLinkButton*)this._cPtr, _uri);
  }

  /**
      Sets the “visited” state of the URI where the #GtkLinkButton
      points.  See [gid.gtk4.link_button.LinkButton.getVisited] for more details.
  
      Params:
        visited = the new “visited” state
  */
  void setVisited(bool visited) nothrow
  {
    gtk_link_button_set_visited(cast(GtkLinkButton*)this._cPtr, visited);
  }

  /**
      Connect to `ActivateLink` signal.
  
      The ::activate-link signal is emitted each time the #GtkLinkButton
        has been clicked.
        
        The default handler will call [gid.gtk3.global.showUriOnWindow] with the URI stored inside
        the #GtkLinkButton:uri property.
        
        To override the default behavior, you can connect to the ::activate-link
        signal and stop the propagation of the signal by returning true from
        your handler.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.gtk3.link_button.LinkButton linkButton)`
  
          `linkButton` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectActivateLink(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.link_button.LinkButton)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.link_button.LinkButton.activateLink");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate-link", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from LinkButton
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk3.link_button.LinkButton), T.stringof ~ " is not derived from gid.gtk3.link_button.LinkButton");

    gid.gtk3.button.Button._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncActivateLink", true)[0]) == gid.gtk3.link_button.LinkButton))
      _installVfunc(klass, "activate_link");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkLinkButtonClass*)klass;

    switch (vfunc)
    {
      case "activate_link":
      {
        static extern(C) gboolean _vfuncActivateLinkTramp(GtkLinkButton* button) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtk3.link_button.LinkButton)(cast(void*)button);
          if (!_obj)
          {
            auto _klass = cast(GtkLinkButtonClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)button);
            if (_klass.activateLink)
              return (cast(typeof(&_vfuncActivateLinkTramp))_klass.activateLink)(button);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncActivateLink();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.link_button.LinkButton.vfuncActivateLink");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.activateLink = cast(typeof(_klass.activateLink))&_vfuncActivateLinkTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.link_button.LinkButton]
class LinkButtonGidBuilderImpl(T) : gid.gtk3.button.ButtonGidBuilderImpl!T
{


  /**
      Set `uri` property.
      Params:
        propval = The URI bound to this button.
      Returns: Builder instance for fluent chaining
  */
  T uri(string propval) nothrow
  {
    return setProperty("uri", propval);
  }

  /**
      Set `visited` property.
      Params:
        propval = The 'visited' state of this button. A visited link is drawn in a
          different color.
      Returns: Builder instance for fluent chaining
  */
  T visited(bool propval) nothrow
  {
    return setProperty("visited", propval);
  }
}

/// Fluent builder for [gid.gtk3.link_button.LinkButton]
final class LinkButtonGidBuilder : LinkButtonGidBuilderImpl!LinkButtonGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  LinkButton build() nothrow
  {
    return new LinkButton(cast(void*)createGObject(LinkButton._getGType), Yes.Take);
  }
}
