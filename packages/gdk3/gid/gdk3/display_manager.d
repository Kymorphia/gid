/// Module for [DisplayManager] class
module gid.gdk3.display_manager;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk3.c.functions;
import gid.gdk3.c.types;
import gid.gdk3.display;
import gid.gdk3.types;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    The purpose of the #GdkDisplayManager singleton object is to offer
    notification when displays appear or disappear or the default display
    changes.
    
    You can use [gid.gdk4.display_manager.DisplayManager.get] to obtain the #GdkDisplayManager
    singleton, but that should be rarely necessary. Typically, initializing
    GTK+ opens a display that you can work with without ever accessing the
    #GdkDisplayManager.
    
    The GDK library can be built with support for multiple backends.
    The #GdkDisplayManager object determines which backend is used
    at runtime.
    
    When writing backend-specific code that is supposed to work with
    multiple GDK backends, you have to consider both compile time and
    runtime. At compile time, use the #GDK_WINDOWING_X11, #GDK_WINDOWING_WIN32
    macros, etc. to find out which backends are present in the GDK library
    you are building your application against. At runtime, use type-check
    macros like GDK_IS_X11_DISPLAY() to find out which backend is in use:
    
    ## Backend-specific code ## {#backend-specific}
    
    ```c
    #ifdef GDK_WINDOWING_X11
      if (GDK_IS_X11_DISPLAY (display))
        {
          // make X11-specific calls here
        }
      else
    #endif
    #ifdef GDK_WINDOWING_QUARTZ
      if (GDK_IS_QUARTZ_DISPLAY (display))
        {
          // make Quartz-specific calls here
        }
      else
    #endif
      g_error ("Unsupported GDK backend");
    ```
*/
class DisplayManager : gid.gobject2.object.ObjectWrap
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
    return cast(void function())gdk_display_manager_get_type != &gidSymbolNotFound ? gdk_display_manager_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GdkDisplayManager";
  }

  /** Returns `this`, for use in `with` statements. */
  override DisplayManager self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gdk3.display_manager.DisplayManager]
      Returns: New builder object
  */
  static DisplayManagerGidBuilder builder() nothrow
  {
    return new DisplayManagerGidBuilder;
  }

  /** */
  @property gid.gdk3.display.Display defaultDisplay() nothrow
  {
    return getDefaultDisplay();
  }

  /** */
  @property void defaultDisplay(gid.gdk3.display.Display propval) nothrow
  {
    setDefaultDisplay(propval);
  }

  /**
      Gets the singleton #GdkDisplayManager object.
      
      When called for the first time, this function consults the
      `GDK_BACKEND` environment variable to find out which
      of the supported GDK backends to use (in case GDK has been compiled
      with multiple backends). Applications can use [gid.gdk4.global.setAllowedBackends]
      to limit what backends can be used.
      Returns: The global #GdkDisplayManager singleton;
            [gid.gdk3.global.parseArgs], [gid.gdk3.global.init_], or [gid.gdk3.global.initCheck] must have
            been called first.
  */
  static gid.gdk3.display_manager.DisplayManager get() nothrow
  {
    GdkDisplayManager* _cretval;
    _cretval = gdk_display_manager_get();
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.display_manager.DisplayManager)(cast(GdkDisplayManager*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the default #GdkDisplay.
      Returns: a #GdkDisplay, or null if
            there is no default display.
  */
  gid.gdk3.display.Display getDefaultDisplay() nothrow
  {
    GdkDisplay* _cretval;
    _cretval = gdk_display_manager_get_default_display(cast(GdkDisplayManager*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.display.Display)(cast(GdkDisplay*)_cretval, No.Take);
    return _retval;
  }

  /**
      List all currently open displays.
      Returns: a newly
            allocated #GSList of #GdkDisplay objects. Free with [gid.glib2.slist.SList.free]
            when you are done with it.
  */
  gid.gdk3.display.Display[] listDisplays() nothrow
  {
    GSList* _cretval;
    _cretval = gdk_display_manager_list_displays(cast(GdkDisplayManager*)this._cPtr);
    auto _retval = gSListToD!(gid.gdk3.display.Display, GidOwnership.Container)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Opens a display.
  
      Params:
        name = the name of the display to open
      Returns: a #GdkDisplay, or null if the
            display could not be opened
  */
  gid.gdk3.display.Display openDisplay(string name) nothrow
  {
    GdkDisplay* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _cretval = gdk_display_manager_open_display(cast(GdkDisplayManager*)this._cPtr, _name);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.display.Display)(cast(GdkDisplay*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets display as the default display.
  
      Params:
        display = a #GdkDisplay
  */
  void setDefaultDisplay(gid.gdk3.display.Display display) nothrow
  {
    gdk_display_manager_set_default_display(cast(GdkDisplayManager*)this._cPtr, display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null);
  }

  /**
      Connect to `DisplayOpened` signal.
  
      The ::display-opened signal is emitted when a display is opened.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gdk3.display.Display display, gid.gdk3.display_manager.DisplayManager displayManager)`
  
          `display` the opened display (optional)
  
          `displayManager` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDisplayOpened(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gdk3.display.Display)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gdk3.display_manager.DisplayManager)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gdk3.display_manager.DisplayManager.displayOpened");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("display-opened", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gdk3.display_manager.DisplayManager]
class DisplayManagerGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T defaultDisplay(gid.gdk3.display.Display propval) nothrow
  {
    return setProperty("default-display", propval);
  }
}

/// Fluent builder for [gid.gdk3.display_manager.DisplayManager]
final class DisplayManagerGidBuilder : DisplayManagerGidBuilderImpl!DisplayManagerGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DisplayManager build() nothrow
  {
    return new DisplayManager(cast(void*)createGObject(DisplayManager._getGType), Yes.Take);
  }
}
