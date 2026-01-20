/// Module for [Breakpoint] class
module adw.breakpoint;

import adw.breakpoint_condition;
import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gobject.value;
import gtk.buildable;
import gtk.buildable_mixin;

/**
    Describes a breakpoint for `class@Window` or `class@Dialog`.
    
    Breakpoints are used to create adaptive UI, allowing to change the layout
    depending on available size.
    
    Breakpoint is a size threshold, specified by its condition, as well as one or
    more setters.
    
    Each setter has a target object, a property and a value. When a breakpoint
    is applied, each setter sets the target property on their target object to
    the specified value, and reset it back to the original value when it's
    unapplied.
    
    For more complicated scenarios, `signal@Breakpoint::apply` and
    `signal@Breakpoint::unapply` can be used instead.
    
    Breakpoints can be used within `class@Window`, `class@ApplicationWindow`,
    `class@Dialog` or `class@BreakpointBin`.
    
    ## [adw.breakpoint.Breakpoint] as [gtk.buildable.Buildable]:
    
    [adw.breakpoint.Breakpoint] supports specifying its condition via the `<condition>`
    element. The contents of the element must be a string in a format accepted by
    [adw.breakpoint_condition.BreakpointCondition.parse].
    
    It also supports adding setters via the `<setter>` element. Each `<setter>`
    element must have the `object` attribute specifying the target object, and
    the `property` attribute specifying the property name. The contents of the
    element are used as the setter value.
    
    For `G_TYPE_OBJECT` and `G_TYPE_BOXED` derived properties, empty contents are
    treated as `NULL`.
    
    Setter values can be translated with the usual `translatable`, `context` and
    `comments` attributes.
    
    Example of an [adw.breakpoint.Breakpoint] UI definition:
    
    ```xml
    <object class="AdwBreakpoint">
      <condition>max-width: 400px</condition>
      <setter object="button" property="visible">True</setter>
      <setter object="box" property="orientation">vertical</setter>
      <setter object="page" property="title" translatable="yes">Example</setter>
    </object>
    ```
*/
class Breakpoint : gobject.object.ObjectWrap, gtk.buildable.Buildable
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
    return cast(void function())adw_breakpoint_get_type != &gidSymbolNotFound ? adw_breakpoint_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Breakpoint self()
  {
    return this;
  }

  /**
      Get `condition` property.
      Returns: The breakpoint's condition.
  */
  @property adw.breakpoint_condition.BreakpointCondition condition()
  {
    return getCondition();
  }

  /**
      Set `condition` property.
      Params:
        propval = The breakpoint's condition.
  */
  @property void condition(adw.breakpoint_condition.BreakpointCondition propval)
  {
    return setCondition(propval);
  }

  mixin BuildableT!();

  /**
      Creates a new [adw.breakpoint.Breakpoint] with condition.
  
      Params:
        condition = the condition
      Returns: the newly created [adw.breakpoint.Breakpoint]
  */
  this(adw.breakpoint_condition.BreakpointCondition condition)
  {
    AdwBreakpoint* _cretval;
    _cretval = adw_breakpoint_new(condition ? cast(AdwBreakpointCondition*)condition._cPtr(Yes.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Adds a setter to self.
      
      The setter will automatically set property on object to value when
      applying the breakpoint, and set it back to its original value upon
      unapplying it.
      
      ::: note
          Setting properties to their original values does not work for properties
          that have irreversible side effects. For example, changing
          [gtk.button.Button.label] while `propertyGtk.Button:icon-name` is set
          will reset the icon. However, resetting the label will not set
          `icon-name` to its original value.
      
      Use the `signalBreakpoint::apply` and `signalBreakpoint::unapply` signals
      for those properties instead, as follows:
      
      ```c
      static void
      breakpoint_apply_cb (MyWidget *self)
      {
        gtk_button_set_icon_name (self->button, "go-previous-symbolic");
      }
      
      static void
      breakpoint_apply_cb (MyWidget *self)
      {
        gtk_button_set_label (self->button, _("_Back"));
      }
      
      // ...
      
      g_signal_connect_swapped (breakpoint, "apply",
                                G_CALLBACK (breakpoint_apply_cb), self);
      g_signal_connect_swapped (breakpoint, "unapply",
                                G_CALLBACK (breakpoint_unapply_cb), self);
      ```
  
      Params:
        object = the target object
        property = the target property
        value = the value to set
  */
  void addSetter(gobject.object.ObjectWrap object, string property, gobject.value.Value value = null)
  {
    const(char)* _property = property.toCString(No.Alloc);
    adw_breakpoint_add_setter(cast(AdwBreakpoint*)this._cPtr, object ? cast(GObject*)object._cPtr(No.Dup) : null, _property, value ? cast(const(GValue)*)value._cPtr(No.Dup) : null);
  }

  /**
      Adds n_setters setters to self.
      
      This is a convenience function for adding multiple setters at once.
      
      See [adw.breakpoint.Breakpoint.addSetter].
      
      This function is meant to be used by language bindings.
  
      Params:
        objects = setter target object
        names = setter target properties
        values = setter values
  */
  void addSetters(gobject.object.ObjectWrap[] objects, string[] names, gobject.value.Value[] values)
  {
    int _nSetters;
    if (objects)
      _nSetters = cast(int)objects.length;

    GObject*[] _tmpobjects;
    foreach (obj; objects)
      _tmpobjects ~= obj ? cast(GObject*)obj._cPtr : null;
    GObject** _objects = cast(GObject**)_tmpobjects.ptr;

    if (names)
      _nSetters = cast(int)names.length;

    char*[] _tmpnames;
    foreach (s; names)
      _tmpnames ~= s.toCString(No.Alloc);
    const(char*)* _names = _tmpnames.ptr;

    if (values)
      _nSetters = cast(int)values.length;

    GValue*[] _tmpvalues;
    foreach (obj; values)
      _tmpvalues ~= cast(GValue*)obj._cPtr;
    const(GValue*)* _values = _tmpvalues.ptr;

    adw_breakpoint_add_settersv(cast(AdwBreakpoint*)this._cPtr, _nSetters, _objects, _names, _values);
  }

  /**
      Gets the condition for self.
      Returns: the condition
  */
  adw.breakpoint_condition.BreakpointCondition getCondition()
  {
    AdwBreakpointCondition* _cretval;
    _cretval = adw_breakpoint_get_condition(cast(AdwBreakpoint*)this._cPtr);
    auto _retval = _cretval ? new adw.breakpoint_condition.BreakpointCondition(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Sets the condition for self.
  
      Params:
        condition = the new condition
  */
  void setCondition(adw.breakpoint_condition.BreakpointCondition condition = null)
  {
    adw_breakpoint_set_condition(cast(AdwBreakpoint*)this._cPtr, condition ? cast(AdwBreakpointCondition*)condition._cPtr(No.Dup) : null);
  }

  /**
      Connect to `Apply` signal.
  
      Emitted when the breakpoint is applied.
        
        This signal is emitted after the setters have been applied.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(adw.breakpoint.Breakpoint breakpoint))
  
          `breakpoint` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectApply(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : adw.breakpoint.Breakpoint)))
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
    return connectSignalClosure("apply", closure, after);
  }

  /**
      Connect to `Unapply` signal.
  
      Emitted when the breakpoint is unapplied.
        
        This signal is emitted before resetting the setter values.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(adw.breakpoint.Breakpoint breakpoint))
  
          `breakpoint` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectUnapply(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : adw.breakpoint.Breakpoint)))
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
    return connectSignalClosure("unapply", closure, after);
  }
}
