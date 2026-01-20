/// Module for [ATContext] class
module gtk.atcontext;

import gdk.display;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    [gtk.atcontext.ATContext] is an abstract class provided by GTK to communicate to
    platform-specific assistive technologies API.
    
    Each platform supported by GTK implements a [gtk.atcontext.ATContext] subclass, and
    is responsible for updating the accessible state in response to state
    changes in [gtk.accessible.Accessible].
*/
class ATContext : gobject.object.ObjectWrap
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
    return cast(void function())gtk_at_context_get_type != &gidSymbolNotFound ? gtk_at_context_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ATContext self()
  {
    return this;
  }

  /**
      Get `accessibleRole` property.
      Returns: The accessible role used by the AT context.
        
        Depending on the given role, different states and properties can be
        set or retrieved.
  */
  @property gtk.types.AccessibleRole accessibleRole()
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
  @property void accessibleRole(gtk.types.AccessibleRole propval)
  {
    gobject.object.ObjectWrap.setProperty!(gtk.types.AccessibleRole)("accessible-role", propval);
  }

  /**
      Get `display` property.
      Returns: The [gdk.display.Display] for the [gtk.atcontext.ATContext].
  */
  @property gdk.display.Display display()
  {
    return gobject.object.ObjectWrap.getProperty!(gdk.display.Display)("display");
  }

  /**
      Set `display` property.
      Params:
        propval = The [gdk.display.Display] for the [gtk.atcontext.ATContext].
  */
  @property void display(gdk.display.Display propval)
  {
    gobject.object.ObjectWrap.setProperty!(gdk.display.Display)("display", propval);
  }

  /**
      Creates a new [gtk.atcontext.ATContext] instance for the given accessible role,
      accessible instance, and display connection.
      
      The [gtk.atcontext.ATContext] implementation being instantiated will depend on the
      platform.
  
      Params:
        accessibleRole = the accessible role used by the [gtk.atcontext.ATContext]
        accessible = the [gtk.accessible.Accessible] implementation using the [gtk.atcontext.ATContext]
        display = the [gdk.display.Display] used by the [gtk.atcontext.ATContext]
      Returns: the [gtk.atcontext.ATContext]
  */
  static gtk.atcontext.ATContext create(gtk.types.AccessibleRole accessibleRole, gtk.accessible.Accessible accessible, gdk.display.Display display)
  {
    GtkATContext* _cretval;
    _cretval = gtk_at_context_create(accessibleRole, accessible ? cast(GtkAccessible*)(cast(gobject.object.ObjectWrap)accessible)._cPtr(No.Dup) : null, display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.atcontext.ATContext)(cast(GtkATContext*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Retrieves the [gtk.accessible.Accessible] using this context.
      Returns: a [gtk.accessible.Accessible]
  */
  gtk.accessible.Accessible getAccessible()
  {
    GtkAccessible* _cretval;
    _cretval = gtk_at_context_get_accessible(cast(GtkATContext*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.accessible.Accessible)(cast(GtkAccessible*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the accessible role of this context.
      Returns: a [gtk.types.AccessibleRole]
  */
  gtk.types.AccessibleRole getAccessibleRole()
  {
    GtkAccessibleRole _cretval;
    _cretval = gtk_at_context_get_accessible_role(cast(GtkATContext*)this._cPtr);
    gtk.types.AccessibleRole _retval = cast(gtk.types.AccessibleRole)_cretval;
    return _retval;
  }

  /**
      Connect to `StateChange` signal.
  
      Emitted when the attributes of the accessible for the
        [gtk.atcontext.ATContext] instance change.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.atcontext.ATContext aTContext))
  
          `aTContext` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectStateChange(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.atcontext.ATContext)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("state-change", closure, after);
  }
}
