/// Module for [LinkButton] class
module gtk.link_button;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.actionable;
import gtk.actionable_mixin;
import gtk.activatable;
import gtk.activatable_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.button;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    A GtkLinkButton is a #GtkButton with a hyperlink, similar to the one
    used by web browsers, which triggers an action when clicked. It is useful
    to show quick links to resources.
    
    A link button is created by calling either [gtk.link_button.LinkButton.new_] or
    [gtk.link_button.LinkButton.newWithLabel]. If using the former, the URI you pass
    to the constructor is used as a label for the widget.
    
    The URI bound to a GtkLinkButton can be set specifically using
    [gtk.link_button.LinkButton.setUri], and retrieved using [gtk.link_button.LinkButton.getUri].
    
    By default, GtkLinkButton calls [gtk.global.showUriOnWindow] when the button is
    clicked. This behaviour can be overridden by connecting to the
    #GtkLinkButton::activate-link signal and returning true from the
    signal handler.
    
    # CSS nodes
    
    GtkLinkButton has a single CSS node with name button. To differentiate
    it from a plain #GtkButton, it gets the .link style class.
*/
class LinkButton : gtk.button.Button
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_link_button_get_type != &gidSymbolNotFound ? gtk_link_button_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override LinkButton self()
  {
    return this;
  }

  /**
      Get `uri` property.
      Returns: The URI bound to this button.
  */
  @property string uri()
  {
    return getUri();
  }

  /**
      Set `uri` property.
      Params:
        propval = The URI bound to this button.
  */
  @property void uri(string propval)
  {
    return setUri(propval);
  }

  /**
      Get `visited` property.
      Returns: The 'visited' state of this button. A visited link is drawn in a
        different color.
  */
  @property bool visited()
  {
    return getVisited();
  }

  /**
      Set `visited` property.
      Params:
        propval = The 'visited' state of this button. A visited link is drawn in a
          different color.
  */
  @property void visited(bool propval)
  {
    return setVisited(propval);
  }

  /**
      Creates a new #GtkLinkButton with the URI as its text.
  
      Params:
        uri = a valid URI
      Returns: a new link button widget.
  */
  this(string uri)
  {
    GtkWidget* _cretval;
    const(char)* _uri = uri.toCString(No.Alloc);
    _cretval = gtk_link_button_new(_uri);
    this(_cretval, No.Take);
  }

  /**
      Creates a new #GtkLinkButton containing a label.
  
      Params:
        uri = a valid URI
        label = the text of the button
      Returns: a new link button widget.
  */
  static gtk.link_button.LinkButton newWithLabel(string uri, string label = null)
  {
    GtkWidget* _cretval;
    const(char)* _uri = uri.toCString(No.Alloc);
    const(char)* _label = label.toCString(No.Alloc);
    _cretval = gtk_link_button_new_with_label(_uri, _label);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.link_button.LinkButton)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the URI set using [gtk.link_button.LinkButton.setUri].
      Returns: a valid URI.  The returned string is owned by the link button
          and should not be modified or freed.
  */
  string getUri()
  {
    const(char)* _cretval;
    _cretval = gtk_link_button_get_uri(cast(GtkLinkButton*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Retrieves the “visited” state of the URI where the #GtkLinkButton
      points. The button becomes visited when it is clicked. If the URI
      is changed on the button, the “visited” state is unset again.
      
      The state may also be changed using [gtk.link_button.LinkButton.setVisited].
      Returns: true if the link has been visited, false otherwise
  */
  bool getVisited()
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
  void setUri(string uri)
  {
    const(char)* _uri = uri.toCString(No.Alloc);
    gtk_link_button_set_uri(cast(GtkLinkButton*)this._cPtr, _uri);
  }

  /**
      Sets the “visited” state of the URI where the #GtkLinkButton
      points.  See [gtk.link_button.LinkButton.getVisited] for more details.
  
      Params:
        visited = the new “visited” state
  */
  void setVisited(bool visited)
  {
    gtk_link_button_set_visited(cast(GtkLinkButton*)this._cPtr, visited);
  }

  /**
      Connect to `ActivateLink` signal.
  
      The ::activate-link signal is emitted each time the #GtkLinkButton
        has been clicked.
        
        The default handler will call [gtk.global.showUriOnWindow] with the URI stored inside
        the #GtkLinkButton:uri property.
        
        To override the default behavior, you can connect to the ::activate-link
        signal and stop the propagation of the signal by returning true from
        your handler.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gtk.link_button.LinkButton linkButton))
  
          `linkButton` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectActivateLink(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.link_button.LinkButton)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate-link", closure, after);
  }
}
