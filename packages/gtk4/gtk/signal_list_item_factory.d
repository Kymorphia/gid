/// Module for [SignalListItemFactory] class
module gtk.signal_list_item_factory;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.list_item_factory;
import gtk.types;

/**
    [gtk.signal_list_item_factory.SignalListItemFactory] is a [gtk.list_item_factory.ListItemFactory] that emits signals
    to manage listitems.
    
    Signals are emitted for every listitem in the same order:
    
     1. [gtk.signal_list_item_factory.SignalListItemFactory.setup] is emitted to set up permanent
     things on the listitem. This usually means constructing the widgets used in
     the row and adding them to the listitem.
    
     2. [gtk.signal_list_item_factory.SignalListItemFactory.bind] is emitted to bind the item passed
     via [gtk.list_item.ListItem.item] to the widgets that have been created in
     step 1 or to add item-specific widgets. Signals are connected to listen to
     changes - both to changes in the item to update the widgets or to changes
     in the widgets to update the item. After this signal has been called, the
     listitem may be shown in a list widget.
    
     3. [gtk.signal_list_item_factory.SignalListItemFactory.unbind] is emitted to undo everything
     done in step 2. Usually this means disconnecting signal handlers. Once this
     signal has been called, the listitem will no longer be used in a list
     widget.
    
     4. [gtk.signal_list_item_factory.SignalListItemFactory.bind] and
     [gtk.signal_list_item_factory.SignalListItemFactory.unbind] may be emitted multiple times
     again to bind the listitem for use with new items. By reusing listitems,
     potentially costly setup can be avoided. However, it means code needs to
     make sure to properly clean up the listitem in step 3 so that no information
     from the previous use leaks into the next use.
    
    5. [gtk.signal_list_item_factory.SignalListItemFactory.teardown] is emitted to allow undoing
    the effects of [gtk.signal_list_item_factory.SignalListItemFactory.setup]. After this signal
    was emitted on a listitem, the listitem will be destroyed and not be used again.
    
    Note that during the signal emissions, changing properties on the
    listitems passed will not trigger notify signals as the listitem's
    notifications are frozen. See [gobject.object.ObjectWrap.freezeNotify] for details.
    
    For tracking changes in other properties in the listitem, the
    ::notify signal is recommended. The signal can be connected in the
    [gtk.signal_list_item_factory.SignalListItemFactory.setup] signal and removed again during
    [gtk.signal_list_item_factory.SignalListItemFactory.teardown].
*/
class SignalListItemFactory : gtk.list_item_factory.ListItemFactory
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
    return cast(void function())gtk_signal_list_item_factory_get_type != &gidSymbolNotFound ? gtk_signal_list_item_factory_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SignalListItemFactory self()
  {
    return this;
  }

  /**
      Creates a new [gtk.signal_list_item_factory.SignalListItemFactory].
      
      You need to connect signal handlers before you use it.
      Returns: a new [gtk.signal_list_item_factory.SignalListItemFactory]
  */
  this()
  {
    GtkListItemFactory* _cretval;
    _cretval = gtk_signal_list_item_factory_new();
    this(_cretval, Yes.Take);
  }

  /**
      Connect to `Bind` signal.
  
      Emitted when an object has been bound, for example when a
        new [gtk.list_item.ListItem.item] has been set on a
        listitem and should be bound for use.
        
        After this signal was emitted, the object might be shown in
        a [gtk.list_view.ListView] or other widget.
        
        The [gtk.signal_list_item_factory.SignalListItemFactory.unbind] signal is the
        opposite of this signal and can be used to undo everything done
        in this signal.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gobject.object.ObjectWrap object, gtk.signal_list_item_factory.SignalListItemFactory signalListItemFactory))
  
          `object` The [gobject.object.ObjectWrap] to bind (optional)
  
          `signalListItemFactory` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectBind(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gobject.object.ObjectWrap)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.signal_list_item_factory.SignalListItemFactory)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("bind", closure, after);
  }

  /**
      Connect to `Setup` signal.
  
      Emitted when a new listitem has been created and needs to be setup for use.
        
        It is the first signal emitted for every listitem.
        
        The [gtk.signal_list_item_factory.SignalListItemFactory.teardown] signal is the opposite
        of this signal and can be used to undo everything done in this signal.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gobject.object.ObjectWrap object, gtk.signal_list_item_factory.SignalListItemFactory signalListItemFactory))
  
          `object` The [gobject.object.ObjectWrap] to set up (optional)
  
          `signalListItemFactory` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSetup(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gobject.object.ObjectWrap)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.signal_list_item_factory.SignalListItemFactory)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("setup", closure, after);
  }

  /**
      Connect to `Teardown` signal.
  
      Emitted when an object is about to be destroyed.
        
        It is the last signal ever emitted for this object.
        
        This signal is the opposite of the [gtk.signal_list_item_factory.SignalListItemFactory.setup]
        signal and should be used to undo everything done in that signal.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gobject.object.ObjectWrap object, gtk.signal_list_item_factory.SignalListItemFactory signalListItemFactory))
  
          `object` The [gobject.object.ObjectWrap] to tear down (optional)
  
          `signalListItemFactory` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectTeardown(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gobject.object.ObjectWrap)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.signal_list_item_factory.SignalListItemFactory)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("teardown", closure, after);
  }

  /**
      Connect to `Unbind` signal.
  
      Emitted when an object has been unbound from its item, for example when
        a listitem was removed from use in a list widget
        and its [gtk.list_item.ListItem.item] is about to be unset.
        
        This signal is the opposite of the [gtk.signal_list_item_factory.SignalListItemFactory.bind]
        signal and should be used to undo everything done in that signal.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gobject.object.ObjectWrap object, gtk.signal_list_item_factory.SignalListItemFactory signalListItemFactory))
  
          `object` The [gobject.object.ObjectWrap] to unbind (optional)
  
          `signalListItemFactory` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectUnbind(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gobject.object.ObjectWrap)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.signal_list_item_factory.SignalListItemFactory)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("unbind", closure, after);
  }
}
