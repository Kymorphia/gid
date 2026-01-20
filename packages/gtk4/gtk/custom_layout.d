/// Module for [CustomLayout] class
module gtk.custom_layout;

import gid.gid;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.layout_manager;
import gtk.types;
import gtk.widget;

/**
    [gtk.custom_layout.CustomLayout] uses closures for size negotiation.
    
    A `GtkCustomLayout `uses closures matching to the old [gtk.widget.Widget]
    virtual functions for size negotiation, as a convenience API to
    ease the porting towards the corresponding `GtkLayoutManager
    virtual functions.
*/
class CustomLayout : gtk.layout_manager.LayoutManager
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
    return cast(void function())gtk_custom_layout_get_type != &gidSymbolNotFound ? gtk_custom_layout_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CustomLayout self()
  {
    return this;
  }

  /**
      Creates a new legacy layout manager.
      
      Legacy layout managers map to the old [gtk.widget.Widget] size negotiation
      virtual functions, and are meant to be used during the transition
      from layout containers to layout manager delegates.
  
      Params:
        requestMode = a function to retrieve
            the [gtk.types.SizeRequestMode] of the widget using the layout; the
            default request mode is [gtk.types.SizeRequestMode.ConstantSize]
        measure = a function to measure the widget using the layout manager
        allocate = a function to allocate the children of the widget using
            the layout manager
      Returns: the newly created [gtk.custom_layout.CustomLayout]
  */
  this(gtk.types.CustomRequestModeFunc requestMode, gtk.types.CustomMeasureFunc measure, gtk.types.CustomAllocateFunc allocate)
  {
    static gtk.types.CustomRequestModeFunc _static_requestMode;

    extern(C) GtkSizeRequestMode _requestModeCallback(GtkWidget* widget)
    {
      gtk.types.SizeRequestMode _dretval;

      _dretval = _static_requestMode(gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(void*)widget, No.Take));
      auto _retval = cast(GtkSizeRequestMode)_dretval;

      return _retval;
    }
    auto _requestModeCB = requestMode ? &_requestModeCallback : null;
    _static_requestMode = requestMode;
    static gtk.types.CustomMeasureFunc _static_measure;

    extern(C) void _measureCallback(GtkWidget* widget, GtkOrientation orientation, int forSize, int* minimum, int* natural, int* minimumBaseline, int* naturalBaseline)
    {
      _static_measure(gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(void*)widget, No.Take), orientation, forSize, *minimum, *natural, *minimumBaseline, *naturalBaseline);
    }
    auto _measureCB = measure ? &_measureCallback : null;
    _static_measure = measure;
    static gtk.types.CustomAllocateFunc _static_allocate;

    extern(C) void _allocateCallback(GtkWidget* widget, int width, int height, int baseline)
    {
      _static_allocate(gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(void*)widget, No.Take), width, height, baseline);
    }
    auto _allocateCB = allocate ? &_allocateCallback : null;
    _static_allocate = allocate;
    GtkLayoutManager* _cretval;
    _cretval = gtk_custom_layout_new(_requestModeCB, _measureCB, _allocateCB);
    _static_requestMode = null;
    _static_measure = null;
    _static_allocate = null;
    this(_cretval, Yes.Take);
  }
}
