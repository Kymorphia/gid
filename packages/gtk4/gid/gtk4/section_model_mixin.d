/// Module for [SectionModel] interface mixin
module gid.gtk4.section_model_mixin;

public import gid.core.basictypes;
public import gid.gtk4.section_model_iface_proxy;
public import gid.core.utils;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.dclosure;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gtk4.c.functions;
public import gid.gtk4.c.types;
public import gid.gtk4.types;

/**
    An interface that adds support for sections to list models.
    
    A [gid.gtk4.section_model.SectionModel] groups successive items into so-called sections. List widgets
    like [gid.gtk4.list_view.ListView] and [gid.gtk4.grid_view.GridView] then allow displaying section headers for
    these sections by installing a header factory.
    
    Many GTK list models support sections inherently, or they pass through the sections
    of a model they are wrapping.
    
    When the section groupings of a model change, the model will emit the
    [gid.gtk4.section_model.SectionModel.sectionsChanged] signal by calling the
    [gid.gtk4.section_model.SectionModel.sectionsChanged] function. All sections in the given range
    then need to be queried again.
    The [gid.gio2.list_model.ListModel.itemsChanged] signal has the same effect, all sections in
    that range are invalidated, too.
*/
template SectionModelT()
{

  /**
      Query the section that covers the given position. The number of
      items in the section can be computed by `out_end - out_start`.
      
      If the position is larger than the number of items, a single
      range from n_items to G_MAXUINT will be returned.
  
      Params:
        position = the position of the item to query
        outStart = the position of the first item in the section
        outEnd = the position of the first item not part of the section
            anymore.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetSection`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncGetSection(uint position, out uint outStart, out uint outEnd)
  {
    auto _klass = cast(GtkSectionModelInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.section_model.SectionModel._getGType);
    if (!_klass || !_klass.getSection)
      return;

    _klass.getSection(cast(GtkSectionModel*)this._cPtr, position, cast(uint*)&outStart, cast(uint*)&outEnd);
  }

  /**
      Query the section that covers the given position. The number of
      items in the section can be computed by `out_end - out_start`.
      
      If the position is larger than the number of items, a single
      range from n_items to G_MAXUINT will be returned.
  
      Params:
        position = the position of the item to query
        outStart = the position of the first item in the section
        outEnd = the position of the first item not part of the section
            anymore.
  */
  override void getSection(uint position, out uint outStart, out uint outEnd) nothrow
  {
    gtk_section_model_get_section(cast(GtkSectionModel*)this._cPtr, position, cast(uint*)&outStart, cast(uint*)&outEnd);
  }

  /**
      This function emits the [gid.gtk4.section_model.SectionModel.sectionsChanged]
      signal to notify about changes to sections.
      
      It must cover all positions that used to be a section start or that
      are now a section start. It does not have to cover all positions for
      which the section has changed.
      
      The [gid.gio2.list_model.ListModel.itemsChanged] implies the effect of the
      [gid.gtk4.section_model.SectionModel.sectionsChanged] signal for all the items
      it covers.
      
      It is recommended that when changes to the items cause section changes
      in a larger range, that the larger range is included in the emission
      of the [gid.gio2.list_model.ListModel.itemsChanged] instead of emitting
      two signals.
  
      Params:
        position = the first changed item
        nItems = the number of changed items
  */
  override void sectionsChanged(uint position, uint nItems) nothrow
  {
    gtk_section_model_sections_changed(cast(GtkSectionModel*)this._cPtr, position, nItems);
  }

  /**
      Connect to `SectionsChanged` signal.
  
      Emitted when the start-of-section state of some of the items in model changes.
        
        Note that this signal does not specify the new section state of the
        items, they need to be queried manually. It is also not necessary for
        a model to change the section state of any of the items in the section
        model, though it would be rather useless to emit such a signal.
        
        The [gid.gio2.list_model.ListModel.itemsChanged] implies the effect of the
        [gid.gtk4.section_model.SectionModel.sectionsChanged] signal for all the items
        it covers.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(uint position, uint nItems, gid.gtk4.section_model.SectionModel sectionModel)`
  
          `position` The first item that may have changed (optional)
  
          `nItems` number of items with changes (optional)
  
          `sectionModel` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSectionsChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == uint)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == uint)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk4.section_model.SectionModel)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.section_model.SectionModel.sectionsChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("sections-changed", closure, after);
  }

  /// True if the D class T overrides any vfunc method of gid.gtk4.section_model.SectionModel (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gtk4_section_model_SectionModel(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetSection", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gtk4.section_model.SectionModel vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gtk4_section_model_SectionModel(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetSection", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_section_model_SectionModel(iface, "get_section");
  }

  private static void _installIfaceVfunc_gid_gtk4_section_model_SectionModel(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GtkSectionModelInterface*)iface;

    switch (vfunc)
    {
      case "get_section":
      {
        static extern(C) void _vfuncGetSectionTramp(GtkSectionModel* self, uint position, uint* outStart, uint* outEnd) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GtkSectionModelInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self), gid.gtk4.section_model.SectionModel._getGType);
            if (_klass && _klass.getSection)
              return (cast(typeof(&_vfuncGetSectionTramp))_klass.getSection)(self, position, outStart, outEnd);
            return;
          }

          try
          {
            _obj.vfuncGetSection(position, *outStart, *outEnd);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.section_model.SectionModel.vfuncGetSection");
          }
        }

        _klass.getSection = cast(typeof(_klass.getSection))&_vfuncGetSectionTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk4.section_model.SectionModel]
template SectionModelGidBuilderT()
{
}
