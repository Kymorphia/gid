/// Module for [DisplayManager] class
module gid.gdk4.display_manager;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.c.functions;
import gid.gdk4.c.types;
import gid.gdk4.display;
import gid.gdk4.types;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    Offers notification when displays appear or disappear.
    
    [gid.gdk4.display_manager.DisplayManager] is a singleton object.
    
    You can use [gid.gdk4.display_manager.DisplayManager.get] to obtain the [gid.gdk4.display_manager.DisplayManager]
    singleton, but that should be rarely necessary. Typically, initializing
    GTK opens a display that you can work with without ever accessing the
    [gid.gdk4.display_manager.DisplayManager].
    
    The GDK library can be built with support for multiple backends.
    The [gid.gdk4.display_manager.DisplayManager] object determines which backend is used
    at runtime.
    
    In the rare case that you need to influence which of the backends
    is being used, you can use `func@Gdk.set_allowed_backends`. Note
    that you need to call this function before initializing GTK.
    
    ## Backend-specific code
    
    When writing backend-specific code that is supposed to work with
    multiple GDK backends, you have to consider both compile time and
    runtime. At compile time, use the `GDK_WINDOWING_X11`, `GDK_WINDOWING_WIN32`
    macros, etc. to find out which backends are present in the GDK library
    you are building your application against. At runtime, use type-check
    macros like GDK_IS_X11_DISPLAY() to find out which backend is in use:
    
    ```c
    #ifdef GDK_WINDOWING_X11
      if (GDK_IS_X11_DISPLAY (display))
        {
          // make X11-specific calls here
        }
      else
    #endif
    #ifdef GDK_WINDOWING_MACOS
      if (GDK_IS_MACOS_DISPLAY (display))
        {
          // make Quartz-specific calls here
        }
      else
    #endif
      g_error ("Unsupported GDK backend");
    ```
*/
@gidGir("DisplayManager")
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
      Get builder for [gid.gdk4.display_manager.DisplayManager]
      Returns: New builder object
  */
  static DisplayManagerGidBuilder builder() nothrow
  {
    return new DisplayManagerGidBuilder;
  }

  /**
      Get `defaultDisplay` property.
      Returns: The default display.
  */
  @property gid.gdk4.display.Display defaultDisplay() nothrow
  {
    return getDefaultDisplay();
  }

  /**
      Set `defaultDisplay` property.
      Params:
        propval = The default display.
  */
  @property void defaultDisplay(gid.gdk4.display.Display propval) nothrow
  {
    setDefaultDisplay(propval);
  }

  /**
      Gets the singleton [gid.gdk4.display_manager.DisplayManager] object.
      
      When called for the first time, this function consults the
      `GDK_BACKEND` environment variable to find out which of the
      supported GDK backends to use (in case GDK has been compiled
      with multiple backends).
      
      Applications can use `funcset_allowed_backends` to limit what
      backends will be used.
      Returns: The global [gid.gdk4.display_manager.DisplayManager] singleton
  */
  static gid.gdk4.display_manager.DisplayManager get() nothrow
  {
    GdkDisplayManager* _cretval;
    _cretval = gdk_display_manager_get();
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.display_manager.DisplayManager)(cast(GdkDisplayManager*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the default [gid.gdk4.display.Display].
      Returns: a [gid.gdk4.display.Display]
  */
  gid.gdk4.display.Display getDefaultDisplay() nothrow
  {
    GdkDisplay* _cretval;
    _cretval = gdk_display_manager_get_default_display(cast(GdkDisplayManager*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.display.Display)(cast(GdkDisplay*)_cretval, No.Take);
    return _retval;
  }

  /**
      List all currently open displays.
      Returns: a newly
          allocated [gid.glib2.slist.SList] of [gid.gdk4.display.Display] objects
  */
  gid.gdk4.display.Display[] listDisplays() nothrow
  {
    GSList* _cretval;
    _cretval = gdk_display_manager_list_displays(cast(GdkDisplayManager*)this._cPtr);
    auto _retval = gSListToD!(gid.gdk4.display.Display, GidOwnership.Container)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Opens a display.
  
      Params:
        name = the name of the display to open
      Returns: a [gid.gdk4.display.Display], or null
          if the display could not be opened
  */
  gid.gdk4.display.Display openDisplay(string name = null) nothrow
  {
    GdkDisplay* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gdk_display_manager_open_display(cast(GdkDisplayManager*)this._cPtr, _name);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.display.Display)(cast(GdkDisplay*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets display as the default display.
  
      Params:
        display = a [gid.gdk4.display.Display]
  */
  void setDefaultDisplay(gid.gdk4.display.Display display) nothrow
  {
    gdk_display_manager_set_default_display(cast(GdkDisplayManager*)this._cPtr, display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null);
  }

  /**
      Connect to `DisplayOpened` signal.
  
      Emitted when a display is opened.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gdk4.display.Display display, gid.gdk4.display_manager.DisplayManager displayManager)`
  
          `display` the opened display (optional)
  
          `displayManager` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDisplayOpened(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gdk4.display.Display)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gdk4.display_manager.DisplayManager)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gdk4.display_manager.DisplayManager.displayOpened");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("display-opened", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gdk4.display_manager.DisplayManager]
class DisplayManagerGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `defaultDisplay` property.
      Params:
        propval = The default display.
      Returns: Builder instance for fluent chaining
  */
  T defaultDisplay(gid.gdk4.display.Display propval) nothrow
  {
    return setProperty("default-display", propval);
  }
}

/// Fluent builder for [gid.gdk4.display_manager.DisplayManager]
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
