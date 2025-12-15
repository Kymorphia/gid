/// Module for [GhostPad] class
module gst.ghost_pad;

import gid.gid;
import gobject.object;
import gst.c.functions;
import gst.c.types;
import gst.object;
import gst.pad;
import gst.pad_template;
import gst.proxy_pad;
import gst.types;

/**
    GhostPads are useful when organizing pipelines with #GstBin like elements.
    The idea here is to create hierarchical element graphs. The bin element
    contains a sub-graph. Now one would like to treat the bin-element like any
    other #GstElement. This is where GhostPads come into play. A GhostPad acts as
    a proxy for another pad. Thus the bin can have sink and source ghost-pads
    that are associated with sink and source pads of the child elements.
    
    If the target pad is known at creation time, [gst.ghost_pad.GhostPad.new_] is the
    function to use to get a ghost-pad. Otherwise one can use [gst.ghost_pad.GhostPad.newNoTarget]
    to create the ghost-pad and use [gst.ghost_pad.GhostPad.setTarget] to establish the
    association later on.
    
    Note that GhostPads add overhead to the data processing of a pipeline.
*/
class GhostPad : gst.proxy_pad.ProxyPad
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
    return cast(void function())gst_ghost_pad_get_type != &gidSymbolNotFound ? gst_ghost_pad_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GhostPad self()
  {
    return this;
  }

  /**
      Create a new ghostpad with target as the target. The direction will be taken
      from the target pad. target must be unlinked.
      
      Will ref the target.
  
      Params:
        name = the name of the new pad, or null to assign a default name
        target = the pad to ghost.
      Returns: a new #GstPad, or null in
        case of an error.
  */
  this(string name, gst.pad.Pad target)
  {
    GstPad* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gst_ghost_pad_new(_name, target ? cast(GstPad*)target._cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }

  /**
      Create a new ghostpad with target as the target. The direction will be taken
      from the target pad. The template used on the ghostpad will be template.
      
      Will ref the target.
  
      Params:
        name = the name of the new pad, or null to assign a default name.
        target = the pad to ghost.
        templ = the #GstPadTemplate to use on the ghostpad.
      Returns: a new #GstPad, or null in
        case of an error.
  */
  static gst.ghost_pad.GhostPad newFromTemplate(string name, gst.pad.Pad target, gst.pad_template.PadTemplate templ)
  {
    GstPad* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gst_ghost_pad_new_from_template(_name, target ? cast(GstPad*)target._cPtr(No.Dup) : null, templ ? cast(GstPadTemplate*)templ._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.ghost_pad.GhostPad)(cast(GstPad*)_cretval, No.Take);
    return _retval;
  }

  /**
      Create a new ghostpad without a target with the given direction.
      A target can be set on the ghostpad later with the
      [gst.ghost_pad.GhostPad.setTarget] function.
      
      The created ghostpad will not have a padtemplate.
  
      Params:
        name = the name of the new pad, or null to assign a default name.
        dir = the direction of the ghostpad
      Returns: a new #GstPad, or null in
        case of an error.
  */
  static gst.ghost_pad.GhostPad newNoTarget(string name, gst.types.PadDirection dir)
  {
    GstPad* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gst_ghost_pad_new_no_target(_name, dir);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.ghost_pad.GhostPad)(cast(GstPad*)_cretval, No.Take);
    return _retval;
  }

  /**
      Create a new ghostpad based on templ, without setting a target. The
      direction will be taken from the templ.
  
      Params:
        name = the name of the new pad, or null to assign a default name
        templ = the #GstPadTemplate to create the ghostpad from.
      Returns: a new #GstPad, or null in
        case of an error.
  */
  static gst.ghost_pad.GhostPad newNoTargetFromTemplate(string name, gst.pad_template.PadTemplate templ)
  {
    GstPad* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gst_ghost_pad_new_no_target_from_template(_name, templ ? cast(GstPadTemplate*)templ._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.ghost_pad.GhostPad)(cast(GstPad*)_cretval, No.Take);
    return _retval;
  }

  /**
      Invoke the default activate mode function of a ghost pad.
  
      Params:
        pad = the #GstPad to activate or deactivate.
        parent = the parent of pad or null
        mode = the requested activation mode
        active = whether the pad should be active or not.
      Returns: true if the operation was successful.
  */
  static bool activateModeDefault(gst.pad.Pad pad, gst.object.ObjectWrap parent, gst.types.PadMode mode, bool active)
  {
    bool _retval;
    _retval = cast(bool)gst_ghost_pad_activate_mode_default(pad ? cast(GstPad*)pad._cPtr(No.Dup) : null, parent ? cast(GstObject*)parent._cPtr(No.Dup) : null, mode, active);
    return _retval;
  }

  /**
      Invoke the default activate mode function of a proxy pad that is
      owned by a ghost pad.
  
      Params:
        pad = the #GstPad to activate or deactivate.
        parent = the parent of pad or null
        mode = the requested activation mode
        active = whether the pad should be active or not.
      Returns: true if the operation was successful.
  */
  static bool internalActivateModeDefault(gst.pad.Pad pad, gst.object.ObjectWrap parent, gst.types.PadMode mode, bool active)
  {
    bool _retval;
    _retval = cast(bool)gst_ghost_pad_internal_activate_mode_default(pad ? cast(GstPad*)pad._cPtr(No.Dup) : null, parent ? cast(GstObject*)parent._cPtr(No.Dup) : null, mode, active);
    return _retval;
  }

  /**
      Finish initialization of a newly allocated ghost pad.
      
      This function is most useful in language bindings and when subclassing
      #GstGhostPad; plugin and application developers normally will not call this
      function. Call this function directly after a call to g_object_new
      (GST_TYPE_GHOST_PAD, "direction", dir, ..., NULL).
      Returns: true if the construction succeeds, false otherwise.
  
      Deprecated: This function is deprecated since 1.18 and does nothing
        anymore.
  */
  bool construct()
  {
    bool _retval;
    _retval = cast(bool)gst_ghost_pad_construct(cast(GstGhostPad*)this._cPtr);
    return _retval;
  }

  /**
      Get the target pad of gpad. Unref target pad after usage.
      Returns: the target #GstPad, can be
        null if the ghostpad has no target set. Unref target pad after
        usage.
  */
  gst.pad.Pad getTarget()
  {
    GstPad* _cretval;
    _cretval = gst_ghost_pad_get_target(cast(GstGhostPad*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.pad.Pad)(cast(GstPad*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Set the new target of the ghostpad gpad. Any existing target
      is unlinked and links to the new target are established. if newtarget is
      null the target will be cleared.
  
      Params:
        newtarget = the new pad target
      Returns: true if the new target could be set. This function
            can return false when the internal pads could not be linked.
  */
  bool setTarget(gst.pad.Pad newtarget = null)
  {
    bool _retval;
    _retval = cast(bool)gst_ghost_pad_set_target(cast(GstGhostPad*)this._cPtr, newtarget ? cast(GstPad*)newtarget._cPtr(No.Dup) : null);
    return _retval;
  }
}
