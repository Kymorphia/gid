/// Module for [ParamSpec] class
module gobject.param_spec;

import gid.gid;
import glib.types;
import gobject.c.functions;
import gobject.c.types;
import gobject.types;
import gobject.value;

/**
    [gobject.param_spec.ParamSpec] encapsulates the metadata required to specify parameters, such as [gobject.object.ObjectWrap] properties.
    
    ## Parameter names
    
    A property name consists of one or more segments consisting of ASCII letters
    and digits, separated by either the `-` or `_` character. The first
    character of a property name must be a letter. These are the same rules as
    for signal naming (see `func@GObject.signal_new`).
    
    When creating and looking up a [gobject.param_spec.ParamSpec], either separator can be
    used, but they cannot be mixed. Using `-` is considerably more
    efficient, and is the ‘canonical form’. Using `_` is discouraged.
*/
class ParamSpec
{
  GParamSpec* _cInstancePtr;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gobject.param_spec.ParamSpec");

    _cInstancePtr = cast(GParamSpec*)ptr;

    if (!take)
      g_param_spec_ref(_cInstancePtr);
  }

  ~this()
  {
    g_param_spec_unref(_cInstancePtr);
  }


  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    if (dup)
      g_param_spec_ref(_cInstancePtr);

    return _cInstancePtr;
  }

  /**
      Validate a property name for a #GParamSpec. This can be useful for
      dynamically-generated properties which need to be validated at run-time
      before actually trying to create them.
      
      See [canonical parameter names][canonical-parameter-names] for details of
      the rules for valid names.
  
      Params:
        name = the canonical name of the property
      Returns: true if name is a valid property name, false otherwise.
  */
  static bool isValidName(string name)
  {
    bool _retval;
    const(char)* _name = name.toCString(No.Alloc);
    _retval = cast(bool)g_param_spec_is_valid_name(_name);
    return _retval;
  }

  /**
      Get the short description of a #GParamSpec.
      Returns: the short description of pspec.
  */
  string getBlurb()
  {
    const(char)* _cretval;
    _cretval = g_param_spec_get_blurb(cast(GParamSpec*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the default value of pspec as a pointer to a #GValue.
      
      The #GValue will remain valid for the life of pspec.
      Returns: a pointer to a #GValue which must not be modified
  */
  gobject.value.Value getDefaultValue()
  {
    const(GValue)* _cretval;
    _cretval = g_param_spec_get_default_value(cast(GParamSpec*)this._cPtr);
    auto _retval = _cretval ? new gobject.value.Value(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Get the name of a #GParamSpec.
      
      The name is always an "interned" string (as per [glib.global.internString]).
      This allows for pointer-value comparisons.
      Returns: the name of pspec.
  */
  string getName()
  {
    const(char)* _cretval;
    _cretval = g_param_spec_get_name(cast(GParamSpec*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the GQuark for the name.
      Returns: the GQuark for pspec->name.
  */
  glib.types.Quark getNameQuark()
  {
    glib.types.Quark _retval;
    _retval = g_param_spec_get_name_quark(cast(GParamSpec*)this._cPtr);
    return _retval;
  }

  /**
      Get the nickname of a #GParamSpec.
      Returns: the nickname of pspec.
  */
  string getNick()
  {
    const(char)* _cretval;
    _cretval = g_param_spec_get_nick(cast(GParamSpec*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets back user data pointers stored via [gobject.param_spec.ParamSpec.setQdata].
  
      Params:
        quark = a #GQuark, naming the user data pointer
      Returns: the user data pointer set, or null
  */
  void* getQdata(glib.types.Quark quark)
  {
    auto _retval = g_param_spec_get_qdata(cast(GParamSpec*)this._cPtr, quark);
    return _retval;
  }

  /**
      If the paramspec redirects operations to another paramspec,
      returns that paramspec. Redirect is used typically for
      providing a new implementation of a property in a derived
      type while preserving all the properties from the parent
      type. Redirection is established by creating a property
      of type #GParamSpecOverride. See [gobject.object_class.ObjectClass.overrideProperty]
      for an example of the use of this capability.
      Returns: paramspec to which requests on this
                 paramspec should be redirected, or null if none.
  */
  gobject.param_spec.ParamSpec getRedirectTarget()
  {
    GParamSpec* _cretval;
    _cretval = g_param_spec_get_redirect_target(cast(GParamSpec*)this._cPtr);
    auto _retval = _cretval ? new gobject.param_spec.ParamSpec(cast(GParamSpec*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Sets an opaque, named pointer on a #GParamSpec. The name is
      specified through a #GQuark (retrieved e.g. via
      [glib.global.quarkFromStaticString]), and the pointer can be gotten back
      from the pspec with [gobject.param_spec.ParamSpec.getQdata].  Setting a
      previously set user data pointer, overrides (frees) the old pointer
      set, using null as pointer essentially removes the data stored.
  
      Params:
        quark = a #GQuark, naming the user data pointer
        data = an opaque user data pointer
  */
  void setQdata(glib.types.Quark quark, void* data = null)
  {
    g_param_spec_set_qdata(cast(GParamSpec*)this._cPtr, quark, data);
  }

  /**
      The initial reference count of a newly created #GParamSpec is 1,
      even though no one has explicitly called [gobject.param_spec.ParamSpec.ref_] on it
      yet. So the initial reference count is flagged as "floating", until
      someone calls `g_param_spec_ref (pspec); g_param_spec_sink
      (pspec);` in sequence on it, taking over the initial
      reference count (thus ending up with a pspec that has a reference
      count of 1 still, but is not flagged "floating" anymore).
  */
  void sink()
  {
    g_param_spec_sink(cast(GParamSpec*)this._cPtr);
  }

  /**
      Gets back user data pointers stored via [gobject.param_spec.ParamSpec.setQdata]
      and removes the data from pspec without invoking its destroy()
      function (if any was set).  Usually, calling this function is only
      required to update user data pointers with a destroy notifier.
  
      Params:
        quark = a #GQuark, naming the user data pointer
      Returns: the user data pointer set, or null
  */
  void* stealQdata(glib.types.Quark quark)
  {
    auto _retval = g_param_spec_steal_qdata(cast(GParamSpec*)this._cPtr, quark);
    return _retval;
  }
}
