/// Module for [NavigationAction] class
module webkit.navigation_action;

import gid.gid;
import gobject.boxed;
import gobject.object;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;
import webkit.urirequest;

/**
    Provides details about interaction resulting in a resource load.
*/
class NavigationAction : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())webkit_navigation_action_get_type != &gidSymbolNotFound ? webkit_navigation_action_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override NavigationAction self()
  {
    return this;
  }

  /**
      Make a copy of navigation.
      Returns: A copy of passed in #WebKitNavigationAction
  */
  webkit.navigation_action.NavigationAction copy()
  {
    WebKitNavigationAction* _cretval;
    _cretval = webkit_navigation_action_copy(cast(WebKitNavigationAction*)this._cPtr);
    auto _retval = _cretval ? new webkit.navigation_action.NavigationAction(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the navigation target frame name. For example if navigation was triggered by clicking a
      link with a target attribute equal to "_blank", this will return the value of that attribute.
      In all other cases this function will return null.
      Returns: The name of the new frame this navigation action targets or null
  */
  string getFrameName()
  {
    const(char)* _cretval;
    _cretval = webkit_navigation_action_get_frame_name(cast(WebKitNavigationAction*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Return the modifier keys.
      
      Return a bitmask of #GdkModifierType values describing the modifier keys that were in effect
      when the navigation was requested
      Returns: the modifier keys
  */
  uint getModifiers()
  {
    uint _retval;
    _retval = webkit_navigation_action_get_modifiers(cast(WebKitNavigationAction*)this._cPtr);
    return _retval;
  }

  /**
      Return the number of the mouse button that triggered the navigation.
      
      Return the number of the mouse button that triggered the navigation, or 0 if
      the navigation was not started by a mouse event.
      Returns: the mouse button number or 0
  */
  uint getMouseButton()
  {
    uint _retval;
    _retval = webkit_navigation_action_get_mouse_button(cast(WebKitNavigationAction*)this._cPtr);
    return _retval;
  }

  /**
      Return the type of action that triggered the navigation.
      Returns: a #WebKitNavigationType
  */
  webkit.types.NavigationType getNavigationType()
  {
    WebKitNavigationType _cretval;
    _cretval = webkit_navigation_action_get_navigation_type(cast(WebKitNavigationAction*)this._cPtr);
    webkit.types.NavigationType _retval = cast(webkit.types.NavigationType)_cretval;
    return _retval;
  }

  /**
      Return the #WebKitURIRequest associated with the navigation action.
      
      Modifications to the returned object are <emphasis>not</emphasis> taken
      into account when the request is sent over the network, and is intended
      only to aid in evaluating whether a navigation action should be taken or
      not. To modify requests before they are sent over the network the
      #WebKitPage::send-request signal can be used instead.
      Returns: a #WebKitURIRequest
  */
  webkit.urirequest.URIRequest getRequest()
  {
    WebKitURIRequest* _cretval;
    _cretval = webkit_navigation_action_get_request(cast(WebKitNavigationAction*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkit.urirequest.URIRequest)(cast(WebKitURIRequest*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the navigation was redirected.
      Returns: true if the original navigation was redirected, false otherwise.
  */
  bool isRedirect()
  {
    bool _retval;
    _retval = cast(bool)webkit_navigation_action_is_redirect(cast(WebKitNavigationAction*)this._cPtr);
    return _retval;
  }

  /**
      Return whether the navigation was triggered by a user gesture like a mouse click.
      Returns: whether navigation action is a user gesture
  */
  bool isUserGesture()
  {
    bool _retval;
    _retval = cast(bool)webkit_navigation_action_is_user_gesture(cast(WebKitNavigationAction*)this._cPtr);
    return _retval;
  }
}
