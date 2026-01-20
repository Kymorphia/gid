/// Module for [FlowCombiner] class
module gstbase.flow_combiner;

import gid.gid;
import gobject.boxed;
import gst.pad;
import gst.types;
import gstbase.c.functions;
import gstbase.c.types;
import gstbase.types;

/**
    Utility struct to help handling #GstFlowReturn combination. Useful for
    #GstElement<!-- -->s that have multiple source pads and need to combine
    the different #GstFlowReturn for those pads.
    
    #GstFlowCombiner works by using the last #GstFlowReturn for all #GstPad
    it has in its list and computes the combined return value and provides
    it to the caller.
    
    To add a new pad to the #GstFlowCombiner use [gstbase.flow_combiner.FlowCombiner.addPad].
    The new #GstPad is stored with a default value of [gst.types.FlowReturn.Ok].
    
    In case you want a #GstPad to be removed, use [gstbase.flow_combiner.FlowCombiner.removePad].
    
    Please be aware that this struct isn't thread safe as its designed to be
     used by demuxers, those usually will have a single thread operating it.
    
    These functions will take refs on the passed #GstPad<!-- -->s.
    
    Aside from reducing the user's code size, the main advantage of using this
    helper struct is to follow the standard rules for #GstFlowReturn combination.
    These rules are:
    
    $(LIST
      * [gst.types.FlowReturn.Eos]: only if all returns are EOS too
      * [gst.types.FlowReturn.NotLinked]: only if all returns are NOT_LINKED too
      * [gst.types.FlowReturn.Error] or below: if at least one returns an error return
      * [gst.types.FlowReturn.NotNegotiated]: if at least one returns a not-negotiated return
      * [gst.types.FlowReturn.Flushing]: if at least one returns flushing
      * [gst.types.FlowReturn.Ok]: otherwise
    )
      
    [gst.types.FlowReturn.Error] or below, GST_FLOW_NOT_NEGOTIATED and GST_FLOW_FLUSHING are
    returned immediately from the [gstbase.flow_combiner.FlowCombiner.updateFlow] function.
*/
class FlowCombiner : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_flow_combiner_get_type != &gidSymbolNotFound ? gst_flow_combiner_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FlowCombiner self()
  {
    return this;
  }

  /**
      Creates a new #GstFlowCombiner, use [gstbase.flow_combiner.FlowCombiner.free] to free it.
      Returns: A new #GstFlowCombiner
  */
  this()
  {
    GstFlowCombiner* _cretval;
    _cretval = gst_flow_combiner_new();
    this(_cretval, Yes.Take);
  }

  /**
      Adds a new #GstPad to the #GstFlowCombiner.
  
      Params:
        pad = the #GstPad that is being added
  */
  void addPad(gst.pad.Pad pad)
  {
    gst_flow_combiner_add_pad(cast(GstFlowCombiner*)this._cPtr, pad ? cast(GstPad*)pad._cPtr(No.Dup) : null);
  }

  /**
      Removes all pads from a #GstFlowCombiner and resets it to its initial state.
  */
  void clear()
  {
    gst_flow_combiner_clear(cast(GstFlowCombiner*)this._cPtr);
  }

  /**
      Removes a #GstPad from the #GstFlowCombiner.
  
      Params:
        pad = the #GstPad to remove
  */
  void removePad(gst.pad.Pad pad)
  {
    gst_flow_combiner_remove_pad(cast(GstFlowCombiner*)this._cPtr, pad ? cast(GstPad*)pad._cPtr(No.Dup) : null);
  }

  /**
      Reset flow combiner and all pads to their initial state without removing pads.
  */
  void reset()
  {
    gst_flow_combiner_reset(cast(GstFlowCombiner*)this._cPtr);
  }

  /**
      Computes the combined flow return for the pads in it.
      
      The #GstFlowReturn parameter should be the last flow return update for a pad
      in this #GstFlowCombiner. It will use this value to be able to shortcut some
      combinations and avoid looking over all pads again. e.g. The last combined
      return is the same as the latest obtained #GstFlowReturn.
  
      Params:
        fret = the latest #GstFlowReturn received for a pad in this #GstFlowCombiner
      Returns: The combined #GstFlowReturn
  */
  gst.types.FlowReturn updateFlow(gst.types.FlowReturn fret)
  {
    GstFlowReturn _cretval;
    _cretval = gst_flow_combiner_update_flow(cast(GstFlowCombiner*)this._cPtr, fret);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Sets the provided pad's last flow return to provided value and computes
      the combined flow return for the pads in it.
      
      The #GstFlowReturn parameter should be the last flow return update for a pad
      in this #GstFlowCombiner. It will use this value to be able to shortcut some
      combinations and avoid looking over all pads again. e.g. The last combined
      return is the same as the latest obtained #GstFlowReturn.
  
      Params:
        pad = the #GstPad whose #GstFlowReturn to update
        fret = the latest #GstFlowReturn received for a pad in this #GstFlowCombiner
      Returns: The combined #GstFlowReturn
  */
  gst.types.FlowReturn updatePadFlow(gst.pad.Pad pad, gst.types.FlowReturn fret)
  {
    GstFlowReturn _cretval;
    _cretval = gst_flow_combiner_update_pad_flow(cast(GstFlowCombiner*)this._cPtr, pad ? cast(GstPad*)pad._cPtr(No.Dup) : null, fret);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }
}
