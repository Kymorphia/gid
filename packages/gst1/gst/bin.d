/// Module for [Bin] class
module gst.bin;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gobject.types;
import gst.c.functions;
import gst.c.types;
import gst.child_proxy;
import gst.child_proxy_mixin;
import gst.element;
import gst.iterator;
import gst.pad;
import gst.types;

/**
    #GstBin is an element that can contain other #GstElement, allowing them to be
    managed as a group.
    Pads from the child elements can be ghosted to the bin, see #GstGhostPad.
    This makes the bin look like any other elements and enables creation of
    higher-level abstraction elements.
    
    A new #GstBin is created with [gst.bin.Bin.new_]. Use a #GstPipeline instead if you
    want to create a toplevel bin because a normal bin doesn't have a bus or
    handle clock distribution of its own.
    
    After the bin has been created you will typically add elements to it with
    [gst.bin.Bin.add]. You can remove elements with [gst.bin.Bin.remove].
    
    An element can be retrieved from a bin with [gst.bin.Bin.getByName], using the
    elements name. [gst.bin.Bin.getByNameRecurseUp] is mainly used for internal
    purposes and will query the parent bins when the element is not found in the
    current bin.
    
    An iterator of elements in a bin can be retrieved with
    [gst.bin.Bin.iterateElements]. Various other iterators exist to retrieve the
    elements in a bin.
    
    [gst.object.ObjectWrap.unref] is used to drop your reference to the bin.
    
    The #GstBin::element-added signal is fired whenever a new element is added to
    the bin. Likewise the #GstBin::element-removed signal is fired whenever an
    element is removed from the bin.
    
    A #GstBin internally intercepts every #GstMessage posted by its children and
    implements the following default behaviour for each of them:
    
    $(LIST
      * [gst.types.MessageType.Eos]: This message is only posted by sinks in the PLAYING
    )
    state. If all sinks posted the EOS message, this bin will post and EOS
    message upwards.
    
    $(LIST
      * [gst.types.MessageType.SegmentStart]: Just collected and never forwarded upwards.
        The messages are used to decide when all elements have completed playback
        of their segment.
      
      * [gst.types.MessageType.SegmentDone]: Is posted by #GstBin when all elements that posted
        a SEGMENT_START have posted a SEGMENT_DONE.
      
      * [gst.types.MessageType.DurationChanged]: Is posted by an element that detected a change
        in the stream duration. The duration change is posted to the
        application so that it can refetch the new duration with a duration
        query.
      
        Note that these messages can be posted before the bin is prerolled, in which
        case the duration query might fail.
      
        Note also that there might be a discrepancy (due to internal buffering/queueing)
        between the stream being currently displayed and the returned duration query.
      
        Applications might want to also query for duration (and changes) by
        listening to the [gst.types.MessageType.StreamStart] message, signaling the active start
        of a (new) stream.
      
      * [gst.types.MessageType.ClockLost]: This message is posted by an element when it
        can no longer provide a clock.
      
        The default bin behaviour is to check if the lost clock was the one provided
        by the bin. If so and the bin is currently in the PLAYING state, the message
        is forwarded to the bin parent.
      
        This message is also generated when a clock provider is removed from
        the bin. If this message is received by the application, it should
        PAUSE the pipeline and set it back to PLAYING to force a new clock
        distribution.
      
      * [gst.types.MessageType.ClockProvide]: This message is generated when an element
        can provide a clock. This mostly happens when a new clock
        provider is added to the bin.
      
        The default behaviour of the bin is to mark the currently selected clock as
        dirty, which will perform a clock recalculation the next time the bin is
        asked to provide a clock.
      
        This message is never sent to the application but is forwarded to
        the parent of the bin.
      
      * OTHERS: posted upwards.
    )
      
    A #GstBin implements the following default behaviour for answering to a
    #GstQuery:
    
    $(LIST
      * [gst.types.QueryType.Duration]: The bin will forward the query to all sink
        elements contained within and will return the maximum value.
        If no sinks are available in the bin, the query fails.
      
      * [gst.types.QueryType.Position]: The query is sent to all sink elements in the bin and the
        MAXIMUM of all values is returned. If no sinks are available in the bin,
        the query fails.
      
      * OTHERS: the query is forwarded to all sink elements, the result
        of the first sink that answers the query successfully is returned. If no
        sink is in the bin, the query fails.
    )
      
    A #GstBin will by default forward any event sent to it to all sink
    ( [gst.types.EventTypeFlags.Upstream] ) or source ( [gst.types.EventTypeFlags.Downstream] ) elements
    depending on the event type.
    
    If all the elements return true, the bin will also return true, else false
    is returned. If no elements of the required type are in the bin, the event
    handler will return true.
*/
class Bin : gst.element.Element, gst.child_proxy.ChildProxy
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
    return cast(void function())gst_bin_get_type != &gidSymbolNotFound ? gst_bin_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Bin self()
  {
    return this;
  }

  /**
      Get `asyncHandling` property.
      Returns: If set to true, the bin will handle asynchronous state changes.
        This should be used only if the bin subclass is modifying the state
        of its children on its own.
  */
  @property bool asyncHandling()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("async-handling");
  }

  /**
      Set `asyncHandling` property.
      Params:
        propval = If set to true, the bin will handle asynchronous state changes.
          This should be used only if the bin subclass is modifying the state
          of its children on its own.
  */
  @property void asyncHandling(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("async-handling", propval);
  }

  /**
      Get `messageForward` property.
      Returns: Forward all children messages, even those that would normally be filtered by
        the bin. This can be interesting when one wants to be notified of the EOS
        state of individual elements, for example.
        
        The messages are converted to an ELEMENT message with the bin as the
        source. The structure of the message is named `GstBinForwarded` and contains
        a field named `message` that contains the original forwarded #GstMessage.
  */
  @property bool messageForward()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("message-forward");
  }

  /**
      Set `messageForward` property.
      Params:
        propval = Forward all children messages, even those that would normally be filtered by
          the bin. This can be interesting when one wants to be notified of the EOS
          state of individual elements, for example.
          
          The messages are converted to an ELEMENT message with the bin as the
          source. The structure of the message is named `GstBinForwarded` and contains
          a field named `message` that contains the original forwarded #GstMessage.
  */
  @property void messageForward(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("message-forward", propval);
  }

  mixin ChildProxyT!();

  /**
      Creates a new bin with the given name.
  
      Params:
        name = the name of the new bin
      Returns: a new #GstBin
  */
  this(string name = null)
  {
    GstElement* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gst_bin_new(_name);
    this(_cretval, No.Take);
  }

  /**
      Adds the given element to the bin.  Sets the element's parent, and thus
      takes ownership of the element. An element can only be added to one bin.
      
      If the element's pads are linked to other pads, the pads will be unlinked
      before the element is added to the bin.
      
      > When you add an element to an already-running pipeline, you will have to
      > take care to set the state of the newly-added element to the desired
      > state (usually PLAYING or PAUSED, same you set the pipeline to originally)
      > with [gst.element.Element.setState], or use [gst.element.Element.syncStateWithParent].
      > The bin or pipeline will not take care of this for you.
  
      Params:
        element = the #GstElement to add
      Returns: true if the element could be added, false if
        the bin does not want to accept the element.
  */
  bool add(gst.element.Element element)
  {
    bool _retval;
    _retval = cast(bool)gst_bin_add(cast(GstBin*)this._cPtr, element ? cast(GstElement*)element._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Recursively looks for elements with an unlinked pad of the given
      direction within the specified bin and returns an unlinked pad
      if one is found, or null otherwise. If a pad is found, the caller
      owns a reference to it and should use [gst.object.ObjectWrap.unref] on the
      pad when it is not needed any longer.
  
      Params:
        direction = whether to look for an unlinked source or sink pad
      Returns: unlinked pad of the given
        direction.
  */
  gst.pad.Pad findUnlinkedPad(gst.types.PadDirection direction)
  {
    GstPad* _cretval;
    _cretval = gst_bin_find_unlinked_pad(cast(GstBin*)this._cPtr, direction);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.pad.Pad)(cast(GstPad*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Looks for an element inside the bin that implements the given
      interface. If such an element is found, it returns the element.
      You can cast this element to the given interface afterwards.  If you want
      all elements that implement the interface, use
      [gst.bin.Bin.iterateAllByInterface]. This function recurses into child bins.
  
      Params:
        iface = the #GType of an interface
      Returns: A #GstElement inside the bin
        implementing the interface
  */
  gst.element.Element getByInterface(gobject.types.GType iface)
  {
    GstElement* _cretval;
    _cretval = gst_bin_get_by_interface(cast(GstBin*)this._cPtr, iface);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.element.Element)(cast(GstElement*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the element with the given name from a bin. This
      function recurses into child bins.
  
      Params:
        name = the element name to search for
      Returns: the #GstElement with the given
        name
  */
  gst.element.Element getByName(string name)
  {
    GstElement* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gst_bin_get_by_name(cast(GstBin*)this._cPtr, _name);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.element.Element)(cast(GstElement*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the element with the given name from this bin. If the
      element is not found, a recursion is performed on the parent bin.
  
      Params:
        name = the element name to search for
      Returns: the #GstElement with the given
        name
  */
  gst.element.Element getByNameRecurseUp(string name)
  {
    GstElement* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gst_bin_get_by_name_recurse_up(cast(GstBin*)this._cPtr, _name);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.element.Element)(cast(GstElement*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  gst.types.ElementFlags getSuppressedFlags()
  {
    GstElementFlags _cretval;
    _cretval = gst_bin_get_suppressed_flags(cast(GstBin*)this._cPtr);
    gst.types.ElementFlags _retval = cast(gst.types.ElementFlags)_cretval;
    return _retval;
  }

  /**
      Looks for all elements inside the bin with the given element factory name.
      The function recurses inside child bins. The iterator will yield a series of
      #GstElement.
  
      Params:
        factoryName = the name of the #GstElementFactory
      Returns: a #GstIterator of #GstElement
            for all elements in the bin with the given element factory name
  */
  gst.iterator.Iterator iterateAllByElementFactoryName(string factoryName)
  {
    GstIterator* _cretval;
    const(char)* _factoryName = factoryName.toCString(No.Alloc);
    _cretval = gst_bin_iterate_all_by_element_factory_name(cast(GstBin*)this._cPtr, _factoryName);
    auto _retval = _cretval ? new gst.iterator.Iterator(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Looks for all elements inside the bin that implements the given
      interface. You can safely cast all returned elements to the given interface.
      The function recurses inside child bins. The iterator will yield a series
      of #GstElement.
  
      Params:
        iface = the #GType of an interface
      Returns: a #GstIterator of #GstElement
            for all elements in the bin implementing the given interface
  */
  gst.iterator.Iterator iterateAllByInterface(gobject.types.GType iface)
  {
    GstIterator* _cretval;
    _cretval = gst_bin_iterate_all_by_interface(cast(GstBin*)this._cPtr, iface);
    auto _retval = _cretval ? new gst.iterator.Iterator(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets an iterator for the elements in this bin.
      Returns: a #GstIterator of #GstElement
  */
  gst.iterator.Iterator iterateElements()
  {
    GstIterator* _cretval;
    _cretval = gst_bin_iterate_elements(cast(GstBin*)this._cPtr);
    auto _retval = _cretval ? new gst.iterator.Iterator(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets an iterator for the elements in this bin.
      This iterator recurses into GstBin children.
      Returns: a #GstIterator of #GstElement
  */
  gst.iterator.Iterator iterateRecurse()
  {
    GstIterator* _cretval;
    _cretval = gst_bin_iterate_recurse(cast(GstBin*)this._cPtr);
    auto _retval = _cretval ? new gst.iterator.Iterator(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets an iterator for all elements in the bin that have the
      #GST_ELEMENT_FLAG_SINK flag set.
      Returns: a #GstIterator of #GstElement
  */
  gst.iterator.Iterator iterateSinks()
  {
    GstIterator* _cretval;
    _cretval = gst_bin_iterate_sinks(cast(GstBin*)this._cPtr);
    auto _retval = _cretval ? new gst.iterator.Iterator(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets an iterator for the elements in this bin in topologically
      sorted order. This means that the elements are returned from
      the most downstream elements (sinks) to the sources.
      
      This function is used internally to perform the state changes
      of the bin elements and for clock selection.
      Returns: a #GstIterator of #GstElement
  */
  gst.iterator.Iterator iterateSorted()
  {
    GstIterator* _cretval;
    _cretval = gst_bin_iterate_sorted(cast(GstBin*)this._cPtr);
    auto _retval = _cretval ? new gst.iterator.Iterator(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets an iterator for all elements in the bin that have the
      #GST_ELEMENT_FLAG_SOURCE flag set.
      Returns: a #GstIterator of #GstElement
  */
  gst.iterator.Iterator iterateSources()
  {
    GstIterator* _cretval;
    _cretval = gst_bin_iterate_sources(cast(GstBin*)this._cPtr);
    auto _retval = _cretval ? new gst.iterator.Iterator(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Queries bin for the current latency and reconfigures this latency on all the
      elements using a LATENCY event.
      
      This method is typically called on the pipeline when a #GST_MESSAGE_LATENCY
      is posted on the bus.
      
      This function simply emits the #GstBin::do-latency signal so any custom latency
      calculations will be performed.
      Returns: true if the latency could be queried and reconfigured.
  */
  bool recalculateLatency()
  {
    bool _retval;
    _retval = cast(bool)gst_bin_recalculate_latency(cast(GstBin*)this._cPtr);
    return _retval;
  }

  /**
      Removes the element from the bin, unparenting it as well.
      Unparenting the element means that the element will be dereferenced,
      so if the bin holds the only reference to the element, the element
      will be freed in the process of removing it from the bin.  If you
      want the element to still exist after removing, you need to call
      [gst.object.ObjectWrap.ref_] before removing it from the bin.
      
      If the element's pads are linked to other pads, the pads will be unlinked
      before the element is removed from the bin.
  
      Params:
        element = the #GstElement to remove
      Returns: true if the element could be removed, false if
        the bin does not want to remove the element.
  */
  bool remove(gst.element.Element element)
  {
    bool _retval;
    _retval = cast(bool)gst_bin_remove(cast(GstBin*)this._cPtr, element ? cast(GstElement*)element._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Suppresses the given flags on the bin. #GstElementFlags of a
      child element are propagated when it is added to the bin.
      When suppressed flags are set, those specified flags will
      not be propagated to the bin.
  
      Params:
        flags = the #GstElementFlags to suppress
  */
  void setSuppressedFlags(gst.types.ElementFlags flags)
  {
    gst_bin_set_suppressed_flags(cast(GstBin*)this._cPtr, flags);
  }

  /**
      Synchronizes the state of every child of bin with the state
      of bin. See also [gst.element.Element.syncStateWithParent].
      Returns: true if syncing the state was successful for all children,
         otherwise false.
  */
  bool syncChildrenStates()
  {
    bool _retval;
    _retval = cast(bool)gst_bin_sync_children_states(cast(GstBin*)this._cPtr);
    return _retval;
  }

  /**
      Connect to `DeepElementAdded` signal.
  
      Will be emitted after the element was added to sub_bin.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gst.bin.Bin subBin, gst.element.Element element, gst.bin.Bin bin))
  
          `subBin` the #GstBin the element was added to (optional)
  
          `element` the #GstElement that was added to sub_bin (optional)
  
          `bin` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDeepElementAdded(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gst.bin.Bin)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gst.element.Element)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gst.bin.Bin)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("deep-element-added", closure, after);
  }

  /**
      Connect to `DeepElementRemoved` signal.
  
      Will be emitted after the element was removed from sub_bin.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gst.bin.Bin subBin, gst.element.Element element, gst.bin.Bin bin))
  
          `subBin` the #GstBin the element was removed from (optional)
  
          `element` the #GstElement that was removed from sub_bin (optional)
  
          `bin` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDeepElementRemoved(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gst.bin.Bin)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gst.element.Element)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gst.bin.Bin)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("deep-element-removed", closure, after);
  }

  /**
      Connect to `DoLatency` signal.
  
      Will be emitted when the bin needs to perform latency calculations. This
        signal is only emitted for toplevel bins or when #GstBin:async-handling is
        enabled.
        
        Only one signal handler is invoked. If no signals are connected, the
        default handler is invoked, which will query and distribute the lowest
        possible latency to all sinks.
        
        Connect to this signal if the default latency calculations are not
        sufficient, like when you need different latencies for different sinks in
        the same pipeline.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gst.bin.Bin bin))
  
          `bin` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDoLatency(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gst.bin.Bin)))
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
    return connectSignalClosure("do-latency", closure, after);
  }

  /**
      Connect to `ElementAdded` signal.
  
      Will be emitted after the element was added to the bin.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gst.element.Element element, gst.bin.Bin bin))
  
          `element` the #GstElement that was added to the bin (optional)
  
          `bin` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectElementAdded(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gst.element.Element)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gst.bin.Bin)))
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
    return connectSignalClosure("element-added", closure, after);
  }

  /**
      Connect to `ElementRemoved` signal.
  
      Will be emitted after the element was removed from the bin.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gst.element.Element element, gst.bin.Bin bin))
  
          `element` the #GstElement that was removed from the bin (optional)
  
          `bin` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectElementRemoved(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gst.element.Element)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gst.bin.Bin)))
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
    return connectSignalClosure("element-removed", closure, after);
  }
}
