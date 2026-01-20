/// Module for [FlowBoxChild] class
module gtk.flow_box_child;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.types;
import gtk.widget;

/**
    [gtk.flow_box_child.FlowBoxChild] is the kind of widget that can be added to a [gtk.flow_box.FlowBox].
*/
class FlowBoxChild : gtk.widget.Widget
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
    return cast(void function())gtk_flow_box_child_get_type != &gidSymbolNotFound ? gtk_flow_box_child_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FlowBoxChild self()
  {
    return this;
  }

  /**
      Get `child` property.
      Returns: The child widget.
  */
  @property gtk.widget.Widget child()
  {
    return getChild();
  }

  /**
      Set `child` property.
      Params:
        propval = The child widget.
  */
  @property void child(gtk.widget.Widget propval)
  {
    return setChild(propval);
  }

  /**
      Creates a new [gtk.flow_box_child.FlowBoxChild].
      
      This should only be used as a child of a [gtk.flow_box.FlowBox].
      Returns: a new [gtk.flow_box_child.FlowBoxChild]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_flow_box_child_new();
    this(_cretval, No.Take);
  }

  /**
      Marks child as changed, causing any state that depends on this
      to be updated.
      
      This affects sorting and filtering.
      
      Note that calls to this method must be in sync with the data
      used for the sorting and filtering functions. For instance, if
      the list is mirroring some external data set, and *two* children
      changed in the external data set when you call
      [gtk.flow_box_child.FlowBoxChild.changed] on the first child, the sort function
      must only read the new data for the first of the two changed
      children, otherwise the resorting of the children will be wrong.
      
      This generally means that if you don’t fully control the data
      model, you have to duplicate the data that affects the sorting
      and filtering functions into the widgets themselves.
      
      Another alternative is to call [gtk.flow_box.FlowBox.invalidateSort]
      on any model change, but that is more expensive.
  */
  void changed()
  {
    gtk_flow_box_child_changed(cast(GtkFlowBoxChild*)this._cPtr);
  }

  /**
      Gets the child widget of self.
      Returns: the child widget of self
  */
  gtk.widget.Widget getChild()
  {
    GtkWidget* _cretval;
    _cretval = gtk_flow_box_child_get_child(cast(GtkFlowBoxChild*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the current index of the child in its [gtk.flow_box.FlowBox] container.
      Returns: the index of the child, or -1 if the child is not
          in a flow box
  */
  int getIndex()
  {
    int _retval;
    _retval = gtk_flow_box_child_get_index(cast(GtkFlowBoxChild*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the child is currently selected in its
      [gtk.flow_box.FlowBox] container.
      Returns: true if child is selected
  */
  bool isSelected()
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
  void setChild(gtk.widget.Widget child = null)
  {
    gtk_flow_box_child_set_child(cast(GtkFlowBoxChild*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Connect to `Activate` signal.
  
      Emitted when the user activates a child widget in a [gtk.flow_box.FlowBox].
        
        This can happen either by clicking or double-clicking,
        or via a keybinding.
        
        This is a [keybinding signal](class.SignalAction.html),
        but it can be used by applications for their own purposes.
        
        The default bindings are <kbd>Space</kbd> and <kbd>Enter</kbd>.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.flow_box_child.FlowBoxChild flowBoxChild))
  
          `flowBoxChild` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectActivate(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.flow_box_child.FlowBoxChild)))
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
    return connectSignalClosure("activate", closure, after);
  }
}
