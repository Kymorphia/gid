/// Module for [LinkButton] class
module gid.gtk4.link_button;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.actionable;
import gid.gtk4.actionable_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.button;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.types;

/**
    A button with a hyperlink.
    
    <picture>
      <source srcset="link-button-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="An example GtkLinkButton" src="link-button.png">
    </picture>
    
    It is useful to show quick links to resources.
    
    A link button is created by calling either [gid.gtk4.link_button.LinkButton.new_] or
    [gid.gtk4.link_button.LinkButton.newWithLabel]. If using the former, the URI you
    pass to the constructor is used as a label for the widget.
    
    The URI bound to a [gid.gtk4.link_button.LinkButton] can be set specifically using
    [gid.gtk4.link_button.LinkButton.setUri].
    
    By default, [gid.gtk4.link_button.LinkButton] calls [gid.gtk4.file_launcher.FileLauncher.launch] when the button
    is clicked. This behaviour can be overridden by connecting to the
    [gid.gtk4.link_button.LinkButton.activateLink] signal and returning true from
    the signal handler.
    
    # Shortcuts and Gestures
    
    [gid.gtk4.link_button.LinkButton] supports the following keyboard shortcuts:
    
    - <kbd>Shift</kbd>+<kbd>F10</kbd> or <kbd>Menu</kbd> opens the context menu.
    
    # Actions
    
    [gid.gtk4.link_button.LinkButton] defines a set of built-in actions:
    
    - `clipboard.copy` copies the url to the clipboard.
    - `menu.popup` opens the context menu.
    
    # CSS nodes
    
    [gid.gtk4.link_button.LinkButton] has a single CSS node with name button. To differentiate
    it from a plain [gid.gtk4.button.Button], it gets the .link style class.
    
    # Accessibility
    
    [gid.gtk4.link_button.LinkButton] uses the [gid.gtk4.types.AccessibleRole.Link] role.
*/
@gidGir("LinkButton")
class LinkButton : gid.gtk4.button.Button
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
      Get builder for [gid.gtk4.link_button.LinkButton]
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
      Returns: The 'visited' state of this button.
        
        A visited link is drawn in a different color.
  */
  @property bool visited() nothrow
  {
    return getVisited();
  }

  /**
      Set `visited` property.
      Params:
        propval = The 'visited' state of this button.
          
          A visited link is drawn in a different color.
  */
  @property void visited(bool propval) nothrow
  {
    setVisited(propval);
  }

  /**
      Creates a new [gid.gtk4.link_button.LinkButton] with the URI as its text.
  
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
      Creates a new [gid.gtk4.link_button.LinkButton] containing a label.
  
      Params:
        uri = a valid URI
        label = the text of the button
      Returns: a new link button widget.
  */
  static gid.gtk4.link_button.LinkButton newWithLabel(string uri, string label = null) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _uri = uri.toCString!(No.Malloc, No.Nullable);
    const(char)* _label = label.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gtk_link_button_new_with_label(_uri, _label);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.link_button.LinkButton)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the URI of the [gid.gtk4.link_button.LinkButton].
      Returns: a valid URI. The returned string is owned by the link button
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
      Retrieves the “visited” state of the [gid.gtk4.link_button.LinkButton].
      
      The button becomes visited when it is clicked. If the URI
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
      Sets uri as the URI where the [gid.gtk4.link_button.LinkButton] points.
      
      As a side-effect this unsets the “visited” state of the button.
  
      Params:
        uri = a valid URI
  */
  void setUri(string uri) nothrow
  {
    const(char)* _uri = uri.toCString!(No.Malloc, No.Nullable);
    gtk_link_button_set_uri(cast(GtkLinkButton*)this._cPtr, _uri);
  }

  /**
      Sets the “visited” state of the [gid.gtk4.link_button.LinkButton].
      
      See [gid.gtk4.link_button.LinkButton.getVisited] for more details.
  
      Params:
        visited = the new “visited” state
  */
  void setVisited(bool visited) nothrow
  {
    gtk_link_button_set_visited(cast(GtkLinkButton*)this._cPtr, visited);
  }

  /**
      Connect to `ActivateLink` signal.
  
      Emitted each time the [gid.gtk4.link_button.LinkButton] is clicked.
        
        The default handler will call [gid.gtk4.file_launcher.FileLauncher.launch] with the URI
        stored inside the [gid.gtk4.link_button.LinkButton.uri] property.
        
        To override the default behavior, you can connect to the
        ::activate-link signal and stop the propagation of the signal
        by returning true from your handler.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.gtk4.link_button.LinkButton linkButton)`
  
          `linkButton` the instance the signal is connected to (optional)
  
          `Returns` true if the signal has been handled
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectActivateLink(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.link_button.LinkButton)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.link_button.LinkButton.activateLink");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate-link", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gtk4.link_button.LinkButton]
class LinkButtonGidBuilderImpl(T) : gid.gtk4.button.ButtonGidBuilderImpl!T
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
        propval = The 'visited' state of this button.
          
          A visited link is drawn in a different color.
      Returns: Builder instance for fluent chaining
  */
  T visited(bool propval) nothrow
  {
    return setProperty("visited", propval);
  }
}

/// Fluent builder for [gid.gtk4.link_button.LinkButton]
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
