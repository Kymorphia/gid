/// Module for [CookieJar] class
module gid.soup3.cookie_jar;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.uri;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.soup3.c.functions;
import gid.soup3.c.types;
import gid.soup3.cookie;
import gid.soup3.session_feature;
import gid.soup3.session_feature_mixin;
import gid.soup3.types;

/**
    Automatic cookie handling for SoupSession.
    
    A [gid.soup3.cookie_jar.CookieJar] stores [gid.soup3.cookie.Cookie]s and arrange for them to be sent with
    the appropriate [gid.soup3.message.Message]s. [gid.soup3.cookie_jar.CookieJar] implements
    [gid.soup3.session_feature.SessionFeature], so you can add a cookie jar to a session with
    [gid.soup3.session.Session.addFeature] or [gid.soup3.session.Session.addFeatureByType].
    
    Note that the base [gid.soup3.cookie_jar.CookieJar] class does not support any form
    of long-term cookie persistence.
*/
class CookieJar : gid.gobject2.object.ObjectWrap, gid.soup3.session_feature.SessionFeature
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())soup_cookie_jar_get_type != &gidSymbolNotFound ? soup_cookie_jar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "SoupCookieJar";
  }

  /** Returns `this`, for use in `with` statements. */
  override CookieJar self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.soup3.cookie_jar.CookieJar]
      Returns: New builder object
  */
  static CookieJarGidBuilder builder() nothrow
  {
    return new CookieJarGidBuilder;
  }

  /**
      Get `acceptPolicy` property.
      Returns: The policy the jar should follow to accept or reject cookies.
  */
  @property gid.soup3.types.CookieJarAcceptPolicy acceptPolicy() nothrow
  {
    return getAcceptPolicy();
  }

  /**
      Set `acceptPolicy` property.
      Params:
        propval = The policy the jar should follow to accept or reject cookies.
  */
  @property void acceptPolicy(gid.soup3.types.CookieJarAcceptPolicy propval) nothrow
  {
    setAcceptPolicy(propval);
  }

  /**
      Get `readOnly` property.
      Returns: Whether or not the cookie jar is read-only.
  */
  @property bool readOnly() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("read-only");
  }

  mixin SessionFeatureT!();

  /**
      Creates a new [gid.soup3.cookie_jar.CookieJar].
      
      The base [gid.soup3.cookie_jar.CookieJar] class does not support persistent storage of cookies;
      use a subclass for that.
      Returns: a new #SoupCookieJar
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      SoupCookieJar* _cretval;
      _cretval = soup_cookie_jar_new();
      this(_cretval, Yes.Take);
    }
  }

  /** */
  protected void vfuncChanged(gid.soup3.cookie.Cookie oldCookie, gid.soup3.cookie.Cookie newCookie)
  {
    auto _klass = cast(SoupCookieJarClass*)_vfuncClass;
    if (!_klass.changed)
      return;

    _klass.changed(cast(SoupCookieJar*)this._cPtr, oldCookie ? cast(SoupCookie*)oldCookie._cPtr(No.Dup) : null, newCookie ? cast(SoupCookie*)newCookie._cPtr(No.Dup) : null);
  }

  /**
      Gets whether jar stores cookies persistenly.
      Returns: true if jar storage is persistent or false otherwise.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncIsPersistent` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected bool vfuncIsPersistent()
  {
    auto _klass = cast(SoupCookieJarClass*)_vfuncClass;
    if (!_klass.isPersistent)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.isPersistent(cast(SoupCookieJar*)this._cPtr);
    return _retval;
  }

  /** */
  protected void vfuncSave()
  {
    auto _klass = cast(SoupCookieJarClass*)_vfuncClass;
    if (!_klass.save)
      return;

    _klass.save(cast(SoupCookieJar*)this._cPtr);
  }

  /**
      Adds cookie to jar.
      
      Emits the [gid.soup3.cookie_jar.CookieJar.changed] signal if we are modifying
      an existing cookie or adding a valid new cookie ('valid' means
      that the cookie's expire date is not in the past).
      
      cookie will be 'stolen' by the jar, so don't free it afterwards.
  
      Params:
        cookie = a #SoupCookie
  */
  void addCookie(gid.soup3.cookie.Cookie cookie) nothrow
  {
    soup_cookie_jar_add_cookie(cast(SoupCookieJar*)this._cPtr, cookie ? cast(SoupCookie*)cookie._cPtr(Yes.Dup) : null);
  }

  /**
      Adds cookie to jar.
      
      Emits the [gid.soup3.cookie_jar.CookieJar.changed] signal if we are modifying an existing
      cookie or adding a valid new cookie ('valid' means that the cookie's expire
      date is not in the past).
      
      first_party will be used to reject cookies coming from third party
      resources in case such a security policy is set in the jar.
      
      uri will be used to reject setting or overwriting secure cookies
      from insecure origins. null is treated as secure.
      
      cookie will be 'stolen' by the jar, so don't free it afterwards.
  
      Params:
        cookie = a #SoupCookie
        uri = the URI setting the cookie
        firstParty = the URI for the main document
  */
  void addCookieFull(gid.soup3.cookie.Cookie cookie, gid.glib2.uri.Uri uri = null, gid.glib2.uri.Uri firstParty = null) nothrow
  {
    soup_cookie_jar_add_cookie_full(cast(SoupCookieJar*)this._cPtr, cookie ? cast(SoupCookie*)cookie._cPtr(Yes.Dup) : null, uri ? cast(GUri*)uri._cPtr(No.Dup) : null, firstParty ? cast(GUri*)firstParty._cPtr(No.Dup) : null);
  }

  /**
      Adds cookie to jar.
      
      Emits the [gid.soup3.cookie_jar.CookieJar.changed] signal if we are modifying
      an existing cookie or adding a valid new cookie ('valid' means
      that the cookie's expire date is not in the past).
      
      first_party will be used to reject cookies coming from third party
      resources in case such a security policy is set in the jar.
      
      cookie will be 'stolen' by the jar, so don't free it afterwards.
      
      For secure cookies to work properly you may want to use
      [gid.soup3.cookie_jar.CookieJar.addCookieFull].
  
      Params:
        firstParty = the URI for the main document
        cookie = a #SoupCookie
  */
  void addCookieWithFirstParty(gid.glib2.uri.Uri firstParty, gid.soup3.cookie.Cookie cookie) nothrow
  {
    soup_cookie_jar_add_cookie_with_first_party(cast(SoupCookieJar*)this._cPtr, firstParty ? cast(GUri*)firstParty._cPtr(No.Dup) : null, cookie ? cast(SoupCookie*)cookie._cPtr(Yes.Dup) : null);
  }

  /**
      Constructs a [gid.glib2.list.List] with every cookie inside the jar.
      
      The cookies in the list are a copy of the original, so
      you have to free them when you are done with them.
      
      For historical reasons this list is in reverse order.
      Returns: a #GSList
          with all the cookies in the jar.
  */
  gid.soup3.cookie.Cookie[] allCookies() nothrow
  {
    GSList* _cretval;
    _cretval = soup_cookie_jar_all_cookies(cast(SoupCookieJar*)this._cPtr);
    auto _retval = gSListToD!(gid.soup3.cookie.Cookie, GidOwnership.Full)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Deletes cookie from jar.
      
      Emits the [gid.soup3.cookie_jar.CookieJar.changed] signal.
  
      Params:
        cookie = a #SoupCookie
  */
  void deleteCookie(gid.soup3.cookie.Cookie cookie) nothrow
  {
    soup_cookie_jar_delete_cookie(cast(SoupCookieJar*)this._cPtr, cookie ? cast(SoupCookie*)cookie._cPtr(No.Dup) : null);
  }

  /**
      Gets jar's [gid.soup3.types.CookieJarAcceptPolicy].
      Returns: the #SoupCookieJarAcceptPolicy set in the jar
  */
  gid.soup3.types.CookieJarAcceptPolicy getAcceptPolicy() nothrow
  {
    SoupCookieJarAcceptPolicy _cretval;
    _cretval = soup_cookie_jar_get_accept_policy(cast(SoupCookieJar*)this._cPtr);
    gid.soup3.types.CookieJarAcceptPolicy _retval = cast(gid.soup3.types.CookieJarAcceptPolicy)_cretval;
    return _retval;
  }

  /**
      Retrieves the list of cookies that would be sent with a request to uri
      as a [gid.glib2.list.List] of [gid.soup3.cookie.Cookie] objects.
      
      If for_http is true, the return value will include cookies marked
      "HttpOnly" (that is, cookies that the server wishes to keep hidden
      from client-side scripting operations such as the JavaScript
      document.cookies property). Since [gid.soup3.cookie_jar.CookieJar] sets the Cookie
      header itself when making the actual HTTP request, you should
      almost certainly be setting for_http to false if you are calling
      this.
  
      Params:
        uri = a #GUri
        forHttp = whether or not the return value is being passed directly
            to an HTTP operation
      Returns: a #GSList
          with the cookies in the jar that would be sent with a request to uri.
  */
  gid.soup3.cookie.Cookie[] getCookieList(gid.glib2.uri.Uri uri, bool forHttp) nothrow
  {
    GSList* _cretval;
    _cretval = soup_cookie_jar_get_cookie_list(cast(SoupCookieJar*)this._cPtr, uri ? cast(GUri*)uri._cPtr(No.Dup) : null, forHttp);
    auto _retval = gSListToD!(gid.soup3.cookie.Cookie, GidOwnership.Full)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      This is an extended version of [gid.soup3.cookie_jar.CookieJar.getCookieList] that
      provides more information required to use SameSite cookies.
      
      See the [SameSite cookies
      spec](https://tools.ietf.org/html/draft-ietf-httpbis-cookie-same-site-00) for
      more detailed information.
  
      Params:
        uri = a #GUri
        topLevel = a #GUri for the top level document
        siteForCookies = a #GUri indicating the origin to get cookies for
        forHttp = whether or not the return value is being passed directly
            to an HTTP operation
        isSafeMethod = if the HTTP method is safe, as defined by RFC 7231, ignored when for_http is false
        isTopLevelNavigation = whether or not the HTTP request is part of
            top level navigation
      Returns: a #GSList
          with the cookies in the jar that would be sent with a request to uri.
  */
  gid.soup3.cookie.Cookie[] getCookieListWithSameSiteInfo(gid.glib2.uri.Uri uri, gid.glib2.uri.Uri topLevel, gid.glib2.uri.Uri siteForCookies, bool forHttp, bool isSafeMethod, bool isTopLevelNavigation) nothrow
  {
    GSList* _cretval;
    _cretval = soup_cookie_jar_get_cookie_list_with_same_site_info(cast(SoupCookieJar*)this._cPtr, uri ? cast(GUri*)uri._cPtr(No.Dup) : null, topLevel ? cast(GUri*)topLevel._cPtr(No.Dup) : null, siteForCookies ? cast(GUri*)siteForCookies._cPtr(No.Dup) : null, forHttp, isSafeMethod, isTopLevelNavigation);
    auto _retval = gSListToD!(gid.soup3.cookie.Cookie, GidOwnership.Full)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Retrieves (in Cookie-header form) the list of cookies that would
      be sent with a request to uri.
      
      If for_http is true, the return value will include cookies marked
      "HttpOnly" (that is, cookies that the server wishes to keep hidden
      from client-side scripting operations such as the JavaScript
      document.cookies property). Since [gid.soup3.cookie_jar.CookieJar] sets the Cookie
      header itself when making the actual HTTP request, you should
      almost certainly be setting for_http to false if you are calling
      this.
  
      Params:
        uri = a #GUri
        forHttp = whether or not the return value is being passed directly
            to an HTTP operation
      Returns: the cookies, in string form, or null if
          there are no cookies for uri.
  */
  string getCookies(gid.glib2.uri.Uri uri, bool forHttp) nothrow
  {
    char* _cretval;
    _cretval = soup_cookie_jar_get_cookies(cast(SoupCookieJar*)this._cPtr, uri ? cast(GUri*)uri._cPtr(No.Dup) : null, forHttp);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets whether jar stores cookies persistenly.
      Returns: true if jar storage is persistent or false otherwise.
  */
  bool isPersistent() nothrow
  {
    bool _retval;
    _retval = cast(bool)soup_cookie_jar_is_persistent(cast(SoupCookieJar*)this._cPtr);
    return _retval;
  }

  /**
      Sets policy as the cookie acceptance policy for jar.
  
      Params:
        policy = a #SoupCookieJarAcceptPolicy
  */
  void setAcceptPolicy(gid.soup3.types.CookieJarAcceptPolicy policy) nothrow
  {
    soup_cookie_jar_set_accept_policy(cast(SoupCookieJar*)this._cPtr, policy);
  }

  /**
      Adds cookie to jar, exactly as though it had appeared in a
      Set-Cookie header returned from a request to uri.
      
      Keep in mind that if the [gid.soup3.types.CookieJarAcceptPolicy] set is either
      [gid.soup3.types.CookieJarAcceptPolicy.NoThirdParty] or
      [gid.soup3.types.CookieJarAcceptPolicy.GrandfatheredThirdParty] you'll need to use
      [gid.soup3.cookie_jar.CookieJar.setCookieWithFirstParty], otherwise the jar
      will have no way of knowing if the cookie is being set by a third
      party or not.
  
      Params:
        uri = the URI setting the cookie
        cookie = the stringified cookie to set
  */
  void setCookie(gid.glib2.uri.Uri uri, string cookie) nothrow
  {
    const(char)* _cookie = cookie.toCString!(No.Malloc, No.Nullable);
    soup_cookie_jar_set_cookie(cast(SoupCookieJar*)this._cPtr, uri ? cast(GUri*)uri._cPtr(No.Dup) : null, _cookie);
  }

  /**
      Adds cookie to jar, exactly as though it had appeared in a
      Set-Cookie header returned from a request to uri.
      
      first_party will be used to reject cookies coming from third party resources
      in case such a security policy is set in the jar.
  
      Params:
        uri = the URI setting the cookie
        firstParty = the URI for the main document
        cookie = the stringified cookie to set
  */
  void setCookieWithFirstParty(gid.glib2.uri.Uri uri, gid.glib2.uri.Uri firstParty, string cookie) nothrow
  {
    const(char)* _cookie = cookie.toCString!(No.Malloc, No.Nullable);
    soup_cookie_jar_set_cookie_with_first_party(cast(SoupCookieJar*)this._cPtr, uri ? cast(GUri*)uri._cPtr(No.Dup) : null, firstParty ? cast(GUri*)firstParty._cPtr(No.Dup) : null, _cookie);
  }

  /**
      Connect to `Changed` signal.
  
      Emitted when jar changes.
        
        If a cookie has been added,
        new_cookie will contain the newly-added cookie and
        old_cookie will be null. If a cookie has been deleted,
        old_cookie will contain the to-be-deleted cookie and
        new_cookie will be null. If a cookie has been changed,
        old_cookie will contain its old value, and new_cookie its
        new value.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.soup3.cookie.Cookie oldCookie, gid.soup3.cookie.Cookie newCookie, gid.soup3.cookie_jar.CookieJar cookieJar)`
  
          `oldCookie` the old #SoupCookie value (optional)
  
          `newCookie` the new #SoupCookie value (optional)
  
          `cookieJar` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.soup3.cookie.Cookie)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gid.soup3.cookie.Cookie)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.soup3.cookie_jar.CookieJar)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.soup3.cookie_jar.CookieJar.changed");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("changed", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gobject.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from CookieJar
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.soup3.cookie_jar.CookieJar), T.stringof ~ " is not derived from gid.soup3.cookie_jar.CookieJar");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncChanged", true)[0]) == gid.soup3.cookie_jar.CookieJar))
      _installVfunc(klass, "changed");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncIsPersistent", true)[0]) == gid.soup3.cookie_jar.CookieJar))
      _installVfunc(klass, "is_persistent");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSave", true)[0]) == gid.soup3.cookie_jar.CookieJar))
      _installVfunc(klass, "save");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(SoupCookieJarClass*)klass;

    switch (vfunc)
    {
      case "changed":
      {
        static extern(C) void _vfuncChangedTramp(SoupCookieJar* jar, SoupCookie* oldCookie, SoupCookie* newCookie) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.soup3.cookie_jar.CookieJar)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)jar);
          if (!_obj)
          {
            auto _klass = cast(SoupCookieJarClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)jar);
            if (_klass.changed)
              return (cast(typeof(&_vfuncChangedTramp))_klass.changed)(jar, oldCookie, newCookie);
            return;
          }

          auto _oldCookie = oldCookie ? new gid.soup3.cookie.Cookie(cast(void*)oldCookie, Yes.Take)._cBorrow : null;
          auto _newCookie = newCookie ? new gid.soup3.cookie.Cookie(cast(void*)newCookie, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncChanged(_oldCookie, _newCookie);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.soup3.cookie_jar.CookieJar.vfuncChanged");
          }
          if (_oldCookie)
            _oldCookie._cUnborrow;
          if (_newCookie)
            _newCookie._cUnborrow;

        }

        _klass.changed = cast(typeof(_klass.changed))&_vfuncChangedTramp;
        break;
      }
      case "is_persistent":
      {
        static extern(C) gboolean _vfuncIsPersistentTramp(SoupCookieJar* jar) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.soup3.cookie_jar.CookieJar)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)jar);
          if (!_obj)
          {
            auto _klass = cast(SoupCookieJarClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)jar);
            if (_klass.isPersistent)
              return (cast(typeof(&_vfuncIsPersistentTramp))_klass.isPersistent)(jar);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncIsPersistent();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.soup3.cookie_jar.CookieJar.vfuncIsPersistent");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.isPersistent = cast(typeof(_klass.isPersistent))&_vfuncIsPersistentTramp;
        break;
      }
      case "save":
      {
        static extern(C) void _vfuncSaveTramp(SoupCookieJar* jar) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.soup3.cookie_jar.CookieJar)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)jar);
          if (!_obj)
          {
            auto _klass = cast(SoupCookieJarClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)jar);
            if (_klass.save)
              return (cast(typeof(&_vfuncSaveTramp))_klass.save)(jar);
            return;
          }

          try
          {
            _obj.vfuncSave();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.soup3.cookie_jar.CookieJar.vfuncSave");
          }
        }

        _klass.save = cast(typeof(_klass.save))&_vfuncSaveTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.soup3.cookie_jar.CookieJar]
class CookieJarGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.soup3.session_feature.SessionFeatureGidBuilderImpl!T
{

  mixin SessionFeatureGidBuilderT!();

  /**
      Set `acceptPolicy` property.
      Params:
        propval = The policy the jar should follow to accept or reject cookies.
      Returns: Builder instance for fluent chaining
  */
  T acceptPolicy(gid.soup3.types.CookieJarAcceptPolicy propval) nothrow
  {
    return setProperty("accept-policy", propval);
  }

  /**
      Set `readOnly` property.
      Params:
        propval = Whether or not the cookie jar is read-only.
      Returns: Builder instance for fluent chaining
  */
  T readOnly(bool propval) nothrow
  {
    return setProperty("read-only", propval);
  }
}

/// Fluent builder for [gid.soup3.cookie_jar.CookieJar]
final class CookieJarGidBuilder : CookieJarGidBuilderImpl!CookieJarGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CookieJar build() nothrow
  {
    return new CookieJar(cast(void*)createGObject(CookieJar._getGType), Yes.Take);
  }
}
