/// Module for [ATContext] class
module gid.gtk4.atcontext;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.display;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;

/**
    Communicates with platform-specific assistive technologies API.
    
    Each platform supported by GTK implements a [gid.gtk4.atcontext.ATContext] subclass, and
    is responsible for updating the accessible state in response to state
    changes in [gid.gtk4.accessible.Accessible].
*/
class ATContext : gid.gobject2.object.ObjectWrap
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
    return cast(void function())gtk_at_context_get_type != &gidSymbolNotFound ? gtk_at_context_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkATContext";
  }

  /** Returns `this`, for use in `with` statements. */
  override ATContext self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.atcontext.ATContext]
      Returns: New builder object
  */
  static ATContextGidBuilder builder() nothrow
  {
    return new ATContextGidBuilder;
  }

  /**
      Get `accessible` property.
      Returns: The [gid.gtk4.accessible.Accessible] that created the [gid.gtk4.atcontext.ATContext] instance.
  */
  @property gid.gtk4.accessible.Accessible accessible() nothrow
  {
    return getAccessible();
  }

  /**
      Get `accessibleRole` property.
      Returns: The accessible role used by the AT context.
        
        Depending on the given role, different states and properties can be
        set or retrieved.
  */
  @property gid.gtk4.types.AccessibleRole accessibleRole() nothrow
  {
    return getAccessibleRole();
  }

  /**
      Set `accessibleRole` property.
      Params:
        propval = The accessible role used by the AT context.
          
          Depending on the given role, different states and properties can be
          set or retrieved.
  */
  @property void accessibleRole(gid.gtk4.types.AccessibleRole propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gtk4.types.AccessibleRole)("accessible-role", propval);
  }

  /**
      Get `display` property.
      Returns: The [gid.gdk4.display.Display] for the [gid.gtk4.atcontext.ATContext].
  */
  @property gid.gdk4.display.Display display() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gdk4.display.Display)("display");
  }

  /**
      Set `display` property.
      Params:
        propval = The [gid.gdk4.display.Display] for the [gid.gtk4.atcontext.ATContext].
  */
  @property void display(gid.gdk4.display.Display propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gdk4.display.Display)("display", propval);
  }

  /**
      Get `realized` property.
      Returns: Whether the [gid.gtk4.atcontext.ATContext] has been realized or not.
  */
  @property bool realized() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("realized");
  }

  /**
      Creates a new [gid.gtk4.atcontext.ATContext] instance for the given accessible role,
      accessible instance, and display connection.
      
      The [gid.gtk4.atcontext.ATContext] implementation being instantiated will depend on the
      platform.
  
      Params:
        accessibleRole = the accessible role used by the [gid.gtk4.atcontext.ATContext]
        accessible = the [gid.gtk4.accessible.Accessible] implementation using the [gid.gtk4.atcontext.ATContext]
        display = the [gid.gdk4.display.Display] used by the [gid.gtk4.atcontext.ATContext]
      Returns: the [gid.gtk4.atcontext.ATContext]
  */
  static gid.gtk4.atcontext.ATContext create(gid.gtk4.types.AccessibleRole accessibleRole, gid.gtk4.accessible.Accessible accessible, gid.gdk4.display.Display display) nothrow
  {
    GtkATContext* _cretval;
    _cretval = gtk_at_context_create(accessibleRole, accessible ? cast(GtkAccessible*)(cast(gid.gobject2.object.ObjectWrap)accessible)._cPtr(No.Dup) : null, display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.atcontext.ATContext)(cast(GtkATContext*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Retrieves the [gid.gtk4.accessible.Accessible] using this context.
      Returns: a [gid.gtk4.accessible.Accessible]
  */
  gid.gtk4.accessible.Accessible getAccessible() nothrow
  {
    GtkAccessible* _cretval;
    _cretval = gtk_at_context_get_accessible(cast(GtkATContext*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.accessible.Accessible)(cast(GtkAccessible*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the accessible role of this context.
      Returns: a [gid.gtk4.types.AccessibleRole]
  */
  gid.gtk4.types.AccessibleRole getAccessibleRole() nothrow
  {
    GtkAccessibleRole _cretval;
    _cretval = gtk_at_context_get_accessible_role(cast(GtkATContext*)this._cPtr);
    gid.gtk4.types.AccessibleRole _retval = cast(gid.gtk4.types.AccessibleRole)_cretval;
    return _retval;
  }

  /**
      Connect to `StateChange` signal.
  
      Emitted when the attributes of the accessible for the
        [gid.gtk4.atcontext.ATContext] instance change.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.atcontext.ATContext aTContext)`
  
          `aTContext` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectStateChange(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.atcontext.ATContext)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.atcontext.ATContext.stateChange");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("state-change", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gtk4.atcontext.ATContext]
class ATContextGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `accessible` property.
      Params:
        propval = The [gid.gtk4.accessible.Accessible] that created the [gid.gtk4.atcontext.ATContext] instance.
      Returns: Builder instance for fluent chaining
  */
  T accessible(gid.gtk4.accessible.Accessible propval) nothrow
  {
    return setProperty("accessible", propval);
  }

  /**
      Set `accessibleRole` property.
      Params:
        propval = The accessible role used by the AT context.
          
          Depending on the given role, different states and properties can be
          set or retrieved.
      Returns: Builder instance for fluent chaining
  */
  T accessibleRole(gid.gtk4.types.AccessibleRole propval) nothrow
  {
    return setProperty("accessible-role", propval);
  }

  /**
      Set `display` property.
      Params:
        propval = The [gid.gdk4.display.Display] for the [gid.gtk4.atcontext.ATContext].
      Returns: Builder instance for fluent chaining
  */
  T display(gid.gdk4.display.Display propval) nothrow
  {
    return setProperty("display", propval);
  }
}

/// Fluent builder for [gid.gtk4.atcontext.ATContext]
final class ATContextGidBuilder : ATContextGidBuilderImpl!ATContextGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ATContext build() nothrow
  {
    return new ATContext(cast(void*)createGObject(ATContext._getGType), Yes.Take);
  }
}
