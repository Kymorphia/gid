/// Module for [FlowBoxChild] class
module gid.gtk4.flow_box_child;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    The kind of widget that can be added to a [gid.gtk4.flow_box.FlowBox].
    
    [gid.gtk4.flow_box.FlowBox] will automatically wrap its children in a [gid.gtk4.flow_box_child.FlowBoxChild]
    when necessary.
*/
@gidGir("FlowBoxChild", "FlowBoxChildClass")
class FlowBoxChild : gid.gtk4.widget.Widget
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
    return cast(void function())gtk_flow_box_child_get_type != &gidSymbolNotFound ? gtk_flow_box_child_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkFlowBoxChild";
  }

  /** Returns `this`, for use in `with` statements. */
  override FlowBoxChild self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.flow_box_child.FlowBoxChild]
      Returns: New builder object
  */
  static FlowBoxChildGidBuilder builder() nothrow
  {
    return new FlowBoxChildGidBuilder;
  }

  /**
      Get `child` property.
      Returns: The child widget.
  */
  @property gid.gtk4.widget.Widget child() nothrow
  {
    return getChild();
  }

  /**
      Set `child` property.
      Params:
        propval = The child widget.
  */
  @property void child(gid.gtk4.widget.Widget propval) nothrow
  {
    setChild(propval);
  }

  /**
      Creates a new [gid.gtk4.flow_box_child.FlowBoxChild].
      
      This should only be used as a child of a [gid.gtk4.flow_box.FlowBox].
      Returns: a new [gid.gtk4.flow_box_child.FlowBoxChild]
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_flow_box_child_new();
      this(_cretval, No.Take);
    }
  }

  /** */
  protected void vfuncActivate()
  {
    auto _klass = cast(GtkFlowBoxChildClass*)_vfuncClass;
    if (!_klass.activate)
      return;

    _klass.activate(cast(GtkFlowBoxChild*)this._cPtr);
  }

  /**
      Marks child as changed, causing any state that depends on this
      to be updated.
      
      This affects sorting and filtering.
      
      Note that calls to this method must be in sync with the data
      used for the sorting and filtering functions. For instance, if
      the list is mirroring some external data set, and *two* children
      changed in the external data set when you call
      [gid.gtk4.flow_box_child.FlowBoxChild.changed] on the first child, the sort function
      must only read the new data for the first of the two changed
      children, otherwise the resorting of the children will be wrong.
      
      This generally means that if you don’t fully control the data
      model, you have to duplicate the data that affects the sorting
      and filtering functions into the widgets themselves.
      
      Another alternative is to call [gid.gtk4.flow_box.FlowBox.invalidateSort]
      on any model change, but that is more expensive.
  */
  void changed() nothrow
  {
    gtk_flow_box_child_changed(cast(GtkFlowBoxChild*)this._cPtr);
  }

  /**
      Gets the child widget of self.
      Returns: the child widget of self
  */
  gid.gtk4.widget.Widget getChild() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_flow_box_child_get_child(cast(GtkFlowBoxChild*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the current index of the child in its [gid.gtk4.flow_box.FlowBox] container.
      Returns: the index of the child, or -1 if the child is not
          in a flow box
  */
  int getIndex() nothrow
  {
    int _retval;
    _retval = gtk_flow_box_child_get_index(cast(GtkFlowBoxChild*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the child is currently selected in its
      [gid.gtk4.flow_box.FlowBox] container.
      Returns: true if child is selected
  */
  bool isSelected() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_flow_box_child_is_selected(cast(GtkFlowBoxChild*)this._cPtr);
    return _retval;
  }

  /**
      Sets the child widget of self.
  
      Params:
        child = the child widget
  */
  void setChild(gid.gtk4.widget.Widget child = null) nothrow
  {
    gtk_flow_box_child_set_child(cast(GtkFlowBoxChild*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Connect to `Activate` signal.
  
      Emitted when the user activates a child widget in a [gid.gtk4.flow_box.FlowBox].
        
        This can happen either by clicking or double-clicking,
        or via a keybinding.
        
        This is a [keybinding signal](class.SignalAction.html),
        but it can be used by applications for their own purposes.
        
        The default bindings are <kbd>Space</kbd> and <kbd>Enter</kbd>.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.flow_box_child.FlowBoxChild flowBoxChild)`
  
          `flowBoxChild` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectActivate(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.flow_box_child.FlowBoxChild)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.flow_box_child.FlowBoxChild.activate");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from FlowBoxChild
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk4.flow_box_child.FlowBoxChild), T.stringof ~ " is not derived from gid.gtk4.flow_box_child.FlowBoxChild");

    gid.gtk4.widget.Widget._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncActivate", true)[0]) == gid.gtk4.flow_box_child.FlowBoxChild))
      _installVfunc(klass, "activate");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkFlowBoxChildClass*)klass;

    switch (vfunc)
    {
      case "activate":
      {
        static extern(C) void _vfuncActivateTramp(GtkFlowBoxChild* child) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.flow_box_child.FlowBoxChild)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)child);
          if (!_obj)
          {
            auto _klass = cast(GtkFlowBoxChildClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)child);
            if (_klass.activate)
              return (cast(typeof(&_vfuncActivateTramp))_klass.activate)(child);
            return;
          }

          try
          {
            _obj.vfuncActivate();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.flow_box_child.FlowBoxChild.vfuncActivate");
          }
        }

        _klass.activate = cast(typeof(_klass.activate))&_vfuncActivateTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk4.flow_box_child.FlowBoxChild]
class FlowBoxChildGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `child` property.
      Params:
        propval = The child widget.
      Returns: Builder instance for fluent chaining
  */
  T child(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("child", propval);
  }
}

/// Fluent builder for [gid.gtk4.flow_box_child.FlowBoxChild]
final class FlowBoxChildGidBuilder : FlowBoxChildGidBuilderImpl!FlowBoxChildGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FlowBoxChild build() nothrow
  {
    return new FlowBoxChild(cast(void*)createGObject(FlowBoxChild._getGType), Yes.Take);
  }
}
