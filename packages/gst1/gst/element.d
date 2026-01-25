/// Module for [Element] class
module gst.element;

import gid.gid;
import glib.error;
import glib.types;
import gobject.dclosure;
import gobject.object;
import gobject.types;
import gst.bus;
import gst.c.functions;
import gst.c.types;
import gst.caps;
import gst.clock;
import gst.context;
import gst.element_factory;
import gst.event;
import gst.iterator;
import gst.message;
import gst.object;
import gst.pad;
import gst.pad_template;
import gst.plugin;
import gst.query;
import gst.structure;
import gst.types;

/**
    GstElement is the abstract base class needed to construct an element that
    can be used in a GStreamer pipeline. Please refer to the plugin writers
    guide for more information on creating #GstElement subclasses.
    
    The name of a #GstElement can be get with gst_element_get_name() and set with
    gst_element_set_name().  For speed, GST_ELEMENT_NAME() can be used in the
    core when using the appropriate locking. Do not use this in plug-ins or
    applications in order to retain ABI compatibility.
    
    Elements can have pads (of the type #GstPad).  These pads link to pads on
    other elements.  #GstBuffer flow between these linked pads.
    A #GstElement has a #GList of #GstPad structures for all their input (or sink)
    and output (or source) pads.
    Core and plug-in writers can add and remove pads with [gst.element.Element.addPad]
    and [gst.element.Element.removePad].
    
    An existing pad of an element can be retrieved by name with
    [gst.element.Element.getStaticPad]. A new dynamic pad can be created using
    [gst.element.Element.requestPad] with a #GstPadTemplate.
    An iterator of all pads can be retrieved with [gst.element.Element.iteratePads].
    
    Elements can be linked through their pads.
    If the link is straightforward, use the [gst.element.Element.link]
    convenience function to link two elements, or [gst.element.Element.linkMany]
    for more elements in a row.
    Use [gst.element.Element.linkFiltered] to link two elements constrained by
    a specified set of #GstCaps.
    For finer control, use [gst.element.Element.linkPads] and
    [gst.element.Element.linkPadsFiltered] to specify the pads to link on
    each element by name.
    
    Each element has a state (see #GstState).  You can get and set the state
    of an element with [gst.element.Element.getState] and [gst.element.Element.setState].
    Setting a state triggers a #GstStateChange. To get a string representation
    of a #GstState, use [gst.element.Element.stateGetName].
    
    You can get and set a #GstClock on an element using [gst.element.Element.getClock]
    and [gst.element.Element.setClock].
    Some elements can provide a clock for the pipeline if
    the #GST_ELEMENT_FLAG_PROVIDE_CLOCK flag is set. With the
    [gst.element.Element.provideClock] method one can retrieve the clock provided by
    such an element.
    Not all elements require a clock to operate correctly. If the
    #GST_ELEMENT_FLAG_REQUIRE_CLOCK() flag is set, a clock should be set on the
    element with [gst.element.Element.setClock].
    
    Note that clock selection and distribution is normally handled by the
    toplevel #GstPipeline so the clock functions are only to be used in very
    specific situations.
*/
class Element : gst.object.ObjectWrap
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
    return cast(void function())gst_element_get_type != &gidSymbolNotFound ? gst_element_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Element self()
  {
    return this;
  }

  /**
      Creates an element for handling the given URI.
  
      Params:
        type = Whether to create a source or a sink
        uri = URI to create an element for
        elementname = Name of created element, can be null.
      Returns: a new element or null if none
        could be created
      Throws: [ErrorWrap]
  */
  static gst.element.Element makeFromUri(gst.types.URIType type, string uri, string elementname = null)
  {
    GstElement* _cretval;
    const(char)* _uri = uri.toCString(No.Alloc);
    const(char)* _elementname = elementname.toCString(No.Alloc);
    GError *_err;
    _cretval = gst_element_make_from_uri(type, _uri, _elementname, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.element.Element)(cast(GstElement*)_cretval, No.Take);
    return _retval;
  }

  /**
      Create a new elementfactory capable of instantiating objects of the
      type and add the factory to plugin.
  
      Params:
        plugin = #GstPlugin to register the element with, or null for
              a static element.
        name = name of elements of this type
        rank = rank of element (higher rank means more importance when autoplugging)
        type = GType of element to register
      Returns: true, if the registering succeeded, false on error
  */
  static bool register(gst.plugin.Plugin plugin, string name, uint rank, gobject.types.GType type)
  {
    bool _retval;
    const(char)* _name = name.toCString(No.Alloc);
    _retval = cast(bool)gst_element_register(plugin ? cast(GstPlugin*)plugin._cPtr(No.Dup) : null, _name, rank, type);
    return _retval;
  }

  /**
      Gets a string representing the given state change result.
  
      Params:
        stateRet = a #GstStateChangeReturn to get the name of.
      Returns: a string with the name of the state
           result.
  */
  static string stateChangeReturnGetName(gst.types.StateChangeReturn stateRet)
  {
    const(char)* _cretval;
    _cretval = gst_element_state_change_return_get_name(stateRet);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets a string representing the given state.
  
      Params:
        state = a #GstState to get the name of.
      Returns: a string with the name of the state.
  */
  static string stateGetName(gst.types.State state)
  {
    const(char)* _cretval;
    _cretval = gst_element_state_get_name(state);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Marks type as "documentation should be skipped".
      Can be useful for dynamically registered element to be excluded from
      plugin documentation system.
      
      Example:
      ```c
      GType my_type;
      GTypeInfo my_type_info;
      
      // Fill "my_type_info"
      ...
      
      my_type = g_type_register_static (GST_TYPE_MY_ELEMENT, "my-type-name",
         &my_type_info, 0);
      gst_element_type_set_skip_documentation (my_type);
      gst_element_register (plugin, "my-plugin-feature-name", rank, my_type);
      ```
  
      Params:
        type = a #GType of element
  */
  static void typeSetSkipDocumentation(gobject.types.GType type)
  {
    gst_element_type_set_skip_documentation(type);
  }

  /**
      Abort the state change of the element. This function is used
      by elements that do asynchronous state changes and find out
      something is wrong.
      
      This function should be called with the STATE_LOCK held.
      
      MT safe.
  */
  void abortState()
  {
    gst_element_abort_state(cast(GstElement*)this._cPtr);
  }

  /**
      Adds a pad (link point) to element. pad's parent will be set to element;
      see [gst.object.ObjectWrap.setParent] for refcounting information.
      
      Pads are automatically activated when added in the PAUSED or PLAYING
      state.
      
      The pad and the element should be unlocked when calling this function.
      
      This function will emit the #GstElement::pad-added signal on the element.
  
      Params:
        pad = the #GstPad to add to the element.
      Returns: true if the pad could be added. This function can fail when
        a pad with the same name already existed or the pad already had another
        parent.
        
        MT safe.
  */
  bool addPad(gst.pad.Pad pad)
  {
    bool _retval;
    _retval = cast(bool)gst_element_add_pad(cast(GstElement*)this._cPtr, pad ? cast(GstPad*)pad._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  gulong addPropertyDeepNotifyWatch(string propertyName, bool includeValue)
  {
    gulong _retval;
    const(char)* _propertyName = propertyName.toCString(No.Alloc);
    _retval = gst_element_add_property_deep_notify_watch(cast(GstElement*)this._cPtr, _propertyName, includeValue);
    return _retval;
  }

  /** */
  gulong addPropertyNotifyWatch(string propertyName, bool includeValue)
  {
    gulong _retval;
    const(char)* _propertyName = propertyName.toCString(No.Alloc);
    _retval = gst_element_add_property_notify_watch(cast(GstElement*)this._cPtr, _propertyName, includeValue);
    return _retval;
  }

  /**
      Calls func from another thread and passes user_data to it. This is to be
      used for cases when a state change has to be performed from a streaming
      thread, directly via [gst.element.Element.setState] or indirectly e.g. via SEEK
      events.
      
      Calling those functions directly from the streaming thread will cause
      deadlocks in many situations, as they might involve waiting for the
      streaming thread to shut down from this very streaming thread.
      
      MT safe.
  
      Params:
        func = Function to call asynchronously from another thread
  */
  void callAsync(gst.types.ElementCallAsyncFunc func)
  {
    extern(C) void _funcCallback(GstElement* element, void* userData)
    {
      auto _dlg = cast(gst.types.ElementCallAsyncFunc*)userData;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gst.element.Element)(cast(void*)element, No.Take));
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
    gst_element_call_async(cast(GstElement*)this._cPtr, _funcCB, _func, _funcDestroyCB);
  }

  /**
      Perform transition on element.
      
      This function must be called with STATE_LOCK held and is mainly used
      internally.
  
      Params:
        transition = the requested transition
      Returns: the #GstStateChangeReturn of the state transition.
  */
  gst.types.StateChangeReturn changeState(gst.types.StateChange transition)
  {
    GstStateChangeReturn _cretval;
    _cretval = gst_element_change_state(cast(GstElement*)this._cPtr, transition);
    gst.types.StateChangeReturn _retval = cast(gst.types.StateChangeReturn)_cretval;
    return _retval;
  }

  /**
      Commit the state change of the element and proceed to the next
      pending state if any. This function is used
      by elements that do asynchronous state changes.
      The core will normally call this method automatically when an
      element returned [gst.types.StateChangeReturn.Success] from the state change function.
      
      If after calling this method the element still has not reached
      the pending state, the next state change is performed.
      
      This method is used internally and should normally not be called by plugins
      or applications.
      
      This function must be called with STATE_LOCK held.
  
      Params:
        ret = The previous state return value
      Returns: The result of the commit state change.
        
        MT safe.
  */
  gst.types.StateChangeReturn continueState(gst.types.StateChangeReturn ret)
  {
    GstStateChangeReturn _cretval;
    _cretval = gst_element_continue_state(cast(GstElement*)this._cPtr, ret);
    gst.types.StateChangeReturn _retval = cast(gst.types.StateChangeReturn)_cretval;
    return _retval;
  }

  /**
      Creates a pad for each pad template that is always available.
      This function is only useful during object initialization of
      subclasses of #GstElement.
  */
  void createAllPads()
  {
    gst_element_create_all_pads(cast(GstElement*)this._cPtr);
  }

  /**
      Creates a stream-id for element by combining the upstream information with
      the stream_id.
      
      This function generates an unique stream-id by getting the upstream
      stream-start event stream ID and appending stream_id to it. If the element
      has no sinkpad it will generate an upstream stream-id by doing an URI query
      on the element and in the worst case just uses a random number. Source
      elements that don't implement the URI handler interface should ideally
      generate a unique, deterministic stream-id manually instead.
      
      Since stream IDs are sorted alphabetically, any numbers in the stream ID
      should be printed with a fixed number of characters, preceded by 0's, such as
      by using the format \`03u` instead of \`u`.
  
      Params:
        streamId = The stream-id
      Returns: A stream-id for element.
  */
  string decorateStreamId(string streamId)
  {
    char* _cretval;
    const(char)* _streamId = streamId.toCString(No.Alloc);
    _cretval = gst_element_decorate_stream_id(cast(GstElement*)this._cPtr, _streamId);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Call func with user_data for each of element's pads. func will be called
      exactly once for each pad that exists at the time of this call, unless
      one of the calls to func returns false in which case we will stop
      iterating pads and return early. If new pads are added or pads are removed
      while pads are being iterated, this will not be taken into account until
      next time this function is used.
  
      Params:
        func = function to call for each pad
      Returns: false if element had no pads or if one of the calls to func
          returned false.
  */
  bool foreachPad(gst.types.ElementForeachPadFunc func)
  {
    extern(C) gboolean _funcCallback(GstElement* element, GstPad* pad, void* userData)
    {
      bool _dretval;
      auto _dlg = cast(gst.types.ElementForeachPadFunc*)userData;

      _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gst.element.Element)(cast(void*)element, No.Take), gobject.object.ObjectWrap._getDObject!(gst.pad.Pad)(cast(void*)pad, No.Take));
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;
    bool _retval;
    auto _func = func ? cast(void*)&(func) : null;
    _retval = cast(bool)gst_element_foreach_pad(cast(GstElement*)this._cPtr, _funcCB, _func);
    return _retval;
  }

  /**
      Call func with user_data for each of element's sink pads. func will be
      called exactly once for each sink pad that exists at the time of this call,
      unless one of the calls to func returns false in which case we will stop
      iterating pads and return early. If new sink pads are added or sink pads
      are removed while the sink pads are being iterated, this will not be taken
      into account until next time this function is used.
  
      Params:
        func = function to call for each sink pad
      Returns: false if element had no sink pads or if one of the calls to func
          returned false.
  */
  bool foreachSinkPad(gst.types.ElementForeachPadFunc func)
  {
    extern(C) gboolean _funcCallback(GstElement* element, GstPad* pad, void* userData)
    {
      bool _dretval;
      auto _dlg = cast(gst.types.ElementForeachPadFunc*)userData;

      _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gst.element.Element)(cast(void*)element, No.Take), gobject.object.ObjectWrap._getDObject!(gst.pad.Pad)(cast(void*)pad, No.Take));
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;
    bool _retval;
    auto _func = func ? cast(void*)&(func) : null;
    _retval = cast(bool)gst_element_foreach_sink_pad(cast(GstElement*)this._cPtr, _funcCB, _func);
    return _retval;
  }

  /**
      Call func with user_data for each of element's source pads. func will be
      called exactly once for each source pad that exists at the time of this call,
      unless one of the calls to func returns false in which case we will stop
      iterating pads and return early. If new source pads are added or source pads
      are removed while the source pads are being iterated, this will not be taken
      into account until next time this function is used.
  
      Params:
        func = function to call for each source pad
      Returns: false if element had no source pads or if one of the calls
          to func returned false.
  */
  bool foreachSrcPad(gst.types.ElementForeachPadFunc func)
  {
    extern(C) gboolean _funcCallback(GstElement* element, GstPad* pad, void* userData)
    {
      bool _dretval;
      auto _dlg = cast(gst.types.ElementForeachPadFunc*)userData;

      _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gst.element.Element)(cast(void*)element, No.Take), gobject.object.ObjectWrap._getDObject!(gst.pad.Pad)(cast(void*)pad, No.Take));
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;
    bool _retval;
    auto _func = func ? cast(void*)&(func) : null;
    _retval = cast(bool)gst_element_foreach_src_pad(cast(GstElement*)this._cPtr, _funcCB, _func);
    return _retval;
  }

  /**
      Returns the base time of the element. The base time is the
      absolute time of the clock when this element was last put to
      PLAYING. Subtracting the base time from the clock time gives
      the running time of the element.
      Returns: the base time of the element.
        
        MT safe.
  */
  gst.types.ClockTime getBaseTime()
  {
    gst.types.ClockTime _retval;
    _retval = gst_element_get_base_time(cast(GstElement*)this._cPtr);
    return _retval;
  }

  /**
      Returns the bus of the element. Note that only a #GstPipeline will provide a
      bus for the application.
      Returns: the element's #GstBus. unref after
        usage.
        
        MT safe.
  */
  gst.bus.Bus getBus()
  {
    GstBus* _cretval;
    _cretval = gst_element_get_bus(cast(GstElement*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.bus.Bus)(cast(GstBus*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the currently configured clock of the element. This is the clock as was
      last set with [gst.element.Element.setClock].
      
      Elements in a pipeline will only have their clock set when the
      pipeline is in the PLAYING state.
      Returns: the #GstClock of the element. unref after usage.
        
        MT safe.
  */
  gst.clock.Clock getClock()
  {
    GstClock* _cretval;
    _cretval = gst_element_get_clock(cast(GstElement*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.clock.Clock)(cast(GstClock*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Looks for an unlinked pad to which the given pad can link. It is not
      guaranteed that linking the pads will work, though it should work in most
      cases.
      
      This function will first attempt to find a compatible unlinked ALWAYS pad,
      and if none can be found, it will request a compatible REQUEST pad by looking
      at the templates of element.
  
      Params:
        pad = the #GstPad to find a compatible one for.
        caps = the #GstCaps to use as a filter.
      Returns: the #GstPad to which a link
          can be made, or null if one cannot be found. [gst.object.ObjectWrap.unref]
          after usage.
  */
  gst.pad.Pad getCompatiblePad(gst.pad.Pad pad, gst.caps.Caps caps = null)
  {
    GstPad* _cretval;
    _cretval = gst_element_get_compatible_pad(cast(GstElement*)this._cPtr, pad ? cast(GstPad*)pad._cPtr(No.Dup) : null, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.pad.Pad)(cast(GstPad*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Retrieves a pad template from element that is compatible with compattempl.
      Pads from compatible templates can be linked together.
  
      Params:
        compattempl = the #GstPadTemplate to find a compatible
              template for
      Returns: a compatible #GstPadTemplate,
          or null if none was found. No unreferencing is necessary.
  */
  gst.pad_template.PadTemplate getCompatiblePadTemplate(gst.pad_template.PadTemplate compattempl)
  {
    GstPadTemplate* _cretval;
    _cretval = gst_element_get_compatible_pad_template(cast(GstElement*)this._cPtr, compattempl ? cast(GstPadTemplate*)compattempl._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.pad_template.PadTemplate)(cast(GstPadTemplate*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the context with context_type set on the element or NULL.
      
      MT safe.
  
      Params:
        contextType = a name of a context to retrieve
      Returns: A #GstContext or NULL
  */
  gst.context.Context getContext(string contextType)
  {
    GstContext* _cretval;
    const(char)* _contextType = contextType.toCString(No.Alloc);
    _cretval = gst_element_get_context(cast(GstElement*)this._cPtr, _contextType);
    auto _retval = _cretval ? new gst.context.Context(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the context with context_type set on the element or NULL.
  
      Params:
        contextType = a name of a context to retrieve
      Returns: A #GstContext or NULL
  */
  gst.context.Context getContextUnlocked(string contextType)
  {
    GstContext* _cretval;
    const(char)* _contextType = contextType.toCString(No.Alloc);
    _cretval = gst_element_get_context_unlocked(cast(GstElement*)this._cPtr, _contextType);
    auto _retval = _cretval ? new gst.context.Context(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the contexts set on the element.
      
      MT safe.
      Returns: List of #GstContext
  */
  gst.context.Context[] getContexts()
  {
    GList* _cretval;
    _cretval = gst_element_get_contexts(cast(GstElement*)this._cPtr);
    auto _retval = gListToD!(gst.context.Context, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Returns the current clock time of the element, as in, the time of the
      element's clock, or GST_CLOCK_TIME_NONE if there is no clock.
      Returns: the clock time of the element, or GST_CLOCK_TIME_NONE if there is
        no clock.
  */
  gst.types.ClockTime getCurrentClockTime()
  {
    gst.types.ClockTime _retval;
    _retval = gst_element_get_current_clock_time(cast(GstElement*)this._cPtr);
    return _retval;
  }

  /**
      Returns the running time of the element. The running time is the
      element's clock time minus its base time. Will return GST_CLOCK_TIME_NONE
      if the element has no clock, or if its base time has not been set.
      Returns: the running time of the element, or GST_CLOCK_TIME_NONE if the
        element has no clock or its base time has not been set.
  */
  gst.types.ClockTime getCurrentRunningTime()
  {
    gst.types.ClockTime _retval;
    _retval = gst_element_get_current_running_time(cast(GstElement*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the factory that was used to create this element.
      Returns: the #GstElementFactory used for creating this
            element or null if element has not been registered (static element). no refcounting is needed.
  */
  gst.element_factory.ElementFactory getFactory()
  {
    GstElementFactory* _cretval;
    _cretval = gst_element_get_factory(cast(GstElement*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.element_factory.ElementFactory)(cast(GstElementFactory*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get metadata with key in klass.
  
      Params:
        key = the key to get
      Returns: the metadata for key.
  */
  string getMetadata(string key)
  {
    const(char)* _cretval;
    const(char)* _key = key.toCString(No.Alloc);
    _cretval = gst_element_get_metadata(cast(GstElement*)this._cPtr, _key);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Retrieves a padtemplate from element with the given name.
  
      Params:
        name = the name of the #GstPadTemplate to get.
      Returns: the #GstPadTemplate with the
            given name, or null if none was found. No unreferencing is
            necessary.
  */
  gst.pad_template.PadTemplate getPadTemplate(string name)
  {
    GstPadTemplate* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gst_element_get_pad_template(cast(GstElement*)this._cPtr, _name);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.pad_template.PadTemplate)(cast(GstPadTemplate*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves a list of the pad templates associated with element. The
      list must not be modified by the calling code.
      Returns: the #GList of
            pad templates.
  */
  gst.pad_template.PadTemplate[] getPadTemplateList()
  {
    GList* _cretval;
    _cretval = gst_element_get_pad_template_list(cast(GstElement*)this._cPtr);
    auto _retval = gListToD!(gst.pad_template.PadTemplate, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      The name of this function is confusing to people learning GStreamer.
      [gst.element.Element.requestPadSimple] aims at making it more explicit it is
      a simplified [gst.element.Element.requestPad].
  
      Params:
        name = the name of the request #GstPad to retrieve.
      Returns: requested #GstPad if found,
            otherwise null.  Release after usage.
  
      Deprecated: Prefer using [gst.element.Element.requestPadSimple] which
        provides the exact same functionality.
  */
  gst.pad.Pad getRequestPad(string name)
  {
    GstPad* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gst_element_get_request_pad(cast(GstElement*)this._cPtr, _name);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.pad.Pad)(cast(GstPad*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Returns the start time of the element. The start time is the
      running time of the clock when this element was last put to PAUSED.
      
      Usually the start_time is managed by a toplevel element such as
      #GstPipeline.
      
      MT safe.
      Returns: the start time of the element.
  */
  gst.types.ClockTime getStartTime()
  {
    gst.types.ClockTime _retval;
    _retval = gst_element_get_start_time(cast(GstElement*)this._cPtr);
    return _retval;
  }

  /**
      Gets the state of the element.
      
      For elements that performed an ASYNC state change, as reported by
      [gst.element.Element.setState], this function will block up to the
      specified timeout value for the state change to complete.
      If the element completes the state change or goes into
      an error, this function returns immediately with a return value of
      [gst.types.StateChangeReturn.Success] or [gst.types.StateChangeReturn.Failure] respectively.
      
      For elements that did not return [gst.types.StateChangeReturn.Async], this function
      returns the current and pending state immediately.
      
      This function returns [gst.types.StateChangeReturn.NoPreroll] if the element
      successfully changed its state but is not able to provide data yet.
      This mostly happens for live sources that only produce data in
      [gst.types.State.Playing]. While the state change return is equivalent to
      [gst.types.StateChangeReturn.Success], it is returned to the application to signal that
      some sink elements might not be able to complete their state change because
      an element is not producing data to complete the preroll. When setting the
      element to playing, the preroll will complete and playback will start.
  
      Params:
        state = a pointer to #GstState to hold the state.
              Can be null.
        pending = a pointer to #GstState to hold the pending
              state. Can be null.
        timeout = a #GstClockTime to specify the timeout for an async
                    state change or [gst.types.CLOCK_TIME_NONE] for infinite timeout.
      Returns: [gst.types.StateChangeReturn.Success] if the element has no more pending state
                 and the last state change succeeded, [gst.types.StateChangeReturn.Async] if the
                 element is still performing a state change or
                 [gst.types.StateChangeReturn.Failure] if the last state change failed.
        
        MT safe.
  */
  gst.types.StateChangeReturn getState(out gst.types.State state, out gst.types.State pending, gst.types.ClockTime timeout)
  {
    GstStateChangeReturn _cretval;
    _cretval = gst_element_get_state(cast(GstElement*)this._cPtr, &state, &pending, timeout);
    gst.types.StateChangeReturn _retval = cast(gst.types.StateChangeReturn)_cretval;
    return _retval;
  }

  /**
      Retrieves a pad from element by name. This version only retrieves
      already-existing (i.e. 'static') pads.
  
      Params:
        name = the name of the static #GstPad to retrieve.
      Returns: the requested #GstPad if
            found, otherwise null.  unref after usage.
        
        MT safe.
  */
  gst.pad.Pad getStaticPad(string name)
  {
    GstPad* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gst_element_get_static_pad(cast(GstElement*)this._cPtr, _name);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.pad.Pad)(cast(GstPad*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Checks if the state of an element is locked.
      If the state of an element is locked, state changes of the parent don't
      affect the element.
      This way you can leave currently unused elements inside bins. Just lock their
      state before changing the state from #GST_STATE_NULL.
      
      MT safe.
      Returns: true, if the element's state is locked.
  */
  bool isLockedState()
  {
    bool _retval;
    _retval = cast(bool)gst_element_is_locked_state(cast(GstElement*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves an iterator of element's pads. The iterator should
      be freed after usage. Also more specialized iterators exists such as
      [gst.element.Element.iterateSrcPads] or [gst.element.Element.iterateSinkPads].
      
      The order of pads returned by the iterator will be the order in which
      the pads were added to the element.
      Returns: the #GstIterator of #GstPad.
        
        MT safe.
  */
  gst.iterator.Iterator iteratePads()
  {
    GstIterator* _cretval;
    _cretval = gst_element_iterate_pads(cast(GstElement*)this._cPtr);
    auto _retval = _cretval ? new gst.iterator.Iterator(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Retrieves an iterator of element's sink pads.
      
      The order of pads returned by the iterator will be the order in which
      the pads were added to the element.
      Returns: the #GstIterator of #GstPad.
        
        MT safe.
  */
  gst.iterator.Iterator iterateSinkPads()
  {
    GstIterator* _cretval;
    _cretval = gst_element_iterate_sink_pads(cast(GstElement*)this._cPtr);
    auto _retval = _cretval ? new gst.iterator.Iterator(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Retrieves an iterator of element's source pads.
      
      The order of pads returned by the iterator will be the order in which
      the pads were added to the element.
      Returns: the #GstIterator of #GstPad.
        
        MT safe.
  */
  gst.iterator.Iterator iterateSrcPads()
  {
    GstIterator* _cretval;
    _cretval = gst_element_iterate_src_pads(cast(GstElement*)this._cPtr);
    auto _retval = _cretval ? new gst.iterator.Iterator(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Links src to dest. The link must be from source to
      destination; the other direction will not be tried. The function looks for
      existing pads that aren't linked yet. It will request new pads if necessary.
      Such pads need to be released manually when unlinking.
      If multiple links are possible, only one is established.
      
      Make sure you have added your elements to a bin or pipeline with
      [gst.bin.Bin.add] before trying to link them.
  
      Params:
        dest = the #GstElement containing the destination pad.
      Returns: true if the elements could be linked, false otherwise.
  */
  bool link(gst.element.Element dest)
  {
    bool _retval;
    _retval = cast(bool)gst_element_link(cast(GstElement*)this._cPtr, dest ? cast(GstElement*)dest._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Links src to dest using the given caps as filtercaps.
      The link must be from source to
      destination; the other direction will not be tried. The function looks for
      existing pads that aren't linked yet. It will request new pads if necessary.
      If multiple links are possible, only one is established.
      
      Make sure you have added your elements to a bin or pipeline with
      [gst.bin.Bin.add] before trying to link them.
  
      Params:
        dest = the #GstElement containing the destination pad.
        filter = the #GstCaps to filter the link,
              or null for no filter.
      Returns: true if the pads could be linked, false otherwise.
  */
  bool linkFiltered(gst.element.Element dest, gst.caps.Caps filter = null)
  {
    bool _retval;
    _retval = cast(bool)gst_element_link_filtered(cast(GstElement*)this._cPtr, dest ? cast(GstElement*)dest._cPtr(No.Dup) : null, filter ? cast(GstCaps*)filter._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Links the two named pads of the source and destination elements.
      Side effect is that if one of the pads has no parent, it becomes a
      child of the parent of the other element.  If they have different
      parents, the link fails.
  
      Params:
        srcpadname = the name of the #GstPad in source element
              or null for any pad.
        dest = the #GstElement containing the destination pad.
        destpadname = the name of the #GstPad in destination element,
          or null for any pad.
      Returns: true if the pads could be linked, false otherwise.
  */
  bool linkPads(string srcpadname, gst.element.Element dest, string destpadname = null)
  {
    bool _retval;
    const(char)* _srcpadname = srcpadname.toCString(No.Alloc);
    const(char)* _destpadname = destpadname.toCString(No.Alloc);
    _retval = cast(bool)gst_element_link_pads(cast(GstElement*)this._cPtr, _srcpadname, dest ? cast(GstElement*)dest._cPtr(No.Dup) : null, _destpadname);
    return _retval;
  }

  /**
      Links the two named pads of the source and destination elements. Side effect
      is that if one of the pads has no parent, it becomes a child of the parent of
      the other element. If they have different parents, the link fails. If caps
      is not null, makes sure that the caps of the link is a subset of caps.
  
      Params:
        srcpadname = the name of the #GstPad in source element
              or null for any pad.
        dest = the #GstElement containing the destination pad.
        destpadname = the name of the #GstPad in destination element
              or null for any pad.
        filter = the #GstCaps to filter the link,
              or null for no filter.
      Returns: true if the pads could be linked, false otherwise.
  */
  bool linkPadsFiltered(string srcpadname, gst.element.Element dest, string destpadname = null, gst.caps.Caps filter = null)
  {
    bool _retval;
    const(char)* _srcpadname = srcpadname.toCString(No.Alloc);
    const(char)* _destpadname = destpadname.toCString(No.Alloc);
    _retval = cast(bool)gst_element_link_pads_filtered(cast(GstElement*)this._cPtr, _srcpadname, dest ? cast(GstElement*)dest._cPtr(No.Dup) : null, _destpadname, filter ? cast(GstCaps*)filter._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Links the two named pads of the source and destination elements.
      Side effect is that if one of the pads has no parent, it becomes a
      child of the parent of the other element.  If they have different
      parents, the link fails.
      
      Calling [gst.element.Element.linkPadsFull] with flags == [gst.types.PadLinkCheck.Default]
      is the same as calling [gst.element.Element.linkPads] and the recommended way of
      linking pads with safety checks applied.
      
      This is a convenience function for [gst.pad.Pad.linkFull].
  
      Params:
        srcpadname = the name of the #GstPad in source element
              or null for any pad.
        dest = the #GstElement containing the destination pad.
        destpadname = the name of the #GstPad in destination element,
          or null for any pad.
        flags = the #GstPadLinkCheck to be performed when linking pads.
      Returns: true if the pads could be linked, false otherwise.
  */
  bool linkPadsFull(string srcpadname, gst.element.Element dest, string destpadname, gst.types.PadLinkCheck flags)
  {
    bool _retval;
    const(char)* _srcpadname = srcpadname.toCString(No.Alloc);
    const(char)* _destpadname = destpadname.toCString(No.Alloc);
    _retval = cast(bool)gst_element_link_pads_full(cast(GstElement*)this._cPtr, _srcpadname, dest ? cast(GstElement*)dest._cPtr(No.Dup) : null, _destpadname, flags);
    return _retval;
  }

  /**
      Brings the element to the lost state. The current state of the
      element is copied to the pending state so that any call to
      [gst.element.Element.getState] will return [gst.types.StateChangeReturn.Async].
      
      An ASYNC_START message is posted. If the element was PLAYING, it will
      go to PAUSED. The element will be restored to its PLAYING state by
      the parent pipeline when it prerolls again.
      
      This is mostly used for elements that lost their preroll buffer
      in the [gst.types.State.Paused] or [gst.types.State.Playing] state after a flush,
      they will go to their pending state again when a new preroll buffer is
      queued. This function can only be called when the element is currently
      not in error or an async state change.
      
      This function is used internally and should normally not be called from
      plugins or applications.
  */
  void lostState()
  {
    gst_element_lost_state(cast(GstElement*)this._cPtr);
  }

  /**
      Post an error, warning or info message on the bus from inside an element.
      
      type must be of #GST_MESSAGE_ERROR, #GST_MESSAGE_WARNING or
      #GST_MESSAGE_INFO.
      
      MT safe.
  
      Params:
        type = the #GstMessageType
        domain = the GStreamer GError domain this message belongs to
        code = the GError code belonging to the domain
        text = an allocated text string to be used
                     as a replacement for the default message connected to code,
                     or null
        debug_ = an allocated debug message to be
                     used as a replacement for the default debugging information,
                     or null
        file = the source code file where the error was generated
        function_ = the source code function where the error was generated
        line = the source code line where the error was generated
  */
  void messageFull(gst.types.MessageType type, glib.types.Quark domain, int code, string text, string debug_, string file, string function_, int line)
  {
    char* _text = text.toCString(Yes.Alloc);
    char* _debug_ = debug_.toCString(Yes.Alloc);
    const(char)* _file = file.toCString(No.Alloc);
    const(char)* _function_ = function_.toCString(No.Alloc);
    gst_element_message_full(cast(GstElement*)this._cPtr, type, domain, code, _text, _debug_, _file, _function_, line);
  }

  /**
      Post an error, warning or info message on the bus from inside an element.
      
      type must be of #GST_MESSAGE_ERROR, #GST_MESSAGE_WARNING or
      #GST_MESSAGE_INFO.
  
      Params:
        type = the #GstMessageType
        domain = the GStreamer GError domain this message belongs to
        code = the GError code belonging to the domain
        text = an allocated text string to be used
                     as a replacement for the default message connected to code,
                     or null
        debug_ = an allocated debug message to be
                     used as a replacement for the default debugging information,
                     or null
        file = the source code file where the error was generated
        function_ = the source code function where the error was generated
        line = the source code line where the error was generated
        structure = optional details structure
  */
  void messageFullWithDetails(gst.types.MessageType type, glib.types.Quark domain, int code, string text, string debug_, string file, string function_, int line, gst.structure.Structure structure)
  {
    char* _text = text.toCString(Yes.Alloc);
    char* _debug_ = debug_.toCString(Yes.Alloc);
    const(char)* _file = file.toCString(No.Alloc);
    const(char)* _function_ = function_.toCString(No.Alloc);
    gst_element_message_full_with_details(cast(GstElement*)this._cPtr, type, domain, code, _text, _debug_, _file, _function_, line, structure ? cast(GstStructure*)structure._cPtr(Yes.Dup) : null);
  }

  /**
      Use this function to signal that the element does not expect any more pads
      to show up in the current pipeline. This function should be called whenever
      pads have been added by the element itself. Elements with #GST_PAD_SOMETIMES
      pad templates use this in combination with autopluggers to figure out that
      the element is done initializing its pads.
      
      This function emits the #GstElement::no-more-pads signal.
      
      MT safe.
  */
  void noMorePads()
  {
    gst_element_no_more_pads(cast(GstElement*)this._cPtr);
  }

  /**
      Post a message on the element's #GstBus. This function takes ownership of the
      message; if you want to access the message after this call, you should add an
      additional reference before calling.
  
      Params:
        message = a #GstMessage to post
      Returns: true if the message was successfully posted. The function returns
        false if the element did not have a bus.
        
        MT safe.
  */
  bool postMessage(gst.message.Message message)
  {
    bool _retval;
    _retval = cast(bool)gst_element_post_message(cast(GstElement*)this._cPtr, message ? cast(GstMessage*)message._cPtr(Yes.Dup) : null);
    return _retval;
  }

  /**
      Get the clock provided by the given element.
      > An element is only required to provide a clock in the PAUSED
      > state. Some elements can provide a clock in other states.
      Returns: the GstClock provided by the
        element or null if no clock could be provided.  Unref after usage.
        
        MT safe.
  */
  gst.clock.Clock provideClock()
  {
    GstClock* _cretval;
    _cretval = gst_element_provide_clock(cast(GstElement*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.clock.Clock)(cast(GstClock*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Performs a query on the given element.
      
      For elements that don't implement a query handler, this function
      forwards the query to a random srcpad or to the peer of a
      random linked sinkpad of this element.
      
      Please note that some queries might need a running pipeline to work.
  
      Params:
        query = the #GstQuery.
      Returns: true if the query could be performed.
        
        MT safe.
  */
  bool query(gst.query.Query query)
  {
    bool _retval;
    _retval = cast(bool)gst_element_query(cast(GstElement*)this._cPtr, query ? cast(GstQuery*)query._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Queries an element to convert src_val in src_format to dest_format.
  
      Params:
        srcFormat = a #GstFormat to convert from.
        srcVal = a value to convert.
        destFormat = the #GstFormat to convert to.
        destVal = a pointer to the result.
      Returns: true if the query could be performed.
  */
  bool queryConvert(gst.types.Format srcFormat, long srcVal, gst.types.Format destFormat, out long destVal)
  {
    bool _retval;
    _retval = cast(bool)gst_element_query_convert(cast(GstElement*)this._cPtr, srcFormat, srcVal, destFormat, cast(long*)&destVal);
    return _retval;
  }

  /**
      Queries an element (usually top-level pipeline or playbin element) for the
      total stream duration in nanoseconds. This query will only work once the
      pipeline is prerolled (i.e. reached PAUSED or PLAYING state). The application
      will receive an ASYNC_DONE message on the pipeline bus when that is the case.
      
      If the duration changes for some reason, you will get a DURATION_CHANGED
      message on the pipeline bus, in which case you should re-query the duration
      using this function.
  
      Params:
        format = the #GstFormat requested
        duration = A location in which to store the total duration, or null.
      Returns: true if the query could be performed.
  */
  bool queryDuration(gst.types.Format format, out long duration)
  {
    bool _retval;
    _retval = cast(bool)gst_element_query_duration(cast(GstElement*)this._cPtr, format, cast(long*)&duration);
    return _retval;
  }

  /**
      Queries an element (usually top-level pipeline or playbin element) for the
      stream position in nanoseconds. This will be a value between 0 and the
      stream duration (if the stream duration is known). This query will usually
      only work once the pipeline is prerolled (i.e. reached PAUSED or PLAYING
      state). The application will receive an ASYNC_DONE message on the pipeline
      bus when that is the case.
      
      If one repeatedly calls this function one can also create a query and reuse
      it in [gst.element.Element.query].
  
      Params:
        format = the #GstFormat requested
        cur = a location in which to store the current
              position, or null.
      Returns: true if the query could be performed.
  */
  bool queryPosition(gst.types.Format format, out long cur)
  {
    bool _retval;
    _retval = cast(bool)gst_element_query_position(cast(GstElement*)this._cPtr, format, cast(long*)&cur);
    return _retval;
  }

  /**
      Makes the element free the previously requested pad as obtained
      with [gst.element.Element.requestPad].
      
      This does not unref the pad. If the pad was created by using
      [gst.element.Element.requestPad], [gst.element.Element.releaseRequestPad] needs to be
      followed by [gst.object.ObjectWrap.unref] to free the pad.
      
      MT safe.
  
      Params:
        pad = the #GstPad to release.
  */
  void releaseRequestPad(gst.pad.Pad pad)
  {
    gst_element_release_request_pad(cast(GstElement*)this._cPtr, pad ? cast(GstPad*)pad._cPtr(No.Dup) : null);
  }

  /**
      Removes pad from element. pad will be destroyed if it has not been
      referenced elsewhere using [gst.object.ObjectWrap.unparent].
      
      This function is used by plugin developers and should not be used
      by applications. Pads that were dynamically requested from elements
      with [gst.element.Element.requestPad] should be released with the
      [gst.element.Element.releaseRequestPad] function instead.
      
      Pads are not automatically deactivated so elements should perform the needed
      steps to deactivate the pad in case this pad is removed in the PAUSED or
      PLAYING state. See [gst.pad.Pad.setActive] for more information about
      deactivating pads.
      
      The pad and the element should be unlocked when calling this function.
      
      This function will emit the #GstElement::pad-removed signal on the element.
  
      Params:
        pad = the #GstPad to remove from the element.
      Returns: true if the pad could be removed. Can return false if the
        pad does not belong to the provided element.
        
        MT safe.
  */
  bool removePad(gst.pad.Pad pad)
  {
    bool _retval;
    _retval = cast(bool)gst_element_remove_pad(cast(GstElement*)this._cPtr, pad ? cast(GstPad*)pad._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  void removePropertyNotifyWatch(gulong watchId)
  {
    gst_element_remove_property_notify_watch(cast(GstElement*)this._cPtr, watchId);
  }

  /**
      Retrieves a request pad from the element according to the provided template.
      Pad templates can be looked up using
      [gst.element_factory.ElementFactory.getStaticPadTemplates].
      
      The pad should be released with [gst.element.Element.releaseRequestPad].
  
      Params:
        templ = a #GstPadTemplate of which we want a pad of.
        name = the name of the request #GstPad
          to retrieve. Can be null.
        caps = the caps of the pad we want to
          request. Can be null.
      Returns: requested #GstPad if found,
            otherwise null.  Release after usage.
  */
  gst.pad.Pad requestPad(gst.pad_template.PadTemplate templ, string name = null, gst.caps.Caps caps = null)
  {
    GstPad* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gst_element_request_pad(cast(GstElement*)this._cPtr, templ ? cast(GstPadTemplate*)templ._cPtr(No.Dup) : null, _name, caps ? cast(const(GstCaps)*)caps._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.pad.Pad)(cast(GstPad*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Retrieves a pad from the element by name (e.g. "src_\`d`"). This version only
      retrieves request pads. The pad should be released with
      [gst.element.Element.releaseRequestPad].
      
      This method is slower than manually getting the pad template and calling
      [gst.element.Element.requestPad] if the pads should have a specific name (e.g.
      name is "src_1" instead of "src_\`u`").
      
      Note that this function was introduced in GStreamer 1.20 in order to provide
      a better name to [gst.element.Element.getRequestPad]. Prior to 1.20, users
      should use [gst.element.Element.getRequestPad] which provides the same
      functionality.
  
      Params:
        name = the name of the request #GstPad to retrieve.
      Returns: requested #GstPad if found,
            otherwise null.  Release after usage.
  */
  gst.pad.Pad requestPadSimple(string name)
  {
    GstPad* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gst_element_request_pad_simple(cast(GstElement*)this._cPtr, _name);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.pad.Pad)(cast(GstPad*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Sends a seek event to an element. See [gst.event.Event.newSeek] for the details of
      the parameters. The seek event is sent to the element using
      [gst.element.Element.sendEvent].
      
      MT safe.
  
      Params:
        rate = The new playback rate
        format = The format of the seek values
        flags = The optional seek flags.
        startType = The type and flags for the new start position
        start = The value of the new start position
        stopType = The type and flags for the new stop position
        stop = The value of the new stop position
      Returns: true if the event was handled. Flushing seeks will trigger a
        preroll, which will emit [gst.types.MessageType.AsyncDone].
  */
  bool seek(double rate, gst.types.Format format, gst.types.SeekFlags flags, gst.types.SeekType startType, long start, gst.types.SeekType stopType, long stop)
  {
    bool _retval;
    _retval = cast(bool)gst_element_seek(cast(GstElement*)this._cPtr, rate, format, flags, startType, start, stopType, stop);
    return _retval;
  }

  /**
      Simple API to perform a seek on the given element, meaning it just seeks
      to the given position relative to the start of the stream. For more complex
      operations like segment seeks (e.g. for looping) or changing the playback
      rate or seeking relative to the last configured playback segment you should
      use [gst.element.Element.seek].
      
      In a completely prerolled PAUSED or PLAYING pipeline, seeking is always
      guaranteed to return true on a seekable media type or false when the media
      type is certainly not seekable (such as a live stream).
      
      Some elements allow for seeking in the READY state, in this
      case they will store the seek event and execute it when they are put to
      PAUSED. If the element supports seek in READY, it will always return true when
      it receives the event in the READY state.
  
      Params:
        format = a #GstFormat to execute the seek in, such as #GST_FORMAT_TIME
        seekFlags = seek options; playback applications will usually want to use
                     GST_SEEK_FLAG_FLUSH | GST_SEEK_FLAG_KEY_UNIT here
        seekPos = position to seek to (relative to the start); if you are doing
                     a seek in #GST_FORMAT_TIME this value is in nanoseconds -
                     multiply with #GST_SECOND to convert seconds to nanoseconds or
                     with #GST_MSECOND to convert milliseconds to nanoseconds.
      Returns: true if the seek operation succeeded. Flushing seeks will trigger a
        preroll, which will emit [gst.types.MessageType.AsyncDone].
  */
  bool seekSimple(gst.types.Format format, gst.types.SeekFlags seekFlags, long seekPos)
  {
    bool _retval;
    _retval = cast(bool)gst_element_seek_simple(cast(GstElement*)this._cPtr, format, seekFlags, seekPos);
    return _retval;
  }

  /**
      Sends an event to an element. If the element doesn't implement an
      event handler, the event will be pushed on a random linked sink pad for
      downstream events or a random linked source pad for upstream events.
      
      This function takes ownership of the provided event so you should
      gst_event_ref() it if you want to reuse the event after this call.
      
      MT safe.
  
      Params:
        event = the #GstEvent to send to the element.
      Returns: true if the event was handled. Events that trigger a preroll (such
        as flushing seeks and steps) will emit [gst.types.MessageType.AsyncDone].
  */
  bool sendEvent(gst.event.Event event)
  {
    bool _retval;
    _retval = cast(bool)gst_element_send_event(cast(GstElement*)this._cPtr, event ? cast(GstEvent*)event._cPtr(Yes.Dup) : null);
    return _retval;
  }

  /**
      Set the base time of an element. See [gst.element.Element.getBaseTime].
      
      MT safe.
  
      Params:
        time = the base time to set.
  */
  void setBaseTime(gst.types.ClockTime time)
  {
    gst_element_set_base_time(cast(GstElement*)this._cPtr, time);
  }

  /**
      Sets the bus of the element. Increases the refcount on the bus.
      For internal use only, unless you're testing elements.
      
      MT safe.
  
      Params:
        bus = the #GstBus to set.
  */
  void setBus(gst.bus.Bus bus = null)
  {
    gst_element_set_bus(cast(GstElement*)this._cPtr, bus ? cast(GstBus*)bus._cPtr(No.Dup) : null);
  }

  /**
      Sets the clock for the element. This function increases the
      refcount on the clock. Any previously set clock on the object
      is unreffed.
  
      Params:
        clock = the #GstClock to set for the element.
      Returns: true if the element accepted the clock. An element can refuse a
        clock when it, for example, is not able to slave its internal clock to the
        clock or when it requires a specific clock to operate.
        
        MT safe.
  */
  bool setClock(gst.clock.Clock clock = null)
  {
    bool _retval;
    _retval = cast(bool)gst_element_set_clock(cast(GstElement*)this._cPtr, clock ? cast(GstClock*)clock._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Sets the context of the element. Increases the refcount of the context.
      
      MT safe.
  
      Params:
        context = the #GstContext to set.
  */
  void setContext(gst.context.Context context)
  {
    gst_element_set_context(cast(GstElement*)this._cPtr, context ? cast(GstContext*)context._cPtr(No.Dup) : null);
  }

  /**
      Locks the state of an element, so state changes of the parent don't affect
      this element anymore.
      
      Note that this is racy if the state lock of the parent bin is not taken.
      The parent bin might've just checked the flag in another thread and as the
      next step proceed to change the child element's state.
      
      MT safe.
  
      Params:
        lockedState = true to lock the element's state
      Returns: true if the state was changed, false if bad parameters were given
        or the elements state-locking needed no change.
  */
  bool setLockedState(bool lockedState)
  {
    bool _retval;
    _retval = cast(bool)gst_element_set_locked_state(cast(GstElement*)this._cPtr, lockedState);
    return _retval;
  }

  /**
      Set the start time of an element. The start time of the element is the
      running time of the element when it last went to the PAUSED state. In READY
      or after a flushing seek, it is set to 0.
      
      Toplevel elements like #GstPipeline will manage the start_time and
      base_time on its children. Setting the start_time to #GST_CLOCK_TIME_NONE
      on such a toplevel element will disable the distribution of the base_time to
      the children and can be useful if the application manages the base_time
      itself, for example if you want to synchronize capture from multiple
      pipelines, and you can also ensure that the pipelines have the same clock.
      
      MT safe.
  
      Params:
        time = the base time to set.
  */
  void setStartTime(gst.types.ClockTime time)
  {
    gst_element_set_start_time(cast(GstElement*)this._cPtr, time);
  }

  /**
      Sets the state of the element. This function will try to set the
      requested state by going through all the intermediary states and calling
      the class's state change function for each.
      
      This function can return #GST_STATE_CHANGE_ASYNC, in which case the
      element will perform the remainder of the state change asynchronously in
      another thread.
      An application can use [gst.element.Element.getState] to wait for the completion
      of the state change or it can wait for a [gst.types.MessageType.AsyncDone] or
      [gst.types.MessageType.StateChanged] on the bus.
      
      State changes to [gst.types.State.Ready] or [gst.types.State.Null] never return
      #GST_STATE_CHANGE_ASYNC.
  
      Params:
        state = the element's new #GstState.
      Returns: Result of the state change using #GstStateChangeReturn.
        
        MT safe.
  */
  gst.types.StateChangeReturn setState(gst.types.State state)
  {
    GstStateChangeReturn _cretval;
    _cretval = gst_element_set_state(cast(GstElement*)this._cPtr, state);
    gst.types.StateChangeReturn _retval = cast(gst.types.StateChangeReturn)_cretval;
    return _retval;
  }

  /**
      Tries to change the state of the element to the same as its parent.
      If this function returns false, the state of element is undefined.
      Returns: true, if the element's state could be synced to the parent's state.
        
        MT safe.
  */
  bool syncStateWithParent()
  {
    bool _retval;
    _retval = cast(bool)gst_element_sync_state_with_parent(cast(GstElement*)this._cPtr);
    return _retval;
  }

  /**
      Unlinks all source pads of the source element with all sink pads
      of the sink element to which they are linked.
      
      If the link has been made using [gst.element.Element.link], it could have created an
      requestpad, which has to be released using [gst.element.Element.releaseRequestPad].
  
      Params:
        dest = the sink #GstElement to unlink.
  */
  void unlink(gst.element.Element dest)
  {
    gst_element_unlink(cast(GstElement*)this._cPtr, dest ? cast(GstElement*)dest._cPtr(No.Dup) : null);
  }

  /**
      Unlinks the two named pads of the source and destination elements.
      
      This is a convenience function for [gst.pad.Pad.unlink].
  
      Params:
        srcpadname = the name of the #GstPad in source element.
        dest = a #GstElement containing the destination pad.
        destpadname = the name of the #GstPad in destination element.
  */
  void unlinkPads(string srcpadname, gst.element.Element dest, string destpadname)
  {
    const(char)* _srcpadname = srcpadname.toCString(No.Alloc);
    const(char)* _destpadname = destpadname.toCString(No.Alloc);
    gst_element_unlink_pads(cast(GstElement*)this._cPtr, _srcpadname, dest ? cast(GstElement*)dest._cPtr(No.Dup) : null, _destpadname);
  }

  /**
      Connect to `NoMorePads` signal.
  
      This signals that the element will not generate more dynamic pads.
        Note that this signal will usually be emitted from the context of
        the streaming thread.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gst.element.Element element))
  
          `element` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectNoMorePads(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gst.element.Element)))
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
    return connectSignalClosure("no-more-pads", closure, after);
  }

  /**
      Connect to `PadAdded` signal.
  
      a new #GstPad has been added to the element. Note that this signal will
        usually be emitted from the context of the streaming thread. Also keep in
        mind that if you add new elements to the pipeline in the signal handler
        you will need to set them to the desired target state with
        [gst.element.Element.setState] or [gst.element.Element.syncStateWithParent].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gst.pad.Pad newPad, gst.element.Element element))
  
          `newPad` the pad that has been added (optional)
  
          `element` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPadAdded(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gst.pad.Pad)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gst.element.Element)))
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
    return connectSignalClosure("pad-added", closure, after);
  }

  /**
      Connect to `PadRemoved` signal.
  
      a #GstPad has been removed from the element
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gst.pad.Pad oldPad, gst.element.Element element))
  
          `oldPad` the pad that has been removed (optional)
  
          `element` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPadRemoved(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gst.pad.Pad)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gst.element.Element)))
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
    return connectSignalClosure("pad-removed", closure, after);
  }
}
