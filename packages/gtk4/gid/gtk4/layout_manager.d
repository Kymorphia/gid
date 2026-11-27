/// Module for [LayoutManager] class
module gid.gtk4.layout_manager;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.layout_child;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    Handles the preferred size and allocation for children of a widget.
    
    You typically subclass [gid.gtk4.layout_manager.LayoutManager] if you want to implement a
    layout policy for the children of a widget, or if you want to determine
    the size of a widget depending on its contents.
    
    Each [gid.gtk4.widget.Widget] can only have a [gid.gtk4.layout_manager.LayoutManager] instance associated
    to it at any given time; it is possible, though, to replace the layout
    manager instance using [gid.gtk4.widget.Widget.setLayoutManager].
    
    ## Layout properties
    
    A layout manager can expose properties for controlling the layout of
    each child, by creating an object type derived from [gid.gtk4.layout_child.LayoutChild]
    and installing the properties on it as normal [gid.gobject2.object.ObjectWrap] properties.
    
    Each [gid.gtk4.layout_child.LayoutChild] instance storing the layout properties for a
    specific child is created through the [gid.gtk4.layout_manager.LayoutManager.getLayoutChild]
    method; a [gid.gtk4.layout_manager.LayoutManager] controls the creation of its [gid.gtk4.layout_child.LayoutChild]
    instances by overriding the GtkLayoutManagerClass.create_layout_child()
    virtual function. The typical implementation should look like:
    
    ```c
    static GtkLayoutChild *
    create_layout_child (GtkLayoutManager *manager,
                         GtkWidget        *container,
                         GtkWidget        *child)
    {
      return g_object_new (your_layout_child_get_type (),
                           "layout-manager", manager,
                           "child-widget", child,
                           NULL);
    }
    ```
    
    The [gid.gtk4.layout_child.LayoutChild.layoutManager] and
    [gid.gtk4.layout_child.LayoutChild.childWidget] properties
    on the newly created [gid.gtk4.layout_child.LayoutChild] instance are mandatory. The
    [gid.gtk4.layout_manager.LayoutManager] will cache the newly created [gid.gtk4.layout_child.LayoutChild] instance
    until the widget is removed from its parent, or the parent removes the
    layout manager.
    
    Each [gid.gtk4.layout_manager.LayoutManager] instance creating a [gid.gtk4.layout_child.LayoutChild] should use
    [gid.gtk4.layout_manager.LayoutManager.getLayoutChild] every time it needs to query
    the layout properties; each [gid.gtk4.layout_child.LayoutChild] instance should call
    [gid.gtk4.layout_manager.LayoutManager.layoutChanged] every time a property is
    updated, in order to queue a new size measuring and allocation.
*/
@gidGir("LayoutManager", "LayoutManagerClass")
class LayoutManager : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_layout_manager_get_type != &gidSymbolNotFound ? gtk_layout_manager_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkLayoutManager";
  }

  /** Returns `this`, for use in `with` statements. */
  override LayoutManager self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.layout_manager.LayoutManager]
      Returns: New builder object
  */
  static LayoutManagerGidBuilder builder() nothrow
  {
    return new LayoutManagerGidBuilder;
  }

  /**
      Assigns the given width, height, and baseline to
      a widget, and computes the position and sizes of the children of
      the widget using the layout management policy of manager.
  
      Params:
        widget = the [gid.gtk4.widget.Widget] using manager
        width = the new width of the widget
        height = the new height of the widget
        baseline = the baseline position of the widget, or -1
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncAllocate` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncAllocate(gid.gtk4.widget.Widget widget, int width, int height, int baseline)
  {
    auto _klass = cast(GtkLayoutManagerClass*)_vfuncClass;
    if (!_klass.allocate)
      return;

    _klass.allocate(cast(GtkLayoutManager*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, width, height, baseline);
  }

  /**
      Create a [gid.gtk4.layout_child.LayoutChild] instance for the given for_child widget.
  
      Params:
        widget = the widget using the manager
        forChild = the child of widget
      Returns: a [gid.gtk4.layout_child.LayoutChild]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncCreateLayoutChild` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gtk4.layout_child.LayoutChild vfuncCreateLayoutChild(gid.gtk4.widget.Widget widget, gid.gtk4.widget.Widget forChild)
  {
    auto _klass = cast(GtkLayoutManagerClass*)_vfuncClass;
    if (!_klass.createLayoutChild)
      return typeof(return).init;

    GtkLayoutChild* _cretval;
    _cretval = _klass.createLayoutChild(cast(GtkLayoutManager*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, forChild ? cast(GtkWidget*)forChild._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.layout_child.LayoutChild)(cast(GtkLayoutChild*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      a virtual function, used to return the preferred
        request mode for the layout manager; for instance, "width for height"
        or "height for width"; see [gid.gtk4.types.SizeRequestMode]
  
      Params:
        widget = 
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetRequestMode` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gtk4.types.SizeRequestMode vfuncGetRequestMode(gid.gtk4.widget.Widget widget)
  {
    auto _klass = cast(GtkLayoutManagerClass*)_vfuncClass;
    if (!_klass.getRequestMode)
      return typeof(return).init;

    GtkSizeRequestMode _cretval;
    _cretval = _klass.getRequestMode(cast(GtkLayoutManager*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
    gid.gtk4.types.SizeRequestMode _retval = cast(gid.gtk4.types.SizeRequestMode)_cretval;
    return _retval;
  }

  /**
      Measures the size of the widget using manager, for the
      given orientation and size.
      
      See the [gid.gtk4.widget.Widget] documentation on layout management for
      more details.
  
      Params:
        widget = the [gid.gtk4.widget.Widget] using manager
        orientation = the orientation to measure
        forSize = Size for the opposite of orientation; for instance, if
            the orientation is [gid.gtk4.types.Orientation.Horizontal], this is the height
            of the widget; if the orientation is [gid.gtk4.types.Orientation.Vertical], this
            is the width of the widget. This allows to measure the height for the
            given width, and the width for the given height. Use -1 if the size
            is not known
        minimum = the minimum size for the given size and
            orientation
        natural = the natural, or preferred size for the
            given size and orientation
        minimumBaseline = the baseline position for the
            minimum size
        naturalBaseline = the baseline position for the
            natural size
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncMeasure` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncMeasure(gid.gtk4.widget.Widget widget, gid.gtk4.types.Orientation orientation, int forSize, out int minimum, out int natural, out int minimumBaseline, out int naturalBaseline)
  {
    auto _klass = cast(GtkLayoutManagerClass*)_vfuncClass;
    if (!_klass.measure)
      return;

    _klass.measure(cast(GtkLayoutManager*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, orientation, forSize, cast(int*)&minimum, cast(int*)&natural, cast(int*)&minimumBaseline, cast(int*)&naturalBaseline);
  }

  /**
      a virtual function, called when the widget using the layout
        manager is attached to a [gid.gtk4.root.Root]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncRoot` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncRoot()
  {
    auto _klass = cast(GtkLayoutManagerClass*)_vfuncClass;
    if (!_klass.root)
      return;

    _klass.root(cast(GtkLayoutManager*)this._cPtr);
  }

  /**
      a virtual function, called when the widget using the layout
        manager is detached from a [gid.gtk4.root.Root]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncUnroot` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncUnroot()
  {
    auto _klass = cast(GtkLayoutManagerClass*)_vfuncClass;
    if (!_klass.unroot)
      return;

    _klass.unroot(cast(GtkLayoutManager*)this._cPtr);
  }

  /**
      Assigns the given width, height, and baseline to
      a widget, and computes the position and sizes of the children of
      the widget using the layout management policy of manager.
  
      Params:
        widget = the [gid.gtk4.widget.Widget] using manager
        width = the new width of the widget
        height = the new height of the widget
        baseline = the baseline position of the widget, or -1
  */
  void allocate(gid.gtk4.widget.Widget widget, int width, int height, int baseline) nothrow
  {
    gtk_layout_manager_allocate(cast(GtkLayoutManager*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, width, height, baseline);
  }

  /**
      Retrieves a [gid.gtk4.layout_child.LayoutChild] instance for the [gid.gtk4.layout_manager.LayoutManager],
      creating one if necessary.
      
      The child widget must be a child of the widget using manager.
      
      The [gid.gtk4.layout_child.LayoutChild] instance is owned by the [gid.gtk4.layout_manager.LayoutManager],
      and is guaranteed to exist as long as child is a child of the
      [gid.gtk4.widget.Widget] using the given [gid.gtk4.layout_manager.LayoutManager].
  
      Params:
        child = a [gid.gtk4.widget.Widget]
      Returns: a [gid.gtk4.layout_child.LayoutChild]
  */
  gid.gtk4.layout_child.LayoutChild getLayoutChild(gid.gtk4.widget.Widget child) nothrow
  {
    GtkLayoutChild* _cretval;
    _cretval = gtk_layout_manager_get_layout_child(cast(GtkLayoutManager*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.layout_child.LayoutChild)(cast(GtkLayoutChild*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the request mode of manager.
      Returns: a [gid.gtk4.types.SizeRequestMode]
  */
  gid.gtk4.types.SizeRequestMode getRequestMode() nothrow
  {
    GtkSizeRequestMode _cretval;
    _cretval = gtk_layout_manager_get_request_mode(cast(GtkLayoutManager*)this._cPtr);
    gid.gtk4.types.SizeRequestMode _retval = cast(gid.gtk4.types.SizeRequestMode)_cretval;
    return _retval;
  }

  /**
      Retrieves the [gid.gtk4.widget.Widget] using the given [gid.gtk4.layout_manager.LayoutManager].
      Returns: a [gid.gtk4.widget.Widget]
  */
  gid.gtk4.widget.Widget getWidget() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_layout_manager_get_widget(cast(GtkLayoutManager*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Queues a resize on the [gid.gtk4.widget.Widget] using manager, if any.
      
      This function should be called by subclasses of [gid.gtk4.layout_manager.LayoutManager]
      in response to changes to their layout management policies.
  */
  void layoutChanged() nothrow
  {
    gtk_layout_manager_layout_changed(cast(GtkLayoutManager*)this._cPtr);
  }

  /**
      Measures the size of the widget using manager, for the
      given orientation and size.
      
      See the [gid.gtk4.widget.Widget] documentation on layout management for
      more details.
  
      Params:
        widget = the [gid.gtk4.widget.Widget] using manager
        orientation = the orientation to measure
        forSize = Size for the opposite of orientation; for instance, if
            the orientation is [gid.gtk4.types.Orientation.Horizontal], this is the height
            of the widget; if the orientation is [gid.gtk4.types.Orientation.Vertical], this
            is the width of the widget. This allows to measure the height for the
            given width, and the width for the given height. Use -1 if the size
            is not known
        minimum = the minimum size for the given size and
            orientation
        natural = the natural, or preferred size for the
            given size and orientation
        minimumBaseline = the baseline position for the
            minimum size
        naturalBaseline = the baseline position for the
            natural size
  */
  void measure(gid.gtk4.widget.Widget widget, gid.gtk4.types.Orientation orientation, int forSize, out int minimum, out int natural, out int minimumBaseline, out int naturalBaseline) nothrow
  {
    gtk_layout_manager_measure(cast(GtkLayoutManager*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, orientation, forSize, cast(int*)&minimum, cast(int*)&natural, cast(int*)&minimumBaseline, cast(int*)&naturalBaseline);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from LayoutManager
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk4.layout_manager.LayoutManager), T.stringof ~ " is not derived from gid.gtk4.layout_manager.LayoutManager");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncAllocate", true)[0]) == gid.gtk4.layout_manager.LayoutManager))
      _installVfunc(klass, "allocate");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCreateLayoutChild", true)[0]) == gid.gtk4.layout_manager.LayoutManager))
      _installVfunc(klass, "create_layout_child");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetRequestMode", true)[0]) == gid.gtk4.layout_manager.LayoutManager))
      _installVfunc(klass, "get_request_mode");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncMeasure", true)[0]) == gid.gtk4.layout_manager.LayoutManager))
      _installVfunc(klass, "measure");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRoot", true)[0]) == gid.gtk4.layout_manager.LayoutManager))
      _installVfunc(klass, "root");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncUnroot", true)[0]) == gid.gtk4.layout_manager.LayoutManager))
      _installVfunc(klass, "unroot");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkLayoutManagerClass*)klass;

    switch (vfunc)
    {
      case "allocate":
      {
        static extern(C) void _vfuncAllocateTramp(GtkLayoutManager* manager, GtkWidget* widget, int width, int height, int baseline) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.layout_manager.LayoutManager)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)manager);
          if (!_obj)
          {
            auto _klass = cast(GtkLayoutManagerClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)manager);
            if (_klass.allocate)
              return (cast(typeof(&_vfuncAllocateTramp))_klass.allocate)(manager, widget, width, height, baseline);
            return;
          }

          try
          {
            _obj.vfuncAllocate(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(void*)widget, No.Take), width, height, baseline);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.layout_manager.LayoutManager.vfuncAllocate");
          }
        }

        _klass.allocate = cast(typeof(_klass.allocate))&_vfuncAllocateTramp;
        break;
      }
      case "create_layout_child":
      {
        static extern(C) GtkLayoutChild* _vfuncCreateLayoutChildTramp(GtkLayoutManager* manager, GtkWidget* widget, GtkWidget* forChild) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.layout_manager.LayoutManager)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)manager);
          if (!_obj)
          {
            auto _klass = cast(GtkLayoutManagerClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)manager);
            if (_klass.createLayoutChild)
              return (cast(typeof(&_vfuncCreateLayoutChildTramp))_klass.createLayoutChild)(manager, widget, forChild);
            return typeof(return).init;
          }

          gid.gtk4.layout_child.LayoutChild _dretval;

          try
          {
            _dretval = _obj.vfuncCreateLayoutChild(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(void*)widget, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(void*)forChild, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.layout_manager.LayoutManager.vfuncCreateLayoutChild");
          }
          auto _retval = _dretval ? cast(GtkLayoutChild*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.createLayoutChild = cast(typeof(_klass.createLayoutChild))&_vfuncCreateLayoutChildTramp;
        break;
      }
      case "get_request_mode":
      {
        static extern(C) GtkSizeRequestMode _vfuncGetRequestModeTramp(GtkLayoutManager* manager, GtkWidget* widget) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.layout_manager.LayoutManager)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)manager);
          if (!_obj)
          {
            auto _klass = cast(GtkLayoutManagerClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)manager);
            if (_klass.getRequestMode)
              return (cast(typeof(&_vfuncGetRequestModeTramp))_klass.getRequestMode)(manager, widget);
            return typeof(return).init;
          }

          gid.gtk4.types.SizeRequestMode _dretval;

          try
          {
            _dretval = _obj.vfuncGetRequestMode(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(void*)widget, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.layout_manager.LayoutManager.vfuncGetRequestMode");
          }
          auto _retval = cast(GtkSizeRequestMode)_dretval;

          return _retval;
        }

        _klass.getRequestMode = cast(typeof(_klass.getRequestMode))&_vfuncGetRequestModeTramp;
        break;
      }
      case "measure":
      {
        static extern(C) void _vfuncMeasureTramp(GtkLayoutManager* manager, GtkWidget* widget, GtkOrientation orientation, int forSize, int* minimum, int* natural, int* minimumBaseline, int* naturalBaseline) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.layout_manager.LayoutManager)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)manager);
          if (!_obj)
          {
            auto _klass = cast(GtkLayoutManagerClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)manager);
            if (_klass.measure)
              return (cast(typeof(&_vfuncMeasureTramp))_klass.measure)(manager, widget, orientation, forSize, minimum, natural, minimumBaseline, naturalBaseline);
            return;
          }

          typeof(*minimum) _minimumNull;
          if (!minimum)
            minimum = &_minimumNull;

          typeof(*natural) _naturalNull;
          if (!natural)
            natural = &_naturalNull;

          typeof(*minimumBaseline) _minimumBaselineNull;
          if (!minimumBaseline)
            minimumBaseline = &_minimumBaselineNull;

          typeof(*naturalBaseline) _naturalBaselineNull;
          if (!naturalBaseline)
            naturalBaseline = &_naturalBaselineNull;

          try
          {
            _obj.vfuncMeasure(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(void*)widget, No.Take), orientation, forSize, *minimum, *natural, *minimumBaseline, *naturalBaseline);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.layout_manager.LayoutManager.vfuncMeasure");
          }
        }

        _klass.measure = cast(typeof(_klass.measure))&_vfuncMeasureTramp;
        break;
      }
      case "root":
      {
        static extern(C) void _vfuncRootTramp(GtkLayoutManager* manager) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.layout_manager.LayoutManager)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)manager);
          if (!_obj)
          {
            auto _klass = cast(GtkLayoutManagerClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)manager);
            if (_klass.root)
              return (cast(typeof(&_vfuncRootTramp))_klass.root)(manager);
            return;
          }

          try
          {
            _obj.vfuncRoot();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.layout_manager.LayoutManager.vfuncRoot");
          }
        }

        _klass.root = cast(typeof(_klass.root))&_vfuncRootTramp;
        break;
      }
      case "unroot":
      {
        static extern(C) void _vfuncUnrootTramp(GtkLayoutManager* manager) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.layout_manager.LayoutManager)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)manager);
          if (!_obj)
          {
            auto _klass = cast(GtkLayoutManagerClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)manager);
            if (_klass.unroot)
              return (cast(typeof(&_vfuncUnrootTramp))_klass.unroot)(manager);
            return;
          }

          try
          {
            _obj.vfuncUnroot();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.layout_manager.LayoutManager.vfuncUnroot");
          }
        }

        _klass.unroot = cast(typeof(_klass.unroot))&_vfuncUnrootTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk4.layout_manager.LayoutManager]
class LayoutManagerGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gtk4.layout_manager.LayoutManager]
final class LayoutManagerGidBuilder : LayoutManagerGidBuilderImpl!LayoutManagerGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  LayoutManager build() nothrow
  {
    return new LayoutManager(cast(void*)createGObject(LayoutManager._getGType), Yes.Take);
  }
}
